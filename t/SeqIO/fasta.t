use v6;
use Test;
plan 23;
BEGIN {
    @*INC.push('lib');
    @*INC.push('blib');    
}
eval_lives_ok 'use Bio::SeqIO', 'Can use Bio::SeqIO';
eval_lives_ok 'use Bio::Role::FastaIO', 'Can use Bio::Role::FastaIO';

use Bio::SeqIO;
use Bio::Role::FastaIO;

my $data_path ='t/data';
my $format = 'fasta';
my $file = "$data_path/test.fasta";

my $seqio_obj = Bio::SeqIO.new(file=> $file,format => $format);

#type of Object seem to disappear right now 
ok($seqio_obj ~~ Bio::SeqIO,"Is a Bio::SeqIO object");

my @methods = ("next_seq" , "write_seq");
for @methods -> $method {
    ok $seqio_obj.can($method),"Can do method '$method' for format: $format";
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

#like is not implemented in Test.pm so using  simple is for now
#like ($seq_obj.description(), %expected{'description'}, 'description');
is($seq_obj.description(), "Rea guano receptor type III >> 0.1", 'description');

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

#taking multiple fasta file
my $in = Bio::SeqIO.new(file => "$data_path/multi_1.fa" , format => 'fasta');
is($in ~~ Bio::SeqIO,Bool::True,"Is a Bio::SeqIO object");
my $c=0;
while ( my $seq = $in.next_seq() ) {
    ok($seq);
    $c++;
}
is $c,6, "all sequences in the file";

#need testing for reading/writing fasta file using $*IN and $*OUT

done();

