use v6;

use lib './lib';

use Test;

use Bio::SeqIO;

ok(1);

my $in = Bio::SeqIO.new(format  => 'fasta');

is($in.format, 'fasta');

done();
