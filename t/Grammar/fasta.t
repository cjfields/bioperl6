use v6;

use Test;
use Bio::Grammar::Fasta;

class MyAction {
    method TOP ($/) { * }
    method record ($/) { * }
    method description_line ($/) { * }
    method id ($/) { * }
    method identifier ($/) { say $/ }
    method generic_id ($/) { * }
    method description ($/) { say $/ }
    method sequence ($/) { * }
}

my $fasta = q:to/FASTA/;
>roa1_drome Rea guano receptor type III >> 0.1
MVNSNQNQNGNSNGHDDDFPQDSITEPEHMRKLFIGGLDYRTTDENLKAHEKWGNIVDVV
VMKDPRTKRSRGFGFITYSHSSMIDEAQKSRPHKIDGRVEPKRAVPRQDIDSPNAGATVK
KLFVGALKDDHDEQSIRDYFQHFGNIVDNIVIDKETGKKRGFAFVEFDDYDPVDKVVLQK
QHQLNGKMVDVKKALPKNDQQGGGGGRGGPGGRAGGNRGNMGGGNYGNQNGGGNWNNGGN
NWGNNRGNDNWGNNSFGGGGGGGGGYGGGNNSWGNNNPWDNGNGGGNFGGGGNNWNGGND
FGGYQQNYGGGPQRGGGNFNNNRMQPYQGGGGFKAGGGNQGNYGNNQGFNNGGNNRRY
>roa2_drome Rea guano ligand
MVNSNQNQNGNSNGHDDDFPQDSITEPEHMRKLFIGGLDYRTTDENLKAHEKWGNIVDVV
VMKDPTSTSTSTSTSTSTSTSTMIDEAQKSRPHKIDGRVEPKRAVPRQDIDSPNAGATVK
KLFVGALKDDHDEQSIRDYFQHLLLLLLLDLLLLDLLLLDLLLFVEFDDYDPVDKVVLQK
QHQLNGKMVDVKKALPKNDQQGGGGGRGGPGGRAGGNRGNMGGGNYGNQNGGGNWNNGGN
NWGNNRGNDNWGNNSFGGGGGGGGGYGGGNNSWGNNNPWDNGNGGGNFGGGGNNWNGGND
FGGYQQNYGGGPQRGGGNFNNNRMQPYQGGGGFKAGGGNQGNYGNNQGFNNGGNNRRY
FASTA

my $actions = MyAction.new();

# parse string
ok( Bio::Grammar::Fasta.parse( $fasta, :$actions));
is($/.from, 0);
is($/.to, 804);

# subparse a string, parse a file a record at a time
ok( Bio::Grammar::Fasta.subparse( $fasta, :rule<record>, :$actions));
is($/.from, 0);
is($/.to, 411);

# TODO: not working, likely :pos is NYI in Rakudo
ok( Bio::Grammar::Fasta.subparse( $fasta, :rule<record>, :pos<$/.to>, :$actions));
is($/.from, 411);
is($/.to, 804);

# parse file
# TODO: use File::Spec-like path
ok( Bio::Grammar::Fasta.parsefile( './t/data/test.fasta' ) );

done();
