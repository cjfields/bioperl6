use v6;

use lib './lib';

use Test;

use Bio::Role::Range;

#=begin Range tests
#
#Test out simple ranges.  Locations will expand on these...
#
# r0 |--------->
# r1 |---------|
# r2 <---------|
#
# r3    |-->
# r4    |--|
# r5    <--|
#
# r6       |-------->
# r7       |--------|
# r8       <--------|
#
# r9            |-------->
# r10           |--------|
# r11           <--------|
#
#Logic table for overlaps, contains, equals
#
#m = method, o = overlaps()  c = contains()  e = equals
#st = strand tests,  i = ignore, w = weak, s = strong
#
#    r0       |r1       |r2       |r3       |r4       |r5       |r6       |r7       |r8       |r9       |r10      |r11
#    o  c  e  |o  c  e  |o  c  e  |o  c  e  |o  c  e  |o  c  e  |o  c  e  |o  c  e  |o  c  e  |o  c  e  |o  c  e  |o  c  e
#    iwsiwsiws|iwsiwsiws|iwsiwsiws|iwsiwsiws|iwsiwsiws|iwsiwsiws|iwsiwsiws|iwsiwsiws|iwsiwsiws|iwsiwsiws|iwsiwsiws|iwsiwsiws
#r0  111111111|110110110|100100100|111111000|110110000|100100000|111000000|110000000|100000000|000000000|000000000|000000000
#r1  xxxxxxxxx|110110110|110110110|110110000|110110000|110110000|110000000|110000000|110000000|000000000|000000000|000000000
#r2  xxxxxxxxx|xxxxxxxxx|111111111|100100000|110110000|111111000|100000000|110000000|111000000|000000000|000000000|000000000
#r3  xxxxxxxxx|xxxxxxxxx|xxxxxxxxx|111111111|110110110|100100100|111000000|110000000|100000000|000000000|000000000|000000000
#r4  xxxxxxxxx|xxxxxxxxx|xxxxxxxxx|xxxxxxxxx|110110110|110110110|110000000|110000000|110000000|000000000|000000000|000000000
#r5  xxxxxxxxx|xxxxxxxxx|xxxxxxxxx|xxxxxxxxx|xxxxxxxxx|111111111|100000000|110000000|111000000|000000000|000000000|000000000
#r6  xxxxxxxxx|xxxxxxxxx|xxxxxxxxx|xxxxxxxxx|xxxxxxxxx|xxxxxxxxx|111111111|110110110|100100100|111000000|110000000|100000000
#r7  xxxxxxxxx|xxxxxxxxx|xxxxxxxxx|xxxxxxxxx|xxxxxxxxx|xxxxxxxxx|xxxxxxxxx|110110110|110110110|110000000|110000000|110000000
#r8  xxxxxxxxx|xxxxxxxxx|xxxxxxxxx|xxxxxxxxx|xxxxxxxxx|xxxxxxxxx|xxxxxxxxx|xxxxxxxxx|111111111|100000000|110000000|111000000
#r9  xxxxxxxxx|xxxxxxxxx|xxxxxxxxx|xxxxxxxxx|xxxxxxxxx|xxxxxxxxx|xxxxxxxxx|xxxxxxxxx|xxxxxxxxx|111111111|110110110|100100100
#r10 xxxxxxxxx|xxxxxxxxx|xxxxxxxxx|xxxxxxxxx|xxxxxxxxx|xxxxxxxxx|xxxxxxxxx|xxxxxxxxx|xxxxxxxxx|xxxxxxxxx|110110110|110110110
#r11 xxxxxxxxx|xxxxxxxxx|xxxxxxxxx|xxxxxxxxx|xxxxxxxxx|xxxxxxxxx|xxxxxxxxx|xxxxxxxxx|xxxxxxxxx|xxxxxxxxx|xxxxxxxxx|111111111
#
#=end Range tests

class MyRange does Bio::Role::Range  {
    method Str {
        '(' ~ $.start ~ ', ' ~ $.end ~ ')' ~ ' strand=' ~ $.strand;
    }
};

# role

my @spans = (1 => 100, 25 => 75, 75 => 125, 101 => 150);

my @ranges;

for @spans -> $s {
    for (-1..1).reverse -> $strand  {
        @ranges.push(MyRange.new(start  => $s.key,
                                 end    => $s.value,
                                 strand => $strand));
    }
}

ok(@ranges[0] ~~ Bio::Role::Range, 'Range role');
isa_ok(@ranges[0], MyRange, 'MyRange class');
ok(!@ranges[0].^isa(Bio::Role::Range), 'Role consumed by class');
is(@ranges[0].start, 1);
is(@ranges[0].end, 100);
is(@ranges[0].strand, 1);
is(@ranges[0].length, 100);
is(@ranges[1].strand, 0);
is(@ranges[2].strand, -1);
is(@ranges[11].start, 101);
is(@ranges[11].end, 150);
is(@ranges[11].strand, -1);
is(@ranges[11].length, 50);

# test overlaps, contains, equals, cover all variations

my %map = (
r0  => '111111111|110110110|100100100|111111000|110110000|100100000|111000000|110000000|100000000|000000000|000000000|000000000',
r1  => '110110110|110110110|110110000|110110000|110110000|110000000|110000000|110000000|000000000|000000000|000000000',
r2  => '111111111|100100000|110110000|111111000|100000000|110000000|111000000|000000000|000000000|000000000',
r3  => '111111111|110110110|100100100|111000000|110000000|100000000|000000000|000000000|000000000',
r4  => '110110110|110110110|110000000|110000000|110000000|000000000|000000000|000000000',
r5  => '111111111|100000000|110000000|111000000|000000000|000000000|000000000',
r6  => '111111111|110110110|100100100|111000000|110000000|100000000',
r7  => '110110110|110110110|110000000|110000000|110000000',
r8  => '111111111|100000000|110000000|111000000',
r9  => '111111111|110110110|100100100',
r10 => '110110110|110110110',
r11 => '111111111',
);

for 0..@ranges.end -> $i {
    if %map{"r$i"}:exists  {
        # must numerify match and then make it Bool
        my @tests = %map{"r$i"}.comb(/\d/).map: { ?+$_ };
        for $i..@ranges.end -> $j {
            my $r1 = @ranges[$i];
            my $r2 = @ranges[$j];
            for <overlaps contains equals> -> $method {
                for <ignore weak strong> -> $test {
                    my $current = @tests.shift;
                    is($r1."$method"($r2, :test($test) ), $current, "$r1 $method $r2, $test: $current");
                }
            }
        }
    }
}

#=begin Geometric tests
#
#With these ranges:
#
# r0 |--------->
# r1 |---------|
# r2 <---------|
#
# r3    |-->
# r4    |--|
# r5    <--|
#
# r6       |-------->
# r7       |--------|
# r8       <--------|
#
# r9            |-------->
# r10           |--------|
# r11           <--------|
#
# intersection of r0, r3, r6 => [75,75,1] for all st
# intersection of r6, r9     => [101, 125, 1] for all st
# intersection of r6, r10    => [101, 125, 0] for ignore, weak, undef for strong
# intersection of r6, r11    => [101, 125, 0] for ignore, undef for weak & strong
# intersection of r0, r6, r9 => undef for all
#
# union of r0, r3, r6        => [1,125,1] for all st
# union of r6, r9            => [75, 150, 1] for all st
# union of r6, r10           => [75, 150, 0] for all st
# union of r6, r11           => [75, 150, 0] for all st
# union of r0, r6, r9        => [1,150,1] for all st
#
#=end Geometric tests

my %geo_tests =
('0,3,6' => {     #  intersection             union
    'strong' => ['(75, 75) strand=1',   '(1, 125) strand=1'],
    'weak'   => ['(75, 75) strand=1',   '(1, 125) strand=1'],
    'ignore' => ['(75, 75) strand=1',   '(1, 125) strand=1'],
            },
 '6,9'   => {
    'strong' => ['(101, 125) strand=1', '(75, 150) strand=1'],
    'weak'   => ['(101, 125) strand=1', '(75, 150) strand=1'],
    'ignore' => ['(101, 125) strand=1', '(75, 150) strand=1'],
            },
 '6,10'   => {
    'strong' => ['',                    '(75, 150) strand=0'],
    'weak'   => ['(101, 125) strand=0', '(75, 150) strand=0'],
    'ignore' => ['(101, 125) strand=0', '(75, 150) strand=0'],
            },
 '6,11'   => {
    'strong' => ['',                    '(75, 150) strand=0'],
    'weak'   => ['',                    '(75, 150) strand=0'],
    'ignore' => ['(101, 125) strand=0', '(75, 150) strand=0'],
            },
 '0,6,9'   => {
    'strong' => ['',                    '(1, 150) strand=1'],
    'weak'   => ['',                    '(1, 150) strand=1'],
    'ignore' => ['',                    '(1, 150) strand=1'],
            },
);

for %geo_tests.keys.sort -> $set {
    my @rest = @ranges[$set.split(',')];
    my $primary = @rest.shift;
    for <ignore weak strong> -> $test {
        my $int = $primary.intersection(@rest, :$test);
        my $union = $primary.union(@rest, :$test);
        is(($int.defined ?? $int.Str !! ''), %geo_tests{$set}{$test}[0], "intersection of $set, $test");
        is(($union.defined ?? $union.Str !! ''), %geo_tests{$set}{$test}[1], "union of $set, $test");
    }
}

#=begin Subtraction
#
# r0 |--------->
# r1 |---------|
# r2 <---------|
#
# r3    |-->
# r4    |--|
# r5    <--|
#
# r6       |-------->
# r7       |--------|
# r8       <--------|
#
# r9            |-------->
# r10           |--------|
# r11           <--------|
#
# subtraction of r3 from r0  => two Ranges [1, 24, 1] and [76, 100, 1]
# subtraction of r0 from r3  => one Range [0,0,1] - empty
# subtraction of r6 from r0  => one Range [1, 74, 1]
# subtraction of r0 from r6  => one Range [101,125,1]
# subtraction of r9 from r6  => one Range [75,100,1]
# subtraction of r6 from r9  => one Range [126,150,1]
# subtraction of r9 from r0  => original (or clone?) r0 Range [1, 100, 1]
# subtraction of r0 from r9  => original (or clone?) r9 Range [101,150,1]
#
#=end Subtraction

my %subtract_tests = ( # rx->subtract(ry)               ry->subtract(rx)
 '0,3' =>   {
    'strong' =>  ['(1, 24) strand=1,(76, 100) strand=1','(0, 0) strand=0'],
    'weak'   =>  ['(1, 24) strand=1,(76, 100) strand=1','(0, 0) strand=0'],
    'ignore' =>  ['(1, 24) strand=1,(76, 100) strand=1','(0, 0) strand=0'],
            },
 '0,4' =>   {
    'strong' =>  ['(1, 100) strand=1',                  '(25, 75) strand=0'],
    'weak'   =>  ['(1, 24) strand=1,(76, 100) strand=1','(0, 0) strand=0'],
    'ignore' =>  ['(1, 24) strand=1,(76, 100) strand=1','(0, 0) strand=0'],
            },
 '0,6' =>   {
    'strong' =>  ['(1, 74) strand=1',                   '(101, 125) strand=1'],
    'weak'   =>  ['(1, 74) strand=1',                   '(101, 125) strand=1'],
    'ignore' =>  ['(1, 74) strand=1',                   '(101, 125) strand=1'],
            },
 '6,9' =>   {
    'strong' =>  ['(75, 100) strand=1',                 '(126, 150) strand=1'],
    'weak'   =>  ['(75, 100) strand=1',                 '(126, 150) strand=1'],
    'ignore' =>  ['(75, 100) strand=1',                 '(126, 150) strand=1'],
            },
 '0,9' =>   {
    'strong' =>  ['(1, 100) strand=1',                  '(101, 150) strand=1'],
    'weak'   =>  ['(1, 100) strand=1',                  '(101, 150) strand=1'],
    'ignore' =>  ['(1, 100) strand=1',                  '(101, 150) strand=1'],
            },
);

for %subtract_tests.keys.sort -> $set {
    my ($r1, $r2) = @ranges[split(',',$set)];
    for <ignore weak strong> -> $st {
        my @sub1 = $r1.subtract($r2, test => $st);
        my @sub2 = $r2.subtract($r1, test => $st);
        is(join(',', @sub1».Str), %subtract_tests{$set}{$st}[0], "subtract" );
        is(join(',', @sub2».Str), %subtract_tests{$set}{$st}[1], "subtract");
    }
}

done();
