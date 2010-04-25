use v6;

BEGIN {
    @*INC.push('./lib');
}

use Test;

use Bio::SeqIO;
use Bio::Role::FastaIO;

my $format = 'fasta';
#yes I know it's hardcore for now. Will only work when calling make from project directory
my $file = "t/data/test.fasta";
my $seqio_obj = Bio::SeqIO.new(file=> $file,format => $format);

#type of Object seem to disappear right now 
is($seqio_obj ~~ Bio::SeqIO,1,"Is a Bio::SeqIO object");

my @methods = ("next_seq" , "write_seq");
for @methods -> $method {
    #not implemented in current master, waiting for S12-introspection/can.t to be passed
    #is($seqio_obj.can($method),1,"Can do method $method for format: $format");
}


#normally would return next Bio::Seq object
my $seq_obj = $seqio_obj.next_seq();

# checking the first sequence object
#Currently all we have are Bio::PrimarySeq for now, will return to Bio::Seq soon
isa_ok($seq_obj, Bio::PrimarySeq);

my %expected = ('seq'         => 'MVNSNQNQNGNSNGHDDDFPQDSITEPEHMRKLFIGGL' ~
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
				'primary_id'  => 'roa1_drome',
				'display_id'  => 'roa1_drome',
				'description' => 'Rea guano receptor type III',
			   );
			   
is($seq_obj.seq(),         %expected{'seq'},         'sequence');
is($seq_obj.display_id(),  %expected{'display_id'},  'display_id');

#currently do not set
#is($seq_obj.primary_id(),  %expected{'primary_id'},  'primary_id');
is($seq_obj.length(),      %expected{'length'},      'length');
#like is not implemented in Test.pm so hardcoding for now but no idea why it is not working...
#like ($seq_obj.description(), %expected{'description'}, 'description');
#ok($seq_obj.description() ~~ /'Rea guano receptor type III >> 0.1'/, 'description');

my $seq_obj2 = 	$seqio_obj.next_seq();

# checking the first sequence object
#Currently all we have are Bio::PrimarySeq for now, will return to Bio::Seq soon
isa_ok($seq_obj2, Bio::PrimarySeq);

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
				 'primary_id'  => 'roa2_drome',
				 'display_id'  => 'roa2_drome',
				 'description' => 'Rea guano ligand',
			    );


is($seq_obj2.seq(),         %expected2{'seq'},         'sequence');
is($seq_obj2.display_id(),  %expected2{'display_id'},  'display_id');
#currently do not set
#is($seq_obj.primary_id(),  %expected{'primary_id'},  'primary_id');
is($seq_obj2.length(),      %expected2{'length'},      'length');
is($seq_obj2.description(),'Rea guano ligand', 'description');


done_testing();

