use v6;
BEGIN {
    @*INC.push('./lib');
}

use Test;
plan 44;
eval_lives_ok 'use Bio::LiveSeq::Mutation', 'Can use Bio::LiveSeq::Mutation';

use Bio::LiveSeq::Mutation;


my $a = Bio::LiveSeq::Mutation.new();
ok defined $a;

$a.seq('aaa');
is $a.seq, 'aaa';

$a.seqori('ggg');
is $a.seqori, 'ggg';

$a.pos(-4);
is $a.pos, -4;

$a.pos(5);
is $a.pos, 5;

is($a.len, 3);

$a.len(9);
is($a.len, 9);

$a.transpos(55);
is $a.transpos, 55;

$a.issue(1);
is $a.issue, 1;

$a.label(57);
is $a.label, '57';

$a.prelabel(57);
is $a.prelabel, '57';

$a.postlabel(57);
is $a.postlabel, '57';

$a.lastlabel(57);
is $a.lastlabel, '57';

#constuctor test
my $b = Bio::LiveSeq::Mutation.new(seq=>'AC',
				 seqori => 'GG',
				 pos => 5,
				 len => 2,
				 );
ok  defined $b;
is $b.seqori, 'GG';
is $b.len, 2;
is $b.seq, 'AC';
is $b.pos, 5;




# full descrition of a point mutation
my $mutation1a = Bio::LiveSeq::Mutation.new( seq => 'A',
 					      seqori => 'T',
 					      pos  => 100,
 					      len => 1 # optional, defaults to length(seq)
 					     );
ok defined $mutation1a;
is $mutation1a.seqori, 'T';
is $mutation1a.len, 1;
is $mutation1a.seq, 'A';
is $mutation1a.pos, 100;

# minimal information for a point mutation
my  $mutation1b = Bio::LiveSeq::Mutation.new( seq => 'A',
 					      pos  => 100
 					      );
ok defined $mutation1b;
is $mutation1b.seqori, '';
is $mutation1b.len, 1;
is $mutation1b.seq, 'A';
is $mutation1b.pos, 100;

# insertion
my $mutation2 = Bio::LiveSeq::Mutation.new( seq => 'ATT',
 					     pos  => 100,
 					     len => 0
 					     );
ok defined $mutation2;
is $mutation2.seqori, '';
is $mutation2.len, 3;
is $mutation2.seq, 'ATT';
is $mutation2.pos, 100;

# deletion
my $mutation3 = Bio::LiveSeq::Mutation.new( seq => '',  # optional
 					     seqori => 'TTG',  # optional
 					     pos  => 100,
 					     len => 3
 					     );
ok defined $mutation3;
is $mutation3.seqori, 'TTG';
is $mutation3.len, 3;
is $mutation3.seq, '';
is $mutation3.pos, 100;


# complex
my  $mutation4 = Bio::LiveSeq::Mutation.new( seq => 'CC', 
 					     seqori => 'TTG',  # optional
 					     pos  => 100,
 					     len => 3
 					     );
ok defined $mutation4;
is $mutation4.seqori, 'TTG';
is $mutation4.len, 3;
is $mutation4.seq, 'CC';
is $mutation4.pos, 100;
