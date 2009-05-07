use v6;

use Test;
use Bio::Root;

plan 23;

my $s = Bio::Root.new;

ok($s.isa('Bio::Root'));

eval_dies_ok('$s.throw("foo")');
eval_dies_ok('$s.throw_not_implemented()');
lives_ok {$s.warn("foo")};
lives_ok {$s.warn_not_implemented()};
lives_ok {$s.debug("foo")};

# test strictness
$s.verbose = 2;   # convert warn to throw
eval_dies_ok('$s.throw("foo")');
eval_dies_ok('$s.throw_not_implemented()');
eval_dies_ok('$s.warn("foo")');
eval_dies_ok('$s.warn_not_implemented()');
lives_ok {$s.debug("foo")};

# check inheritance
class Foo is Bio::Root {};

my $n = Foo.new();

ok($n.isa('Foo'));
ok($n.isa('Bio::Root'));
eval_dies_ok('$n.throw("foo")');
eval_dies_ok('$n.throw_not_implemented()');
lives_ok {$n.warn("foo")};
lives_ok {$n.warn_not_implemented()};
lives_ok {$n.debug("foo")};
$s.verbose = 2;   # convert warn to throw
eval_dies_ok('$n.throw("foo")');
eval_dies_ok('$n.throw_not_implemented()');
eval_dies_ok('$n.warn("foo")');
eval_dies_ok('$n.warn_not_implemented()');
lives_ok {$n.debug("foo")};
