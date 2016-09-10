use v6;

# This is using p5 BioPerl Bio::SeqIO
use Bio::SeqIO:from<Perl5>;

my $file = @*ARGS.shift;

# Note: left side needs quotes; keys are not automaically strings in p6
my $in = Bio::SeqIO.new('-format' => 'fasta', '-file' => $file);

my $ct = 0;

while $in.next_seq -> $record {
    $ct++;
}

say "Count: $ct";
