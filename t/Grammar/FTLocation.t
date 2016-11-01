use v6;

use lib './lib';

use Test;

use Bio::Grammar::FTLocation;

ok(Bio::Grammar::FTLocation ~~ Grammar);

{
    my $abs_ct = my $complex_ct = my $total_ct = 0;
    class Test::Actions {
        method TOP($/) { $total_ct++ }
        method absolute_location($/) { $abs_ct++ }
        method complex_location($/) { $complex_ct++ }
    };
    
    my $fh = open($*SPEC.catfile(<t data location_data.txt>, :r));

    # sorting is to keep the order constant from one run to the next
    while $fh.get -> $line {
        my ($locstr, *@rest) = split("\t", $line);
        Bio::Grammar::FTLocation.parse($locstr, :actions(Test::Actions.new()));
        ok($/.defined, $locstr);
        
    }
    
    $fh.close;
    is($total_ct, 38);
    is($abs_ct, 227);
    is($complex_ct, 121);
}

done-testing();
