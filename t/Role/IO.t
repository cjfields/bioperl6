use v6;

use lib './lib';

use Test;

use Bio::Role::IO;

ok(1);

{
    class MyIO does Bio::Role::IO { }
}

# simple file input
my $in = MyIO.new( file => $*SPEC.catfile('t','data','test.fasta'), :r);

ok($in ~~ Bio::Role::IO, 'does Bio::Role::IO');
is($in.file, 't/data/test.fasta'); # De-UNIX this
isa_ok($in.fh, 'IO::Handle');

todo('Mode NYI', 1);
is($in.mode, 'r');

# simple file output
my $out = MyIO.new( file => $*SPEC.catfile('hi.txt'), :w);

is($out.file, 'hi.txt');
todo('Mode NYI', 1);
is($in.mode, 'w');

# rw
my $inout = MyIO.new( file => $*SPEC.catfile('hi.txt'), :rw );

is($in.mode, 'rw');

# from a file handle
my $fh = $*SPEC.catfile('t','data','test.fasta').IO.open: :r;

$in = MyIO.new( fh => $fh );

todo('Mode NYI', 1);
is($in.mode, 'r');

# if you really really have to use IO instead of SPEC for catfile, a'la old
# BioPerl, but this will likely be deprecated in favor of $*SPEC
is(MyIO.catfile('a', 'b', 'c'), $*SPEC.catfile('a', 'b', 'c'), 'catfile');
is(MyIO.catdir('a', 'b', 'c'), $*SPEC.catdir('a', 'b', 'c'), 'catdir');

#my $in = Bio::SeqIO.new(format  => 'fasta');
#
#is($in.format, 'fasta', 'format');
#
#dies_ok { $in.format = 'fastq' }, 'readonly';
#
## no version or variant (these are optional)
#ok($in.format-version ~~ Any, 'version');
#ok($in.format-variant ~~ Any, 'variant');
#
## explicit
#$in = Bio::SeqIO.new(format  => 'fasta',
#                    format-version  => 1.0,
#                    format-variant  => 'old');
#
#is($in.format, 'fasta', 'format');
#is($in.format-version, 1.0, 'version');
#dies_ok { $in.format-version = 2.0 }, 'readonly';
#dies_ok { $in.format-variant = 'new'}, 'readonly';
#
#is($in.format-variant, 'old', 'variant');
#
## format-variant
#$in = Bio::SeqIO.new(format  => 'fasta-old',
#                    format-version  => 1.0);
#
#is($in.format, 'fasta', 'format');
#is($in.format-version, 1.0, 'version');
#is($in.format-variant, 'old', 'variant');
#
#dies_ok {Bio::SeqIO.new(format  => "foo")}, 'dies with an unknown format';
#
done();
