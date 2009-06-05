# almost wonder if these can be implemented in terms of Perl6's builtin Range
# would be simpler, but don't want to obfuscate...

role Bio::Role::Range {

has $.start               is rw where {$_ <= $.end  };
has $.end                 is rw where {$_ >= $.start};
has $.strand              is rw = 0;

enum StrandTests = <ignore weak strong>;

our Int method length {
	die "Must define both start and end" if !self.start.defined && self.end.defined;
	die "End must be larger than start" if self.start > self.end;
	return self.end - self.start + 1;
}

our Bool method overlaps (Bio::Role::Range :$range,
						:$test  where { $test.lc eq any <ignore weak strong> } = 'ignore')
{
    (self!teststranded($range, $test) && !((self.start() > $range.end() || self.end() < $range.start())))
    ?? True !! False;
}

our Bool method contains (Bio::Role::Range :$range,
						:$test  where { $test.lc eq any <ignore weak strong> } = 'ignore')
{
    (self!teststranded($range, $test) && $range.start() >= self.start() && $range.end() <= self.end())
    ?? True !! False;
}


our Bool method equals (Bio::Role::Range :$range,
						:$test  where { $test.lc eq any <ignore weak strong> } = 'ignore') 
{
	(self!teststranded($range, $test) && self.start() == $range.start() && self.end() == $range.end())
	?? True !! False;
}

our Bool method !teststranded ($r, $st) {
	given $st {
		when 'ignore' {
			return True			
		}
		when 'weak' {
			(self.strand == 0 || $r.strand == 0 || self.strand == $r.strand)
				?? return True !! return False;
		}
		when 'strong' {
			(self.strand != 0 && self.strand == $r.strand)
				?? return True !! return False;
		}
	}
}

# TODO:
# seeing an error when not using the named parameter version for test in
# .union() and .intersect:
#
# Method '!teststranded' not found for invocant of class 'Str'
#
# May be rakudobug, may be the signature (and me), needs checking

our Bio::Role::Range method intersection (
	:$test where { $test.lc eq any <ignore weak strong> } = 'ignore',
	*@ranges of Bio::Role::Range
)
{
    my $intersect;
    while @ranges > 0 {
		$intersect //= self;
		
        my $compare = @ranges.shift;
        
        last if !$compare.defined;
        
        if !$compare!teststranded($intersect, $test) {
            return; # this returns a Failure (via the signature)
        }

        my $start = ($intersect.start(), $compare.start()).max; # larger of the 2 starts
        my $end = ($intersect.end(), $compare.end()).min;   # smaller of the 2 ends
		my $intersect_strand = ($intersect.strand == $compare.strand) ??
			$compare.strand !! 0;

        if $start > $end {
            return; # this returns a Failure (via the signature)
        } else {
            $intersect = self.new(start  => $start,
                                  end    => $end,
                                  strand => $intersect_strand);
        }
    }
    return $intersect;
}

our Bio::Role::Range method union (
	:$test where { $test.lc eq any <ignore weak strong> } = 'ignore',
	*@ranges of Bio::Role::Range
)
{
    my $union_strand = self.strand;  # Strand for the union range object.
	
	# beware the hyperoperator!
	$union_strand = 0 if any(@ranges».strand) != $union_strand;
	
	# what if the end is undef...
    return self.new(start  => (self, @ranges).min({$_.start}).start,
					end    => (self, @ranges).max({$_.end}).end,
					strand => $union_strand);
}

our method subtract (Bio::Role::Range :$range,
	:$test where { $test.lc eq any <ignore weak strong> } = 'ignore')
{
    return self if !(self!teststranded($range, $test)) || !self.overlaps($range);

    # Subtracts everything (empty Range of length = 0 and strand = 0 
    if (self.equals($range) || $range.contains(self)) {
        return self.new(start => 0, end => 0, strand => 0);
    }
	
	# TODO: oddity with named parameters, see note above
    my $int = self.intersection($range, test => $test);
    my ($start, $end, $strand) = ($int.start, $int.end, $int.strand);
    
    #Subtract intersection from $self
    my @outranges = ();
    if (self.start < $start) {
        push(@outranges, 
			self.new(
                start	=> self.start,
			    end		=> $start - 1,
			    strand	=> self.strand,
			   ));
    }
    if (self.end > $end) {
        push(@outranges, 
			self.new(
				start 	=> $end + 1,
				end		=> self.end,
			    strand	=> self.strand,
			   ));   
    }
    return @outranges; 
}

# leaving as abstract for now (we probably need to define this in the
# root class for stringifying data

our Str method to_string
{ ... }

};

=begin start

  Title   : start
  Usage   : $start = $range.start();
  Function: get/set the start of this range
  Returns : the start of this range
  Args    : optionally allows the start to be set
            using $range.start = $start

=end start

=begin end

  Title   : end
  Usage   : $end = $range.end();
  Function: get/set the end of this range
  Returns : the end of this range
  Args    : optionally allows the end to be set
            using $range.end = $end

=end end

=begin length

  Title   : length
  Usage   : $length = $range.length();
  Function: get/set the length of this range
  Returns : the length of this range
  Args    : optionally allows the length to be set
             using $range.length = $length

=end length

=begin strand

  Title   : strand
  Usage   : $strand = $range.strand;
            $range.strand = 1;
  Function: get/set the strand of this range
  Returns : the strandedness (-1, 0, +1)
  Args    : optionally allows the strand to be set
            using $range->strand($strand)

=end strand

