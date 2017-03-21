use v6;

use lib './lib';

use Test;

use Bio::SeqIO;

ok(1);

my $in = Bio::SeqIO.new(format  => 'fasta');

is($in.format, 'fasta', 'format');

dies-ok { $in.format = 'fastq' }, 'readonly';

# no version or variant (these are optional)
ok($in.format-version ~~ Any, 'version');
ok($in.format-variant ~~ Any, 'variant');

# explicit
$in = Bio::SeqIO.new(format  => 'fasta',
                    format-version  => 1.0,
                    format-variant  => 'old');

is($in.format, 'fasta', 'format');
is($in.format-version, 1.0, 'version');
dies-ok { $in.format-version = 2.0 }, 'readonly';
dies-ok { $in.format-variant = 'new'}, 'readonly';

is($in.format-variant, 'old', 'variant');

# format-variant
$in = Bio::SeqIO.new(format  => 'fasta-old',
                    format-version  => 1.0);

is($in.format, 'fasta', 'format');
is($in.format-version, 1.0, 'version');
is($in.format-variant, 'old', 'variant');

dies-ok {Bio::SeqIO.new(format  => "foo")}, 'dies with an unknown format';

done-testing();
