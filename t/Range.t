use v6;

use Test;
use Bio::Range;

plan 28;

my $r = Bio::Range.new(start => 1, end => 100, strand => 1);

isa_ok($r, 'Bio::Range');
is($r.start, 1);
is($r.end, 100);
is($r.strand, 1);
is($r.length, 100);

# strand is a Bio::Strand subset, must be 0, 1, -1, undef
ok($r.strand ~~ Bio::Strand);
dies_ok({$r.strand = 5});
is($r.strand, 1);
lives_ok({$r.strand = -1});
is($r.strand, -1);
lives_ok({$r.strand = undef});

# length
$r = Bio::Range.new(start => 1);
dies_ok({$r.length}); # need both start and end coordinates for length

$r = Bio::Range.new(end => 100);
dies_ok({$r.length}); # need both start and end coordinates for length

#     r1
#|---------->
#           r2
#      |----------->
#                  r3
#            |------------>
#      r4
#    |---->
#      r5
#    <----|
#      r6
#    |----|
#      r7
#    ?----?
# 
# Note: r6 has strand = 0, r7 has strand = undef

my $r1 = Bio::Range.new(start => 1,   end => 100, strand => 1);
my $r2 = Bio::Range.new(start => 51,  end => 150, strand => 1);
my $r3 = Bio::Range.new(start => 101, end => 200, strand => 1);
my $r4 = Bio::Range.new(start => 25,  end => 75,  strand => 1);
my $r5 = Bio::Range.new(start => 25,  end => 75,  strand => -1);
my $r6 = Bio::Range.new(start => 25,  end => 75,  strand => 0);
my $r7 = Bio::Range.new(start => 25,  end => 75,  strand => undef); # strand undef

ok(!$r7.strand.defined,'check to make sure strand is not defined');

# overlaps

# strong = strand must match
# weak   = strand must match or be 0
# ignore = strand not checked
ok( $r1.overlaps($r2), '.overlaps tests');
ok( $r1.overlaps(range => $r2)); # same but named args
ok(!$r1.overlaps($r3));
ok(!$r3.overlaps($r1)); # inverse

ok($r1.overlaps($r4), '.overlaps default (ignore) tests');
ok($r1.overlaps($r5));
ok($r1.overlaps($r6));
ok($r1.overlaps($r7));

ok( $r1.overlaps($r4, 'weak'), '.overlaps weak tests');
ok(!$r1.overlaps($r5, 'weak'));
ok( $r1.overlaps($r6, 'weak'));
ok(!$r1.overlaps($r7, 'weak'));

ok( $r1.overlaps($r4, 'strong'), '.overlaps strong tests');
ok(!$r1.overlaps($r5, 'strong'));
ok(!$r1.overlaps($r6, 'strong'));
ok(!$r1.overlaps($r7, 'strong'));

# contains

# strong = strand must match
# weak   = strand must match or be 0
# ignore = strand not checked
ok(!$r1.contains($r2));
ok(!$r1.contains(range => $r2)); # same but named args
ok(!$r1.contains($r3));

ok($r1.contains($r4), '.contains default (ignore) tests');
ok($r1.contains($r5));
ok($r1.contains($r6));
ok($r1.contains($r7));

ok($r1.contains($r4, 'weak'), '.contains weak tests');
ok(!$r1.contains($r5, 'weak'));
ok($r1.contains($r6, 'weak'));
ok(!$r1.contains($r7, 'weak'));

ok($r1.contains($r4, 'strong'), '.contains strong tests');
ok(!$r1.contains($r5, 'strong'));
ok(!$r1.contains($r6, 'strong'));
ok(!$r1.contains($r7, 'strong'));

# Simple comparison using ===
#
# This is a comparison of the object identity value via .WHICH
# For a Bio::Range "$r1 === $r2" is equivalent to "$foo.equals($r2, 'strong')"

my $r8 = Bio::Range.new(start => 1, end => 100, strand => 1);

ok($r1 === $r8);
ok($r1 !=== $r2);

# equals
# 
# strong = strand must match
# weak   = strand must match or be 0
# ignore = strand not checked
#
# More fine-tuned equality check, similar to .overlaps/.contains

ok($r4.equals($r4), '.equals default (ignore) tests');
ok($r4.equals($r5));
ok($r4.equals($r6));
ok($r4.equals($r7));

ok($r4.equals($r4, 'weak'), '.equals weak tests');
ok(!$r4.equals($r5, 'weak'));
ok($r4.equals($r6, 'weak'));
ok(!$r4.equals($r7, 'weak'));

ok($r4.equals($r4, 'strong'), '.equals strong tests');
ok(!$r4.equals($r5, 'strong'));
ok(!$r4.equals($r6, 'strong'));
ok(!$r4.equals($r7, 'strong'));

ok($r1.equals($r8));
ok($r1.equals($r8,'weak'));
ok($r1.equals($r8,'strong'));

# intersection

my $i1 = $r1.intersection($r3);

ok(!$i1.defined);

$i1 = $r1.intersection($r2);

ok($i1.defined);

if $i1.defined {
    is($i1.start, 51);
    is($i1.end, 100);
    is($i1.strand, 1);
} else {
    ok(0) for 1..3;
}

$i1 = $r1.intersection($r2,$r4);

if $i1.defined {
    is($i1.start, 51);
    is($i1.end, 75);
    is($i1.strand, 1);
} else {
    ok(0) for 1..3;
}

# union

my $u1 = $r1.union($r2);

ok($u1.defined);

if $u1.defined {
    is($u1.start, 1);
    is($u1.end, 150);
    is($u1.strand, 1);
} else {
    ok(0) for 1..3;
}

$u1 = $r1.union($r2,$r3);

if $u1.defined {
    is($u1.start, 1);
    is($u1.end, 200);
    is($u1.strand, 1);
} else {
    ok(0) for 1..3;
}

#$r = $range->union($range2);
#is($r->start, 10);
#is($r->end, 25);
#
#$r = $range->intersection($range2);
#is ( $r->start, 15  ) ;
#is ( $r->end, 20    );
#is ( $r->strand, 1  );
#
## intersection and union can also take lists
#my $range3 = Bio::Range->new(-start=>18,-end=>30);
#isa_ok($range3,'Bio::Range', 'BioRange object');
#
#$r = $range->intersection([$range2, $range3]);
#ok( ( $r->start == 18 ) && ( $r->end == 20 ));
#$r = Bio::Range->intersection([$range, $range2, $range3]);
#ok($r->start == 18 && $r->end == 20);
#$r = $range->union($range2, $range3);
#ok( ( $r->start == 10 ) && ( $r->end == 30 ) );
#$r = Bio::Range->union($range, $range2, $range3);
#ok( ( $r->start == 10 ) && ( $r->end == 30 ) );
#$range3->start(21);
#ok (! $range->intersection([$range2, $range3]));
#
#ok (! $range->contains($range2));
#ok (! $range2->contains($range));
#ok ($range->overlaps($range2));
#ok ($range2->overlaps($range));
#
## testing strand
#$range3 = Bio::Range->new(-start => 15,
#                           -end => 25,
#						   -strand => 1);
#
#my $range4 = Bio::Range->new(-start => 15,
#						    -end => 25,
#							-strand => -1);
#
#isa_ok($range4,'Bio::Range', 'BioRange object');
#
#my $range5 = Bio::Range->new(-start => 15,
#                             -end => 25,
#						     -strand => 0);
#
#isa_ok($range5,'Bio::Range', 'BioRange object');
#
#my $range6 = Bio::Range->new(-start => 20,
#							 -end => 30,
#							 -strand => -1);
#
#isa_ok($range6,'Bio::Range', 'BioRange object');
#
#ok $range3->_ignore($range4), ' 1 & -1' ;     
#ok $range3->_weak($range3),' 1 & 1 true' ;       
#ok $range3->_weak($range5), ' 1 & 0 true' ;       
#ok (! $range3->_weak($range4), ' 1 & -1 false' );   
#ok $range3->_strong($range3), ' 1 & 1 true' ;     
#ok (! $range3->_strong($range5), ' 1 & 0 false' ); 
#ok (! $range3->_strong($range4), ' 1 & -1 false' ); 
#
#ok ! ( $range3->overlaps($range4,'weak'));
#ok ! ( $range4->overlaps($range3,'weak'));
#ok ! ( $range3->overlaps($range4,'strong')); 
#ok ! ( $range4->overlaps($range3,'strong')); 
#
#$range3->strand(0);
#
#ok  ( $range3->overlaps($range4,'weak'));
#ok  ( $range4->overlaps($range3,'weak')); 
#ok ! ( $range3->overlaps($range4,'strong'));
#ok ! ( $range4->overlaps($range3,'strong')); 
#
## if strands are different then intersection() should return 0...
#$r = $range3->intersection($range4);
#is ( $r->strand, 0 );
#
## or if both strands are -1 then -1 should be returned
#$r = $range6->intersection($range4);
#is ( $r->strand, -1 );
#
## test implemention of offsetStranded:
#$r = Bio::Range->new(-start => 30, -end => 40, -strand => -1);
#isa_ok($r, 'Bio::Range', 'Bio::Range object') ;
#is ($r->offsetStranded(-5,10)->toString, '(20, 45) strand=-1');
#is ($r->offsetStranded(+5,-10)->toString, '(30, 40) strand=-1');
#$r->strand(1);
#is ($r->offsetStranded(-5,10)->toString, '(25, 50) strand=1');
#is ($r->offsetStranded(+5,-10)->toString, '(30, 40) strand=1');