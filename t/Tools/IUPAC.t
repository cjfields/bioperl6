use v6;

BEGIN {
    @*INC.push('./lib');
}

use Test;
plan 4;
eval_lives_ok 'use Bio::Tools::IUPAC', 'Can use Bio::Tools::IUPAC';
eval_lives_ok 'use Bio::PrimarySeq', 'Can use Bio::PrimarySeq';

use Bio::Tools::IUPAC;
use Bio::PrimarySeq; 

# test IUPAC

my $ambiseq = Bio::PrimarySeq.new(seq => 'ARTCGTTGR',
			    alphabet => 'dna'); 

my $stream  = Bio::Tools::IUPAC.new(seq => $ambiseq);
is $stream.count(), 4;

my $b = 1; 
while (my $uniqueseq = $stream.next_seq()) {
    if ( ! $uniqueseq ~~ Bio::PrimarySeq ) {
        $b = 0;
        last; # no point continuing if we get here
    }
}
ok $b;
