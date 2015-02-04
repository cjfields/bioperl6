use v6;

use Bio::Role::Temp;

role Bio::Role::IO does Bio::Role::Temp {
    
    # TODO: not sure we need to curry everything here, but list of methods is a rakudo bug
    has IO::Handle $.fh handles IO::Handle;

    # At the moment we force all IO consumers to initialize-io if they have this
    # simple signature
    submethod BUILD(:$fh?, :$file?, *%args) {
        self.initialize-io(:$fh, :$file, |%args);
    }
    
    # generic IO initializer; more specific ones (e.g. has unique parameter
    # settings) should create a new multimethod with a distinct signature and
    # run 'nextsame'. See Bio::SeqIO::fasta for an example.

    multi method initialize-io(:$fh?, :$file?, *%args) {
        if $file {
            # TODO: may want to send explicit list of args to IO (not flattened list of everything)
            $!fh = $file.IO.open(|%args) orelse die "Can't open file: $!";
        }
        $!fh //= $fh || $*OUT;
    }
    
    # not an attribute!!
    method file {
        $!fh.path
    }
    
    # only a method that checks the statuus of the IO::Handle; not completely
    # implemented but should be soon
    
    method mode {
        my $mode;
        given $!fh {
            when .r  {
                $mode ~= 'r';
                proceed;
            }
            when .w {
                $mode ~= 'w';
            }
            default {
                $mode //= '?';
            }
        }
        $mode;
    }
    
    # basically delegates to File::Spec if present, so likely obsolete
    method catfile(*@path) {
        $*SPEC.catfile(|@path);
    }
        
    method catdir(*@path) {
        $*SPEC.catdir(|@path);
    }
}
