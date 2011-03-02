use v6;

BEGIN {
    @*INC.push('./lib');
}
use Test;
eval_lives_ok 'use Bio::Location::Simple', 'Can use Bio::Location::Simple';
use Bio::Location::Simple;

my $simple = Bio::Location::Simple.new(
     start  => 10,
     end    => 20,
     strand => 1,
     seq_id => 'my1',
     is_remote => 1);
# isa_ok($simple, 'Biome::Location::Simple');
# does_ok($simple, 'Biome::Role::Location::Simple',  'does Location');
# does_ok($simple, 'Biome::Role::Location::Does_Range',  'has basic Range interface');
# does_ok($simple, 'Biome::Role::Location::Does_Location',  'has more defined Location interface');

is($simple.start, 10, 'has a start location');
is($simple.end, 20,  'has an end location');
is($simple.seq_id, 'my1',  'has an identifier');
is($simple.start_pos_type, 'EXACT', 'pos_type is EXACT for start');
is($simple.end_pos_type, 'EXACT', 'pos_type is EXACT for end');
ok($simple.valid_Location);
is($simple.location_type, 'EXACT',  'has a default location type');
ok(!$simple.is_fuzzy);

is($simple.to_string, 'my1:10..20', 'full FT string');

# test that even when end < start that length is always positive
my $f = Bio::Location::Simple.new(
        strict  => -1,
        start   => 100, 
        end     => 20, 
        strand  => 1);

is($f.length(), 81, 'Positive length');
is($f.strand(),-1,  'Negative strand' );

is($f.to_string, 'complement(20..100)','full FT string');

my $exact = Bio::Location::Simple.new(
                    start         => 10,
                    end           => 11,
                    location_type  => 'IN-BETWEEN',
                    strand        => 1, 
                    seq_id        => 'my2');

is($exact.start, 10, 'Biome::Location::Simple IN-BETWEEN');
is($exact.end, 11);
is($exact.seq_id, 'my2');
is($exact.length, 0);
is($exact.location_type, 'IN-BETWEEN');
ok(!$exact.is_fuzzy);

is($exact.to_string, '10^11','full FT string');

# check coercions with location_type and strand
$exact = Bio::Location::Simple.new(
                    start         => 10, 
                    end           => 11,
                    location_type  => '^',
                    strand        => '+');

is($exact.start, 10, 'Bio::Location::Simple IN-BETWEEN');
is($exact.end, 11);
is($exact.strand, 1, 'strand coerced');
is($exact.seq_id, Any);
is($exact.length, 0);
is($exact.location_type, 'IN-BETWEEN');
is($exact.start_pos_type, 'EXACT');
is($exact.end_pos_type, 'EXACT');

is($exact.to_string, '10^11', 'full FT string');

$exact = Bio::Location::Simple.new(
                    start          => 10, 
                    end            => 20,
                    start_pos_type => '<',
                    end_pos_type   => '>', # this should default to 'EXACT'
                    strand         => '+');

is($exact.start, 10);
is($exact.end, 20);
is($exact.strand, 1, 'strand coerced');
is($exact.seq_id, Any);
# is($exact->length, 11);

# this doesn't seem correct, shouldn't it be 'FUZZY' or 'UNCERTAIN'?
is($exact.location_type, 'EXACT');

is($exact.start_pos_type, 'BEFORE');
is($exact.end_pos_type, 'AFTER');
ok($exact.is_fuzzy);

is($exact.to_string, '<10..>20', 'full FT string');

# check coercions with start/end_pos_type, and length determination
$exact = Bio::Location::Simple.new(
                    start          => 10, 
                    end            => 20,
                    start_pos_type => '<',
                    strand         => '+');

is($exact.start, 10);
is($exact.end, 20);
is($exact.strand, 1, 'strand coerced');
is($exact.seq_id, Any);
is($exact.length, 11);
is($exact.location_type, 'EXACT');
is($exact.start_pos_type, 'BEFORE');
is($exact.end_pos_type, 'EXACT');

is($exact.to_string, '<10..20', 'full FT string');

# check exception handling
# throws_ok { $exact = $exact = Bio::Location::Simple->new(
#                     -start          => 10, 
#                     -end            => 12,
#                     -start_pos_type => '>',
#                     -strand         => '+') }
#     qr/Start position can't have type AFTER/,
#     'Check start_pos_type constraint';

# throws_ok { $exact = $exact = Bio::Location::Simple->new(
#                     -start          => 10, 
#                     -end            => 12,
#                     -end_pos_type   => '<',
#                     -strand         => '+') }
#     qr/End position can't have type BEFORE/,
#     'Check end_pos_type constraint';
  
  
# throws_ok {$exact = Bio::Location::Simple->new(-start         => 10, 
#                                    -end           => 12,
#                                    -location_type => 'IN-BETWEEN')}
#     qr/length of location with IN-BETWEEN/,
#     'IN-BETWEEN must have length of 1';  

# fuzzy location tests
my $fuzzy = Bio::Location::Simple.new(
                                     start    => 10,
                                     start_pos_type => '<',
                                     end      => 20,
                                     strand   => 1, 
                                     seq_id   =>'my2');

is($fuzzy.strand, 1, 'Bio::Location::Simple tests');
is($fuzzy.start, 10);
is($fuzzy.end,20);
ok(!defined $fuzzy.min_start);
is($fuzzy.max_start, 10);
is($fuzzy.min_end, 20);
is($fuzzy.max_end, 20);
is($fuzzy.location_type, 'EXACT');
is($fuzzy.start_pos_type, 'BEFORE');
is($fuzzy.end_pos_type, 'EXACT');
is($fuzzy.seq_id, 'my2');
#is($fuzzy.seq_id('my3'), 'my3');

$f = Bio::Location::Simple.new(
                               strict  => -1,
                               start   => 100, 
                               end     => 20, 
                               strand  => 1);

is($f.length, 81, 'Positive length');
is($f.strand,-1);

# Test Bio::Location::Simple

ok($exact = Bio::Location::Simple.new(start    => 10, 
                                         end      => 20,
                                         strand   => 1, 
                                         seq_id   => 'my1'));
#ok($exact ~~ Bio::Role::Location::Does_Range);

is( $exact.start, 10, 'Bio::Location::Simple EXACT');
is( $exact.end, 20);
is( $exact.seq_id, 'my1');
is( $exact.length, 11);
is( $exact.location_type, 'EXACT');

ok ($exact = Bio::Location::Simple.new(start         => 10, 
                                      end           => 11,
                                      location_type => 'IN-BETWEEN',
                                      strand        => 1, 
                                      seq_id        => 'my2'));

is($exact.start, 10, 'Bio::Location::Simple BETWEEN');
is($exact.end, 11);
is($exact.seq_id, 'my2');
is($exact.length, 0);
is($exact.location_type, 'IN-BETWEEN');

# 'fuzzy' locations are combined with simple ones in Bio

# my $error = qr/length of location with IN-BETWEEN position type cannot be larger than 1/;

# # testing error when assigning 10^12 simple location into fuzzy
# throws_ok {
#     $fuzzy = Bio::Location::Simple->new(
#                                         -start         => 10, 
#                                         -end           => 12,
#                                         -location_type  => '^',
#                                         -strand        => 1, 
#                                         -seq_id        => 'my2');
# } $error, 'Exception:IN-BETWEEN locations should be contiguous';

# $fuzzy = Bio::Location::Simple->new(-location_type => '^',
#                                   -strand        => 1, 
#                                   -seq_id        => 'my2');

# $fuzzy->start(10);
# throws_ok { $fuzzy->end(12) } $error, 'Exception:IN-BETWEEN locations should be contiguous';

# $fuzzy = Bio::Location::Simple->new(-location_type => '^',
#                                   -strand        => 1, 
#                                   -seq_id        =>'my2');

# $fuzzy->end(12);
# throws_ok { $fuzzy->start(10); } $error, 'Exception:IN-BETWEEN locations should be contiguous';


done();
