use v6;
BEGIN {
    @*INC.push('./lib');
}

use Test;
plan 10;
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

