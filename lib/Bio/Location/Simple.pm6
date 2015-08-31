use v6;

use Bio::Role::Location;
use Bio::Type::Location;

class Bio::Location::Simple does Bio::Role::Location {
    
    method Str {
        my $str = join('',
            ?$.seqid ?? $.seqid ~ ':' !! '', 
            %SYMBOL-TYPE{$.start-pos-type},
            $.start,
            %SYMBOL-TYPE{$.type},
            $.end,
            %SYMBOL-TYPE{$.end-pos-type});
    }
    
}

