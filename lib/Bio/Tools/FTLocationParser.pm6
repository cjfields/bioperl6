use v6;

# Using a variation on the old NCBI FT BNF, but perl6-ized

use Bio::Grammar::FTLocation;

class Bio::Tools::FTLocationParser;

my class FTLocation::Actions {
    method location($/) { say $/.perl ~ "\n"; }
}

method from-string(Str $locstr) {
    my $loc;
    
    # grab the AST from the grammar
    my $ast = Bio::Grammar::FTLocation.parse($locstr, :actions(FTLocation::Actions));
    
    # we can do this lazily and let the class deal with the AST, or create objects
    # on the fly (not an easy way to do this lazily currently)
}
