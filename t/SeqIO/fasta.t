use v6;

use Test;

use lib './lib';

use-ok 'Bio::SeqIO', 'Can use Bio::SeqIO';

# TODO: the use-ok above does not actually load module in, so we do it here.
use Bio::SeqIO;

my $format = 'fasta';
my $seqio_obj = Bio::SeqIO.new(file   => $*SPEC.catfile(<t data test.fasta>),
                               format => $format);

isa-ok($seqio_obj, 'Bio::SeqIO');

my @methods = <next-Seq write-Seq>;
for @methods -> $method {
    can-ok($seqio_obj, $method) ||
        diag "$method method not implemented for $format";
}

# checking the first sequence object
my $seq_obj = $seqio_obj.next-Seq();
isa-ok($seq_obj, 'Bio::PrimarySeq');
my %expected = 'seq'         => 'MVNSNQNQNGNSNGHDDDFPQDSITEPEHMRKLFIGGL' ~
                                 'DYRTTDENLKAHEKWGNIVDVVVMKDPRTKRSRGFGFI' ~
                                 'TYSHSSMIDEAQKSRPHKIDGRVEPKRAVPRQDIDSPN' ~
                                 'AGATVKKLFVGALKDDHDEQSIRDYFQHFGNIVDNIVI' ~
                                 'DKETGKKRGFAFVEFDDYDPVDKVVLQKQHQLNGKMVD' ~
                                 'VKKALPKNDQQGGGGGRGGPGGRAGGNRGNMGGGNYGN' ~
                                 'QNGGGNWNNGGNNWGNNRGNDNWGNNSFGGGGGGGGGY' ~
                                 'GGGNNSWGNNNPWDNGNGGGNFGGGGNNWNGGNDFGGY' ~
                                 'QQNYGGGPQRGGGNFNNNRMQPYQGGGGFKAGGGNQGN' ~
                                 'YGNNQGFNNGGNNRRY',
                'length'      => '358',
                'primary-id'  => 'roa1_drome',
                'description' => rx:s/Rea guano receptor type III/,
               ;
is($seq_obj.seq(),         %expected{'seq'},         'sequence');
is($seq_obj.length(),      %expected{'length'},      'length');
#is($seq_obj.primary-id(),  %expected{'primary-id'},  'primary-id');
like($seq_obj.description(), %expected{'description'}, 'description');


# checking the second sequence object
my $seq_obj2  = $seqio_obj.next-Seq();
isa-ok($seq_obj2, 'Bio::PrimarySeq');
my %expected2 = ('seq'         => 'MVNSNQNQNGNSNGHDDDFPQDSITEPEHMRKLFIGGL' ~
                                  'DYRTTDENLKAHEKWGNIVDVVVMKDPTSTSTSTSTST' ~
                                  'STSTSTMIDEAQKSRPHKIDGRVEPKRAVPRQDIDSPN' ~
                                  'AGATVKKLFVGALKDDHDEQSIRDYFQHLLLLLLLDLL' ~
                                  'LLDLLLLDLLLFVEFDDYDPVDKVVLQKQHQLNGKMVD' ~
                                  'VKKALPKNDQQGGGGGRGGPGGRAGGNRGNMGGGNYGN' ~
                                  'QNGGGNWNNGGNNWGNNRGNDNWGNNSFGGGGGGGGGY' ~
                                  'GGGNNSWGNNNPWDNGNGGGNFGGGGNNWNGGNDFGGY' ~
                                  'QQNYGGGPQRGGGNFNNNRMQPYQGGGGFKAGGGNQGN' ~
                                  'YGNNQGFNNGGNNRRY',
                 'length'      => '358',
                 'primary-id'  => 'roa2_drome',
                 'description' => rx:s/Rea guano ligand/,
                );
is($seq_obj2.seq(),         %expected2{'seq'},         'sequence');
is($seq_obj2.length(),      %expected2{'length'},      'length');
#is($seq_obj2.primary-id(),  %expected2{'primary-id'},  'primary-id');
like($seq_obj2.description(), %expected2{'description'}, 'description');


# IO::String tests
# from testformats.pl
#SKIP: {
#    my ($file, $type) = ("test.$format", $format);
#    my $filename = test_input_file($file);
#    open my $FILE, '<', $filename or die "Could not read file '$filename': $!\n";
#    my @datain = <$FILE>;
#    close $FILE;
#
#    my $in = new IO::String(join('', @datain));
#    my $seqin = new Bio::SeqIO( -fh => $in,
#                -format => $type);
#    my $out = new IO::String;
#    my $seqout = new Bio::SeqIO( -fh => $out,
#                 -format => $type);
#    my $seq;
#    while( defined($seq = $seqin->next_seq) ) {
#    $seqout->write_seq($seq);
#    }
#    $seqout->close();
#    $seqin->close();
#    my $strref = $out->string_ref;
#    my @dataout = map { $_."\n"} split(/\n/, $$strref );
#    my @diffs = &diff( \@datain, \@dataout);
#    is(@diffs, 0, "$format format can round-trip");
#    
#    if(@diffs && $verbose) {
#        foreach my $d ( @diffs ) {
#            foreach my $diff ( @$d ) {
#                chomp($diff->[2]);
#                print $diff->[0], $diff->[1], "\n>", $diff->[2], "\n";
#            }
#        }
#        print "in is \n", join('', @datain), "\n";
#        print "out is \n", join('',@dataout), "\n";
#    }
#
#}

# TODO: check other formats against fasta

## bug 1508
## test genbank, gcg, ace against fasta (should throw an exception on each)
#
#for my $file (qw(roa1.genbank test.gcg test.ace test.raw)) {
#    my $in = Bio::SeqIO->new(-file   => test_input_file($file),
#                             -format => 'fasta');
#    throws_ok {$in->next_seq}
#        qr/The sequence does not appear to be FASTA format/, "dies with $file";
#}

done-testing();