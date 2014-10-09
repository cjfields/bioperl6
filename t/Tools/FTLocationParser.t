use v6;

use lib './lib';

use Test;

use Bio::Tools::FTLocationParser;

my $parser = Bio::Tools::FTLocationParser.new();

ok(1);

my $fh = open('t/data/location_data.txt', :r);

my $ct = 0;
while $fh.get -> $line {
    my ($locstr, *@rest) = split("\t", $line);
    $parser.from-string($locstr);
    last if $ct++ == 3;
    #Bio::Grammar::FTLocation.parse($locstr, :actions(Test::Actions.new()));
    #ok($/.defined, $locstr);    
}
    
$fh.close;

done();
