use v6;

use Bio::Role::Pluggable;
use Bio::Role::RecordFormat;
use Bio::Role::IO;

class Bio::SeqIO does Bio::Role::Pluggable['SeqIO']
                 does Bio::Role::RecordFormat
                 #does Bio::Role::IO
                 {
    
    has $!plugin handles <next-Seq write-Seq>;

    submethod BUILD(:$!format,
                    :$!format-version?,
                    :$!format-variant?,
                    *%args) {
        
        if $!format ~~ / <[-]> / {
            ($!format, $!format-variant) = $!format.split: '-', 2;
        } else {
            $!format = $!format.lc;
        }
        
        my $plugin = "Bio::SeqIO::" ~ $!format;
        
        try {
            require ::($plugin);
        };
        
        if ::($plugin) ~~ Failure {
            #note(@*INC.join("\t"));
            die "Can't load $plugin: $!";
            
        } else {
            $!plugin = ::($plugin).new(|%args);
        }
    }
    
    method guess-format { ... }
}
