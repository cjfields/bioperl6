use v6;

use Test;

use lib './lib';

eval_lives_ok 'use Bio::PrimarySeq', 'Can use Bio::PrimarySeq';

use Bio::PrimarySeq;

my $seq = Bio::PrimarySeq.new(
    seq                     => 'TTGGTGGCGTCAACT',
    display_id              => 'new-id',
    alphabet                => dna,
    accession        => 'X677667',
    description             => 'Sample Bio::Seq object'
);

ok($seq ~~ Bio::PrimarySeq, 'Bio::PrimarySeq object');


is($seq.accession(), 'X677667','Retrieving accession number');

is($seq.seq(),'TTGGTGGCGTCAACT','Retrieving sequence');
is($seq.display_id,'new-id','Retrieving display_id');

is($seq.alphabet,dna,'Retrieving alphabet');
is($seq.alphabet.perl, 'SequenceType::dna', 'Alphabet is enum');

is($seq.is_circular, False,'Determining if circular');
$seq.is_circular=True;
is($seq.is_circular, True,'Setting circular to True');

# check IdentifiableI and DescribableI interfaces
ok($seq ~~ Bio::Role::Identify,'Has a Bio::Role::Identify');
ok($seq ~~ Bio::Role::Describe,'Has a Bio::Role::Describe');

# make sure all methods are implemented
is(($seq.authority="bioperl.org") , "bioperl.org",'Setting authority');
is(($seq.namespace='t'),'t','Setting namespace');
is($seq.namespace, "t",'Retrieving namespace');
is(($seq.version=0), 0,'Setting version number');
is($seq.lsid_string(), "bioperl.org:t:X677667",'Retrieving lsid_string');
is($seq.namespace_string(), "t:X677667.0",'Retrieving namespace_string');
$seq.version=47;
is($seq.version(), 47,'Retrieving version number');
is($seq.namespace_string(), "t:X677667.47",'Retrieving namespace_string');
is($seq.description(), 'Sample Bio::Seq object','Has correct description');
is($seq.display_name(), "new-id",'Has correct display_name');

#
# length (gapless)
#

is($seq.length, 15, 'seq length');

#
# revcom
#

my $rev = $seq.revcom();
ok($rev ~~ Bio::PrimarySeq, 'Bio::PrimarySeq object');

is($rev.seq(), 'AGTTGACGCCACCAA', 'revcom() failed, was ' ~ $rev.seq());

is($rev.display_id, 'new-id');
is( $rev.alphabet(),    dna, 'alphabet copied through revcom' );

is( $rev.namespace, 't', 'namespace copied through revcom' );
is( $rev.namespace_string(),
    "t:X677667.47", 'namespace_string copied through revcom' );
is( $rev.is_circular, True,     'is_circular copied through revcom' );

# subseq
is( $seq.subseq(start => 2, end => 5, strand => 1), 'TGGT', 'subseq normal');
is( $seq.subseq(start => 2, end => 5, strand => -1), 'ACCA', 'subseq, revcom' );

#my $location = Bio::Role::Location::Simple.new(
#    start  => 2,
#    end    => 5,
#    strand => -1
#);

#is( $seq.subseq($location), 'ACCA' );

#my $splitlocation = Bio::Role::Location::Split.new();
#$splitlocation.add_sub_Location(
#    Bio::Role::Location::Simple.new(
#        start  => 1,
#        end    => 4,
#        strand => 1
#    )
#    );
#
#$splitlocation.add_sub_Location(
#    Bio::Role::Location::Simple.new(
#        start  => 7,
#        end    => 12,
#        strand => -1
#    )
#);
#
#is( $seq.subseq($splitlocation), 'TTGGTGACGC' );
#
#my $fuzzy = Bio::Role::Location::Fuzzy.new(
#    start  => '<3',
#    end    => '8',
#    strand => 1
#);
#
#is( $seq.subseq($fuzzy), 'GGTGGC' );
#
#my $trunc = $seq.trunc( 1, 4 );
#ok($trunc ~~ Bio::PrimarySeq, 'Bio::PrimarySeq object');
#is($trunc.seq(),'TTGG',"Expecting TTGG. Got " ~ $trunc.seq());
#
#$trunc = $seq.trunc($splitlocation);
#ok($trunc ~~ Bio::PrimarySeq, 'Bio::PrimarySeq object');
#is( $trunc.seq(), 'TTGGTGACGC' );
#
#$trunc = $seq.trunc($fuzzy);
#ok($trunc ~~ Bio::PrimarySeq, 'Bio::PrimarySeq object');
#is( $trunc.seq(), 'GGTGGC' );


#
# Translate
#

my $aa = $seq.translate();    # TTG GTG GCG TCA ACT
is($aa.seq, 'LVAST', "Translation: " ~ $aa.seq);

# believe we are not going to support the old non named parameter format
# tests for non-standard initiator codon coding for
# M by making translate() look for an initiator codon and
# terminator codon ("complete", the 5th argument below)

# TODO: need to work out what we're testing; should focus on alternate starts
# and not the old semantics of positional args, which won't be supported

#$seq.seq ='TTGGTGGCGTCAACTTAA';    # TTG GTG GCG TCA ACT TAA
#$aa = $seq.translate( start => 'ttg' );
#is($aa.seq, 'MVAST', "Translation: " ~ $aa.seq);

# same test as previous, but using named parameter
$aa = $seq.translate( complete => True );
is($aa.seq, 'MVAST', "Translation: " ~ $aa.seq);

# find ORF, ignore codons outside the ORF or CDS
$seq.seq = 'TTTTATGGTGGCGTCAACTTAATTT';    # ATG GTG GCG TCA ACT
$aa = $seq.translate( orf => True );
is($aa.seq, 'MVAST*', "Translation: " ~ $aa.seq);

## smallest possible ORF
$seq.seq ="ggggggatgtagcccc";             # atg tga
$aa = $seq.translate( orf => True );
is($aa.seq, 'M*', "Translation: " ~ $aa.seq);

# same as previous but complete, so * is removed
$aa = $seq.translate(
    orf      => True,
    complete => True
);
is($aa.seq, 'M', "Translation: " ~ $aa.seq);

# ORF without termination codon
# should warn, let's change it into throw for testing

# TODO: check exceptions here
#$seq.verbose(2);
#$seq.seq("ggggggatgtggcccc");    # atg tgg ccc
#eval { $seq.translate( orf => 1 ); };
#
#if $@ {
#    like( $@, qr/atgtggcccc\n/ );
#    $seq.verbose(-1);
#    $aa = $seq.translate( orf => 1 );
#    is($aa.seq, 'MWP', "Translation: " ~ $aa.seq;
#}
#$seq.verbose(0);

# use non-standard codon table where terminator is read as Q
$seq.seq = 'ATGGTGGCGTCAACTTAG';    # ATG GTG GCG TCA ACT TAG

my $ct =  Bio::Tools::CodonTable.new(id => 6);
$aa = $seq.translate( codonTable => $ct );

is($aa.seq, 'MVASTQ' , "Translation: " ~ $aa.seq );

# insert an odd character instead of terminating with *
$aa = $seq.translate( terminator => 'X' );
is($aa.seq, 'MVASTX' , "Translation: " ~ $aa.seq );

# change frame from default
$aa = $seq.translate( frame => 1 );    # TGG TGG CGT CAA CTT AG
is($aa.seq, 'WWRQL' , "Translation: " ~ $aa.seq );

$aa = $seq.translate( frame => 2 );    # GGT GGC GTC AAC TTA G
is($aa.seq, 'GGVNL' , "Translation: " ~ $aa.seq );

# TTG is initiator in Standard codon table? Afraid so.
$seq.seq ="ggggggttgtagcccc";           # ttg tag
$aa = $seq.translate( orf => True );
is($aa.seq, 'L*' , "Translation: " ~ $aa.seq );

# Replace L at 1st position with M by setting complete to 1
$seq.seq = "ggggggttgtagcccc";           # ttg tag
$aa = $seq.translate(
    orf      => True,
    complete => True
);
is($aa.seq, 'M' , "Translation: " ~ $aa.seq );

# Ignore non-ATG initiators (e.g. TTG) in codon table
$seq.seq ="ggggggttgatgtagcccc";        # atg tag
$aa = $seq.translate(
    orf      => True,
    start    => "atg",
    complete => True
);
is($aa.seq, 'M' , "Translation: " ~ $aa.seq );
$seq.seq = 'TTGGTGGCG?CAACT';

# test for character '?' in the sequence string
is($seq.seq, 'TTGGTGGCG?CAACT');

# test for some aliases
$seq = Bio::PrimarySeq.new(
    id          => 'aliasid' ,
    description => 'Alias desc'
);
is( $seq.description, 'Alias desc' );
is( $seq.desc('new desc'), 'new desc' );
is( $seq.display_id,  'aliasid' );

# test that x's are ignored and n's are assumed to be dna no longer true!
# See Bug 2438. There are protein sequences floating about which are all 'X'
# (unknown aa)

$seq.seq = 'atgxxxxxx';
$seq.set_alphabet;
is( $seq.alphabet, 'protein' );

$seq.seq = 'atgnnnnnn';
$seq.set_alphabet;
is( $seq.alphabet, dna );

## Bug #2864:

# Note this is now type-checked as a string, so we need to stringify Ints
$seq = Bio::PrimarySeq.new( display_id => ~ 0, seq => 'GATC' );

is($seq.display_id, 0, "Bug #2864");

done();
