use v6;

use Bio::Role::Pluggable;
use Bio::Role::RecordFormat;

class Bio::SeqIO does Bio::Role::Pluggable['SeqIO']
                 does Bio::Role::RecordFormat
                 {
    
    submethod BUILD(*%args) {
        die "Must provide format" unless %args<format>:exists;
        
        if %args<format> ~~ / <[-]> / {
            ($!format, $!format-variant) = %args<format>.split: '-', 2;
        } else {
            $!format = %args<format>.lc;
        }

        my $plugin = "Bio::SeqIO::" ~ $!format;
        
        try {
            require $plugin;
        };
        
        if ::($plugin) ~~ Failure {
            die "Can't load $plugin: $!";
        } else {
            # mix in the plugin module
            self does ::($plugin);
        }
        self.initialize_io(|%args);
    }
    
    method next-Seq { ... }
    
    method write-Seq { ... }
    
    method guess-format { ... }
}
