use v6;

use Bio::Grammar::FTLocation;

class Bio::Tools::FTLocationParser {
    
    my class FTLocation::Actions {
        
        has @!location-stack;
        
        method local_location($/) {
            say $/.gist
        }
    }
    
    method from-string(Str $locstr) {
        my $loc;
        
        # grab the AST from the grammar
        my $ast = Bio::Grammar::FTLocation.parse($locstr, :actions(FTLocation::Actions));
        #my $ast = Bio::Grammar::FTLocation.parse($locstr);
        
        # we can do this lazily and let the class deal with the AST, or create objects
        # on the fly (not an easy way to do this lazily currently)
    }
}