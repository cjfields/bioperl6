use v6;
BEGIN {
    @*INC.push('./lib');
}

use Test;
plan 66;
eval_lives_ok 'use Bio::SeqFeature::Lite', 'Can use Bio::SeqFeature::Lite';

use Bio::SeqFeature::Lite;

my $lite = Bio::SeqFeature::Lite.new();
ok($lite ~~ Bio::SeqFeature::Lite, 'Is Bio::SeqFeature::Lite');

$lite = Bio::SeqFeature::Lite.new(start => 1000,
                                  stop  => 2000,
                                  type  => 'transcript',
                                  name  => 'alpha-1 antitrypsin',
				  desc  => 'an enzyme inhibitor',
                                 );

is($lite.start,1000,'correct start');
is($lite.stop,2000,'correct stop');
is($lite.type,'transcript','Got correct transcript');
is($lite.desc,'an enzyme inhibitor','Got desc');
is($lite.display_name,"alpha-1 antitrypsin");
is($lite.display_id,"alpha-1 antitrypsin");
is($lite.dna,'');
is($lite.start_pos_type,"EXACT");
is($lite.end_pos_type,"EXACT");
is($lite.strand,0);
is($lite.class,'Sequence');
is($lite.feature_count,0);
is($lite.length,1001);
is($lite.location(),$lite,'Should return itself if no segment(s)');
is($lite.location_string,'1000..2000');


# create a feature composed of multiple segments, all of type "similarity"
my @coord = [1000,1100],[1500,1550],[1800,2000];
$lite = Bio::SeqFeature::Lite.new(segments => @coord,
                                   name     => 'ABC-3',
                                   type     => 'gapped_alignment',
                                   subtype  => 'similarity');

is($lite.start,1000,'correct start');
is($lite.stop,2000,'correct stop');
is($lite.end,2000,"correct stop using alias 'end'");
is($lite.length,1001);
is($lite.type,'gapped_alignment');
is($lite.desc,Any);
is($lite.display_name,"ABC-3");
is($lite.display_id,"ABC-3");
is($lite.dna,'');
is($lite.start_pos_type,"EXACT");
is($lite.end_pos_type,"EXACT");
is($lite.strand,0);
is($lite.class,'Sequence');
is($lite.type,'gapped_alignment');
is($lite.feature_count,3);
is($lite.is_circular,False);
is($lite.to_FTstring(),'1000..2000');
is($lite.location_string,'1000..1100,1500..1550,1800..2000');
is($lite.score,Any);

my $split = $lite.location();
ok($split ~~ Bio::Role::Location::Split,'return Split Object');
is($split.start,1000,'start from Split');
is($split.end,2000,'stop from Split');

for ($lite.each_Location ) -> $x {
    my @feature = @(@coord.shift);
    my ($start,$end) = (@feature[0],@feature[1]);
    is($x.start,$start);
    is($x.end,$end);
} 


for ($lite.segments) -> $x {
    is($x.name,'ABC-3');
    is($x.type,'similarity');
    is($x.is_circular,False);
}


# build up a gene exon by exon
my $e1 = Bio::SeqFeature::Lite.new(start=>1,stop=>100,type=>'exon');
my $e2 = Bio::SeqFeature::Lite.new(start=>150,stop=>200,type=>'exon');
my $e3 = Bio::SeqFeature::Lite.new(start=>300,stop=>500,type=>'exon');
$lite  = Bio::SeqFeature::Lite.new(segments=>[$e1,$e2,$e3],type=>'gene',seq_id=>'123456');
 
is($e1.type,'exon');
is($e2.type,'exon');
is($e3.type,'exon');

is($lite.start,1,'correct start');
is($lite.stop,500,'correct stop');
is($lite.feature_count,3);
is($lite.type,'gene');
is($lite.low(),'1');
is($lite.high(),'500');
is($lite.location_string,'1..100,150..200,300..500');
is($lite.score,Any);
is($lite.length,500);

#they should still keep their type as 'exon'
for ($lite.segments) -> $x {
    is($x.type,'exon');
}
