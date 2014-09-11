subset RangeTest of Str where .lc eq any <ignore weak strong>;

role Bio::Role::Range;

role doc { has $.doc is rw };
multi trait_mod:<is>(Attribute $a, doc, $arg) {
    $a.container.VAR does doc($arg);
}

has $.dog is doc('barks') is rw;
has @.birds is doc('tweet');
has %.cows is doc('moooo');

has Int $.start               is rw;
has Int $.end                 is rw;
has Int $.strand              is rw;

method length {
    die "Must define both start and end" if !$!start.defined | !$!end.defined;
    die "End must be larger than start" if $!start > $!end;
    return $!end - $!start + 1;
}

method overlaps (Bio::Role::Range $range, RangeTest :$test = 'ignore') {
    (self!teststranded($range, test => $test) &&
        !(($!start > $range.end || $!end < $range.start)))
}

method contains (Bio::Role::Range $range, RangeTest :$test = 'ignore') {
    (self!teststranded($range, :$test) &&
        $range.start >= $!start && $range.end <= $!end)
}

method equals (Bio::Role::Range $range, RangeTest :$test = 'ignore')  {
    (self!teststranded($range, :test($test)) &&
        ($!start == $range.start && $!end == $range.end))
}

method !teststranded (Bio::Role::Range $self: Bio::Role::Range $r, RangeTest :$test) {
    my ($s1, $s2) = ($!strand, $r.strand);
    given $test {
        when 'ignore' {
            return True
        }
        when 'weak' {
            if $s1 == 0 || $s2 == 0 || $s1 == $s2 {
                return True
            }
        }
        when 'strong' {
            if $s1 != 0 && $s1 == $s2 {
                return True
            }
        }
    }
    return False;
}

method intersection ( *@ranges, RangeTest :$test = 'ignore') {
    my $intersect;
    while @ranges > 0 {
        $intersect //= self;

        my $compare = @ranges.shift;

        last if !$compare.defined;

        if !$compare!teststranded($intersect, test => $test) {
            return; # this returns a Failure (via the signature)
        }

        my $start = ($intersect.start, $compare.start).max; # larger of the 2 starts
        my $end = ($intersect.end, $compare.end).min;   # smaller of the 2 ends
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

method union (*@ranges, RangeTest :$test = 'ignore') {
    my $union_strand = self.strand;  # Strand for the union range object.

    # beware the hyperoperator!
    $union_strand = 0 if any(@ranges».strand) != $union_strand;

    @ranges.unshift(self);

    my $max = @ranges.max: { $^a.end <=> $^b.end };
    my $min = @ranges.min: { $^a.start <=> $^b.start };

    # what if the end is undef...
    return self.new(start  => $min.start,
                    end    => $max.end,
                    strand => $union_strand);
}

# this should have a return type of Array of Bio::Role::Range, but NYI
method subtract (Bio::Role::Range $range, RangeTest :$test = 'ignore') {
    if !(self!teststranded($range, :$test)) || !self.overlaps($range, :$test) {
        return self
    }
    # Subtracts everything (empty Range of length = 0 and strand = 0
    if (self.equals($range, :$test) || $range.contains(self, :$test)) {
        return self.new(start => 0, end => 0, strand => 0);
    }

    # TODO: oddity with named parameters, see note above
    my $int = self.intersection($range, :$test);

    my ($start, $end, $strand) = ($int.start, $int.end, $int.strand);

    #Subtract intersection from $self
    my @outranges = ();
    if ($!start < $start) {
        @outranges.push(
            self.new(
                start   => $!start,
                end     => $start - 1,
                strand  => $!strand,
               ));
    }
    if ($!end > $end) {
        @outranges.push(
            self.new(
                start   => $end + 1,
                end     => $!end,
                strand  => $!strand,
               ));
    }
    return @outranges;
}

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
