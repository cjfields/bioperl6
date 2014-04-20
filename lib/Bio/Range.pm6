subset RangeTest where .lc eq any <ignore weak strong>;

class Bio::Range is Range {

has Int $.strand;

#our method start (Int $start) {
#    if ($start.defined) {
#        self.range.min = $start;
#    }
#    self.range.min;
#}
#
#our method end (Int $end?) {
#    if ($end.defined) {
#        self.range.max = $end;
#    }
#    self.range.max;
#}

our Int method length {
    die "Must define both start and end" if !self.start.defined | !self.end.defined;
    die "End must be larger than start" if $.start > $.end;
    return self.end - self.start + 1;
}

our Bool method overlaps (Bio::Range $range, RangeTest $test = 'ignore') {
    (self!teststranded($range, $test) && !((self.start() > $range.end() || self.end() < $range.start())))
    ?? True !! False;
}

our Bool method contains (Bio::Range $range, RangeTest $test = 'ignore') {
    (self!teststranded($range, $test) && $range.start() >= self.start() && $range.end() <= self.end())
    ?? True !! False;
}

our Bool method equals (Bio::Range $range, RangeTest $test = 'ignore')  {
    (self!teststranded($range, $test) && self.start() == $range.start() && self.end() == $range.end())
    ?? True !! False;
}

our Bool method !teststranded (Bio::Range $r, RangeTest $st) {
    given $st {
        when 'ignore' {
            return True
        }
        when 'weak' {
            if self.strand == 0 || $r.strand == 0 || self.strand == $r.strand {
                return True
            }
        }
        when 'strong' {
            if self.strand != 0 && self.strand == $r.strand {
                return True
            }
        }
    }
    return False;
}

# TODO:
# seeing an error when not using the named parameter version for test in
# .union() and .intersection:
#
# Method '!teststranded' not found for invocant of class 'Str'
#
# May be rakudobug, may be the signature (and me), needs checking

our Bio::Range method intersection ( RangeTest :$test = 'ignore', *@ranges of Bio::Range) {
    my $intersect;
    while @ranges > 0 {
        $intersect //= self;
        
        my $compare = @ranges.shift;
        
        last if !$compare.defined;
        
        say $compare.WHAT;
        
        if !$compare!teststranded($intersect, test => $test) {
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

our Bio::Range method union ( RangeTest :$test = 'ignore', *@ranges of Bio::Range ) {
    my $union_strand = self.strand;  # Strand for the union range object.
    
    # beware the hyperoperator!
    $union_strand = 0 if any(@ranges».strand) != $union_strand;
    
    # what if the end is undef...
    return self.new(start  => (self, @ranges).min({$_.start}).start,
                    end    => (self, @ranges).max({$_.end}).end,
                    strand => $union_strand);
}

# this should have a return type of Array of Bio::Range, but NYI
our method subtract ( Bio::Range $range, RangeTest $test = 'ignore') {
    if !(self!teststranded($range, test => $test)) || !self.overlaps($range) {
        return self 
    }

    # Subtracts everything (empty Range of length = 0 and strand = 0 
    if (self.equals($range) || $range.contains(self)) {
        return self.new(start => 0, end => 0, strand => 0);
    }
    
    # TODO: oddity with named parameters, see note above
    my $int = self.intersection($range, $test);
    
    my ($start, $end, $strand) = ($int.start, $int.end, $int.strand);
    
    #Subtract intersection from $self
    my @outranges = ();
    if (self.start < $start) {
        @outranges.push( 
            self.new(
                start   => self.start,
                end     => $start - 1,
                strand  => self.strand,
               ));
    }
    if (self.end > $end) {
        @outranges.push(
            self.new(
                start   => $end + 1,
                end     => self.end,
                strand  => self.strand,
               ));   
    }
    return @outranges;
}

our method Str {
    '(' ~ $.start ~ ', ' ~ $.end ~ ')' ~ ' strand=' ~ $.strand;
}

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

