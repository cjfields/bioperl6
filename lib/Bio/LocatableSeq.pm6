use Bio::PrimarySeqI;
use Bio::Range;

class Bio::PrimarySeq {

does Bio::PrimarySeqI;
does Bio::RangeI;
# set up defaults when supported via Rakudo (not implemented yet)

method start { return 1 }

method end { return self.seq.chars }

method strand { return 1 }

method length { return self.seq.chars }

method subseq (Int :$start = 1, Int :$end = self.length) {
    # sequences are 1-based (not 0-based)
    if $start > $end {
        die 'Start position must be less than end position';
    }
    if $start < 1 || $end > self.length {
        die 'Start position must be less than end position';
    }
    return self.seq.substr($start - 1, $end - $start + 1);
}

method trunc (Int :$start = 1, Int :$end = self.length) {
    my $newseq = self.clone();
    $newseq.seq = self.subseq(start => $start, end => $end);
    return $newseq;
}

method translate { ... }
method revcom { ... }

};
