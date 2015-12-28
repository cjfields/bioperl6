use v6;

use lib './lib';

use Test;
use Bio::Role::Identifiable;

class Id does Bio::Role::Identifiable {  };

my $s = Id.new(accession   => 'Foo',
               authority   => 'BioPerl6',
               namespace   => 'GenBank',
               version     => 12);

ok($s ~~ Bio::Role::Identifiable,'Has a Bio::Role::Identifiable');

is($s.object-id, 'Foo');
is($s.accession, 'Foo');
is($s.authority, 'BioPerl6');
is($s.version, 12);
is($s.namespace, 'GenBank');

is($s.lsid-string, 'BioPerl6:GenBank:Foo');
is($s.namespace-string, 'GenBank:Foo.12');

$s = Id.new(accession   => 'Foo',
            authority   => 'BioPerl6',
            namespace   => 'GenBank');

is($s.object-id, 'Foo');
is($s.authority, 'BioPerl6');
ok(!$s.version);
is($s.namespace, 'GenBank');

is($s.lsid-string, 'BioPerl6:GenBank:Foo');
is($s.namespace-string, 'GenBank:Foo');

done-testing();
