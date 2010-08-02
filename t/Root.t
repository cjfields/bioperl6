use v6;

BEGIN {
    @*INC.push('./lib');
}

use Test;

# replace throw/warn_not_implemented with built-in yada-yada variants

use Bio::Root::Root;

my $s = Bio::Root::Root.new();

ok($s.isa(Bio::Root::Root));
eval_dies_ok('$s.throw("foo")','throw');
lives_ok {$s.warn("foo")},'warn() does not die';
$s.warn("foo");
lives_ok {$s.debug("foo"),'debug() does not die'};

# test strictness
$s.strict = 2;   # convert warn to throw
eval_dies_ok('$s.throw("foo")');
eval_dies_ok('$s.warn("foo")');
lives_ok {$s.debug("foo")};

# check inheritance
class Foo is Bio::Root::Root {};

my $n = Foo.new();

ok($n.isa(Foo));
ok($n.isa(Bio::Root::Root));
eval_dies_ok('$n.throw("foo")');
lives_ok {$n.warn("foo")};
lives_ok {$n.debug("foo")};
$s.strict = 2;   # convert warn to throw
eval_dies_ok('$n.throw("foo")');
eval_dies_ok('$n.warn("foo")');
lives_ok {$n.debug("foo")};

done_testing();
