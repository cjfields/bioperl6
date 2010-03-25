use v6;

BEGIN {
    @*INC.push('./lib');
}

use Test;
use Bio::Role::Identify;

plan 12;

class Id does Bio::Role::Identify {  };

my $s = Id.new(object_id   => 'Foo',
               authority   => 'BioPerl6',
               namespace   => 'GenBank',
               version     => '12');

is($s.object_id, 'Foo');
is($s.authority, 'BioPerl6');
is($s.version, 12);
is($s.namespace, 'GenBank');

is($s.lsid_string, 'BioPerl6:GenBank:Foo');
is($s.namespace_string, 'GenBank:Foo.12');

$s = Id.new(object_id   => 'Foo',
               authority   => 'BioPerl6',
               namespace   => 'GenBank');

is($s.object_id, 'Foo');
is($s.authority, 'BioPerl6');
is($s.version, Any);
is($s.namespace, 'GenBank');

is($s.lsid_string, 'BioPerl6:GenBank:Foo');
is($s.namespace_string, 'GenBank:Foo');

