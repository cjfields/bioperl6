use v6;
BEGIN {
    @*INC.push('./lib');
}

use Test;
plan 37;
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


# create a feature composed of multiple segments, all of type "similarity"
$lite = Bio::SeqFeature::Lite.new(segments => [[1000,1100],[1500,1550],[1800,2000]],
                                   name     => 'ABC-3',
                                   type     => 'gapped_alignment',
                                   subtype  => 'similarity');

is($lite.start,1000,'correct start');
is($lite.stop,2000,'correct stop');
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

for ($lite.segments) -> $x {
    is($x.name,'ABC-3');
    is($x.type,'similarity');
    is($x.is_circular,False);
}
