use v6;

use lib './lib';

use Test;

use Bio::Tools::FTLocationParser;

my $parser = Bio::Tools::FTLocationParser.new();

ok(1);

my $fh = open('t/data/location_data.txt', :r);

my $ct = 0;
for $fh.lines -> $line {
    my ($locstr, *@rest) = split("\t", $line);
    my $ast = $parser.from-string($locstr);
    #last if $ct++ == 10;
    #Bio::Grammar::FTLocation.parse($locstr);
    ok($ast.defined, 'yep: ' ~ $locstr);
}
    
$fh.close;

done();
