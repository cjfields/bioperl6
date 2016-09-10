use v6;
use Bio::Grammar::Fasta;

my $file = @*ARGS.shift;
my $data = Bio::Grammar::Fasta.parsefile($file);

my $ct = 0;
for $data<record> -> $record {
    $ct++;
}

say $ct;
