use v6;

use lib './lib';

use Test;

use Bio::Role::IO;

ok(1);

{
    class MyIO does Bio::Role::IO {
    }
}

# simple file input
my $in = MyIO.new( file => $*SPEC.catfile('t','data','test.fasta'), :r);

ok($in ~~ Bio::Role::IO, 'does Bio::Role::IO');
is($in.file, $*SPEC.catfile('t','data','test.fasta')); # De-UNIX this

isa-ok($in.fh, 'IO::Handle');
is($in.mode, 'r');

# simple file output
my $out = MyIO.new( file => $*SPEC.catfile('hi.txt'), :w);

is($out.file, 'hi.txt');
is($out.mode, 'w');

# rw
my $inout = MyIO.new( file => $*SPEC.catfile('hi.txt'), :rw );
is($inout.mode, 'rw');

# also works with :r :w
$inout = MyIO.new( file => $*SPEC.catfile('hi.txt'), :r, :w );
is($inout.mode, 'rw');

# from a file handle
my $fh = $*SPEC.catfile('t','data','test.fasta').IO.open: :r;

$in = MyIO.new( fh => $fh );
todo('Mode from a file handle NYI', 1);
is($in.mode, 'r');

# if you really really have to use IO instead of SPEC for catfile, a'la old
# BioPerl, but this will likely be deprecated in favor of $*SPEC
is(MyIO.catfile('a', 'b', 'c'), $*SPEC.catfile('a', 'b', 'c'), 'catfile');
is(MyIO.catdir('a', 'b', 'c'), $*SPEC.catdir('a', 'b', 'c'), 'catdir');

done-testing();

END {
    unlink('hi.txt') if 'hi.txt'.IO:e;
}
