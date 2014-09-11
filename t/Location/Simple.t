use v6;

use lib './lib';

use Test;

use Bio::Location::Simple;

my $loc = Bio::Location::Simple.new(start   => 1, end => 100, strand    => -1);

ok( Bio::Location::Simple ~~ Bio::Role::Location, 'does Location' );
ok( Bio::Location::Simple ~~ Bio::Role::Range, 'does Range' );

is($loc.start, 1, 'start');
is($loc.end, 100, 'end');
is($loc.length(), 100, 'length');
is($loc.strand, -1, 'strand');
is($loc.min-start, 1, 'min-start');
is($loc.max-start, 1, 'max-start');
is($loc.type, EXACT, 'type');

is($loc.min-end, 100, 'min-end');
is($loc.max-end, 100, 'max-end');
ok($loc.is-valid, 'is-valid');
ok(!$loc.is-remote, 'is-fuzzy');

done();