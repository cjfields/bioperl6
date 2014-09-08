use v6;
 
use Test;

use Bio::Role::Aliased;
 
class Stub {
    has $.a is aliased('foo', 'baz');
    has $.long_name is aliased('bar');
};
 
my $test = Stub.new(:a<hi there>, :long_name<Long time no see>);

Stub.^methods.say;

is($test.a, 'hi there', '');
ok($test.can('foo'), 'adds alias');
ok($test.can('baz'), 'adds alias');
 
# Does not work, get "No such method 'foo' for invocant of type 'Stub'"
is($test.foo, 'hi there');
is($test.baz, 'hi there');
 
is($test.long_name, 'Long time no see');
is($test.bar, 'Long time no see');

done();