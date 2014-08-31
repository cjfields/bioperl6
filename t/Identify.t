use v6;

use lib './lib';

use Test;
use Bio::Role::Identify;

class Id does Bio::Role::Identify {  };

my $s = Id.new(accession   => 'Foo',
               authority   => 'BioPerl6',
               namespace   => 'GenBank',
               version     => 12);

is($s.object_id, 'Foo');
is($s.accession, 'Foo');
is($s.authority, 'BioPerl6');
is($s.version, 12);
is($s.namespace, 'GenBank');

is($s.lsid_string, 'BioPerl6:GenBank:Foo');
is($s.namespace_string, 'GenBank:Foo.12');

$s = Id.new(accession   => 'Foo',
            authority   => 'BioPerl6',
            namespace   => 'GenBank');

is($s.object_id, 'Foo');
is($s.authority, 'BioPerl6');
ok(!$s.version);
is($s.namespace, 'GenBank');

is($s.lsid_string, 'BioPerl6:GenBank:Foo');
is($s.namespace_string, 'GenBank:Foo');

done();