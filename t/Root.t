use v6;

use lib './lib';

use Test;
plan 15;

# replace throw/warn_not_implemented with built-in yada-yada variants

use Bio::Root::Root;

my $s = Bio::Root::Root.new();

ok($s.isa(Bio::Root::Root));
eval-dies-ok('$s.throw("foo")','throw');
lives-ok {$s.warn("foo")},'warn() does not die';
$s.warn("foo");
lives-ok {$s.debug("foo"),'debug() does not die'};

# test strictness
$s.strict = 2;   # convert warn to throw
eval-dies-ok('$s.throw("foo")');
eval-dies-ok('$s.warn("foo")');
lives-ok {$s.debug("foo")};

# check inheritance
class Foo is Bio::Root::Root {};

my $n = Foo.new();

ok($n.isa(Foo));
ok($n.isa(Bio::Root::Root));
eval-dies-ok('$n.throw("foo")');
lives-ok {$n.warn("foo")};
lives-ok {$n.debug("foo")};
$s.strict = 2;   # convert warn to throw
eval-dies-ok('$n.throw("foo")');
eval-dies-ok('$n.warn("foo")');
lives-ok {$n.debug("foo")};

done();
