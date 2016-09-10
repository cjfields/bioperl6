use v6;
use Bio::SeqIO;

my $file = @*ARGS.shift;
my $in = Bio::SeqIO.new(:format<fasta>, :file($file));

my $ct = 0;

while $in.next-Seq -> $record {
    $ct++;
}

say "Count: $ct";
