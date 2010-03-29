use v6;

BEGIN {
    @*INC.push('./lib');
}

use Test;

use Bio::Role::Range;

=begin Range tests

Test out simple ranges.  Locations will expand on these...

 r0 |--------->
 r1 |---------|
 r2 <---------|
 
 r3    |-->
 r4    |--|
 r5    <--|
 
 r6       |-------->
 r7       |--------|
 r8       <--------|

 r9            |-------->
 r10           |--------|
 r11           <--------|

Logic table for overlaps, contains, equals

m = method, o = overlaps()  c = contains()  e = equals
st = strand tests,  i = ignore, w = weak, s = strong

    r0       r1       r2       r3       r4       r5       r6       r7       r8       r9       r10      r11      
    o  c  e  o  c  e  o  c  e  o  c  e  o  c  e  o  c  e  o  c  e  o  c  e  o  c  e  o  c  e  o  c  e  o  c  e  
    iwsiwsiwsiwsiwsiwsiwsiwsiwsiwsiwsiwsiwsiwsiwsiwsiwsiwsiwsiwsiwsiwsiwsiwsiwsiwsiwsiwsiwsiwsiwsiwsiwsiwsiwsiws
r0  111111111110110110100100100111111000110110000100100000111000000110000000100000000000000000000000000000000000
r1  xxxxxxxxx110110110110110110110110000110110000110110000110000000110000000110000000000000000000000000000000000
r2  xxxxxxxxxxxxxxxxxx111111111100100000110110000111111000100000000110000000111000000000000000000000000000000000
r3  xxxxxxxxxxxxxxxxxxxxxxxxxxx111111111110110110100100100111000000110000000100000000000000000000000000000000000
r4  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx110110110110110110110000000110000000110000000000000000000000000000000000
r5  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx111111111100000000110000000111000000000000000000000000000000000
r6  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx111111111110110110100100100111000000110000000100000000
r7  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx110110110110110110110000000110000000110000000
r8  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx111111111100000000110000000111000000
r9  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx111111111110110110100100100
r10 xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx110110110110110110
r11 xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx111111111

=end Range tests

class MyRange does Bio::Role::Range  {
    our method Str {
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
r0  => '111111111111111000111000000110110110110110000110000000100100100100100000100000000000000000000000000000000000',
r1  => '111111000111111000110110000110110000110110000100100000100100000100100000000000000000000000000000000',
r2  => '111111111110000000110110000110110110100000000100100000100100100000000000000000000000000000',
r3  => '111111111111111000111000000100100100100100000100000000000000000000000000000000000',
r4  => '111111000111111000100100000100100000100100000000000000000000000000000000',
r5  => '111111111100000000100100000100100100000000000000000000000000000',
r6  => '111111111111111000111000000100100100100100000100000000',
r7  => '111111000111111000100100000100100000100100000',
r8  => '111111111100000000100100000100100100',
r9  => '111111111111111000111000000',
r10 => '111111000111111000',
r11 => '111111111',  
);

#for 0..@ranges.end -> $i {
#    my $test_data = %map{'r' ~ $i};
#    my @tests = $test_data.comb(/\d/);
#    for $i..@ranges.end -> $j {
#        my $r1 = @ranges[$i];
#        my $r2 = @ranges[$j];
#        for <ignore weak strong> -> $test {
#            is($r1.overlaps($r2, $test), @tests.shift, ~$r1 ~ ' overlaps ' ~ $r2 ~ ": $test");
#            is($r1.contains($r2, $test), @tests.shift, ~$r1 ~ ' contains ' ~ $r2 ~ ": $test");
#            is($r1.equals($r2, $test), @tests.shift, ~$r1 ~ ' equals ' ~ $r2 ~ ": $test");
#        }
#    }
#}

=begin Geometric tests

With these ranges:

 r0 |--------->
 r1 |---------|
 r2 <---------|
 
 r3    |-->
 r4    |--|
 r5    <--|
 
 r6       |-------->
 r7       |--------|
 r8       <--------|

 r9            |-------->
 r10           |--------|
 r11           <--------|

 intersection of r0, r3, r6 => [75,75,1] for all st
 intersection of r6, r9     => [101, 125, 1] for all st
 intersection of r6, r10    => [101, 125, 0] for ignore, weak, undef for strong
 intersection of r6, r11    => [101, 125, 0] for ignore, undef for weak & strong
 intersection of r0, r6, r9 => undef for all
 
 union of r0, r3, r6        => [1,125,1] for all st
 union of r6, r9            => [75, 150, 1] for all st
 union of r6, r10           => [75, 150, 0] for all st
 union of r6, r11           => [75, 150, 0] for all st
 union of r0, r6, r9        => [1,150,1] for all st

=end Geometric tests

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

# TODO:
# seeing an error when not using the named parameter version for test:
# Method '!teststranded' not found for invocant of class 'Str'
# May be rakudobug, needs checking

for %geo_tests.keys.sort -> $set {
    my @vals = $set.split(',');
    my ($primary, @rest) = @ranges[@vals];
    say @rest.perl;
    #for <ignore weak strong> -> $st {
    #    my $int = $primary.intersection(@rest, test => $st);
    #    my $union = $primary.union(@rest, test =>   $st);
    #    is(($int.defined ?? $int.Str !! ''), %geo_tests{$set}{$st}[0]);
    #    is(($union.defined ?? $union.Str !! ''), %geo_tests{$set}{$st}[1]);
    #}
}

=begin Subtraction

 r0 |--------->
 r1 |---------|
 r2 <---------|
 
 r3    |-->
 r4    |--|
 r5    <--|
 
 r6       |-------->
 r7       |--------|
 r8       <--------|

 r9            |-------->
 r10           |--------|
 r11           <--------|

 subtraction of r3 from r0  => two Ranges [1, 24, 1] and [76, 100, 1]
 subtraction of r0 from r3  => one Range [0,0,1] - empty
 subtraction of r6 from r0  => one Range [1, 74, 1] 
 subtraction of r0 from r6  => one Range [101,125,1]
 subtraction of r9 from r6  => one Range [75,100,1]
 subtraction of r6 from r9  => one Range [126,150,1]
 subtraction of r9 from r0  => original (or clone?) r0 Range [1, 100, 1] 
 subtraction of r0 from r9  => original (or clone?) r9 Range [101,150,1]

=end Subtraction

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

#for %subtract_tests.keys.sort -> $set {
#    my ($r1, $r2) = @ranges[split(',',$set)];
#    for <ignore weak strong> -> $st {
#        my @sub1 = $r1.subtract($r2, $st);
#        my @sub2 = $r2.subtract($r1, $st);
#        is(join(',', @sub1».Str), %subtract_tests{$set}{$st}[0]);
#        is(join(',', @sub2».Str), %subtract_tests{$set}{$st}[1]);
#    }
#}

done_testing();