use Bio::RangeI;

our subset Bio::Strand of Int where { $_ == 0 | 1 | -1 };

class Bio::Range does Bio::RangeI {
    
    has Int $.start  is rw;
    has Int $.end    is rw;
    has Bio::Strand $.strand is rw;

    method new (Int :$start?, Int :$end?, Bio::Strand :$strand?) {
        if $start.defined && $end.defined {
            die "Start must be <= end" unless $start <= $end;
        }
        return Bio::Range.bless(start => $start, end => $end, strand => $strand);
    }

    method length {
        if !self.start || !self.end {
            die "Both start and end must be defined";
        }
        return self.end - self.start + 1
    }
    
    
    # next three could probably be condensed down or curried
    method overlaps (Bio::Range :$range, Str :$test where {$^test eq 'strong' | 'weak' | 'ignore'} = 'ignore') {
        if self!comp_strandedness($range, $test) {
            return !(self.start > $range.end || self.end < $range.start);
        }
    }
    
    method contains (Bio::Range :$range, Str :$test where {$^test eq 'strong' | 'weak' | 'ignore'} = 'ignore') {
        if self!comp_strandedness($range, $test) {
            return $range.start >= self.start && $range.end <= self.end
        }
    }

    method equals (Bio::Range :$range, Str :$test where {$^test eq 'strong' | 'weak' | 'ignore'} = 'ignore') {
        if self!comp_strandedness($range, $test) {
            return self.start === $range.start && self.end == $range.end
        }
    }

    method intersection (Bio::RangeI *@ranges,
        Str :$test where {$^test eq 'strong' | 'weak' | 'ignore'} = 'ignore') {
        push(@ranges, self);
        
        die "Need at least 2 Bio::RangeI" unless @ranges >= 2;
        
        my $intersect;
        while (@ranges > 0) {
            unless ($intersect) {
                $intersect = @ranges.shift;
            }

            my $compare = @ranges.shift;
            return unless $compare!comp_strandedness($intersect, $test);

            my @starts = ($intersect.start, $compare.start).sort({$^a <=> $^b});
            my @ends   = ($intersect.end,   $compare.end).sort({$^a <=> $^b});

            my $start = @starts.pop; # larger of the 2 starts
            my $end   = @ends.shift; # smaller of the 2 ends

            my $intersect_strand;    # strand for the intersection
            if ($intersect.strand.defined && $compare.strand.defined && $intersect.strand == $compare.strand) {
                $intersect_strand = $compare.strand;
            } else {
                $intersect_strand = 0;
            }

            if ($start > $end) {
                return;
            } else {
                $intersect = self.new(start  => $start,
                                    end    => $end,
                                    strand => $intersect_strand);
            }
        }
        return $intersect;
    }    
    
    method union (Bio::RangeI *@ranges,
        Str :$test where {$^test eq 'strong' | 'weak' | 'ignore'} = 'ignore') {
        @ranges.unshift(self);

        my @start = @ranges.map({ $_.start }).sort({$^a <=> $^b});
        my @end   = @ranges.map({ $_.end   }).sort({$^a <=> $^b});
        my $start = @start.shift;
        while( !defined $start ) {
            $start = @start.shift;
        }
        my $end = @end.pop;
        my $union_strand;  # Strand for the union range object.
        for @ranges -> $r {
            if(!$union_strand.defined) {
                $union_strand = $r.strand;
                next;
            } else {
                if(!($r.strand).defined or $union_strand ne $r.strand) {
                    $union_strand = 0;
                    last;
                }
            }
        }
        return self.new(start => $start,
                        end   => $end,
                        strand => $union_strand);
    }

    # private
    my method comp_strandedness (Bio::Range $range, Str $test) {
        die "Bio::Range must define start/end"        unless self.start   & self.end;
        die "Passed Bio::Range must define start/end" unless $range.start & $range.end;
        given $test {
            when $test eq 'ignore' {
                return True
            }
            when $test eq 'weak' {
                #("Stranded equiv? " ~ (self.strand === $range.strand)).say;
                #("Self equiv 0  ? " ~ (self.strand === 0)).say;
                #("Arg  equiv 0  ? " ~ ($range.strand === 0)).say;
                return self.strand === $range.strand || self.strand === 0 || $range.strand === 0;
            }
            when $test eq 'strong' {
                return self.strand === $range.strand;
            }
        }
    }
    
    # simple identity, may be changed to relect uniqueness btwn instances
    method WHICH {
        return False if !defined(self.start | self.end | self.strand);
        return self.start ~ '-' ~ self.end ~ '|' ~ self.strand;
    }    
}
