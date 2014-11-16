use v6;

use Bio::Role::Temp;

role Bio::Role::IO does Bio::Role::Temp {
    has IO::Handle $.fh handles <close encoding eof fileno flush get getc ins p print read say seek t tell write>;

    submethod BUILD(*%args) {
        self.initialize_io(|%args);
    }
    # generic IO initializer; more specific ones (e.g. has unique parameter
    # settings) should create a new multimethod with a distinct signature.
    # See Bio::SeqIO::fasta for an example
    multi method initialize_io(*%args) {
        if %args{'file'}:exists {
            $!fh = %args<file>.IO.open(|%args) orelse die "Can't open file: $!";
        }
        $!fh //= %args{'fh'} || $*OUT;
    }
    
    method file {
        $!fh.path
    }
    
    # only a method that checks the statuus of the IO::Handle
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
    
    # utility method to strip any IO directive from file name ('>', '<', '>>',
    # etc.); obsolete as this syntax isn't used anymore
    
    #method clean-file { ... }
    
    # format and variant are in a separate role, Bio::Role::RecordFormat

    #method format { ... }
    #method variant { ... }
    
    # used for higher-level buffering; maybe something that is set but can be overridden in a class
    #method _print { ... }
    #method _readline { ... }
    #method _pushback { ... }
    
    # delegate to IO::Handle, along with lots of other bits
    #method close { ... }
    #method flush { ... }
    
    # Boolean that indicates the file handle should be left open when the object
    # is garbage-collected; not sure this is still applicable (we can keep the
    # fh object around until needed)

    #method no-close { ... }
    
    # explicit method called to clean up state with IO instance
    #method _io-cleanup { ... }
    
    # Boolean, checks whether passed executable exists in path. Move to new role?
    #method exists-exe { ... }
    
    # get a temp file with some common state retained per instance (e.g. template, suffix).  Maybe new role?
    #method tmpfile { ... }
    
    # get a temp dir with some common state retained per instance (e.g. template, suffix, TEMPDIR).  Maybe new role?
    method tmpdir {  }
    
    # basically delegates to File::Spec if present, so likely obsolete
    method catfile(*@path) {
        $*SPEC.catfile(|@path);
    }
        
    method catdir(*@path) {
        $*SPEC.catdir(|@path);
    }
    
    # delegates to File::Path; not sure this is necessary here except as convenience    
    #method rm-tree { ... }
    
    #method _flush-on-write { ... }
    
    #method save-temp-files { ... }
    
    #submethod BUILD(:$!file!, :$!fh) {
    #    if defined $!file and defined $fh {
    #        die "Can only define file or filehandle, not both"
    #    }
    #}

    #method new(Str $format, $file,:$write?){
    #        my Junction $formats = any ('fasta'|'genbank');
    #        
    #        my $obj;
    #        
    #        #could maybe use a junction in the future but simple for now
    #        if lc($format) eq 'fasta' {
    #                use Bio::Role::FastaIO;
    #                $obj = self.bless(*,:$format) does Bio::Role::FastaIO[$file];
    #                
    #                #should not have to do this......
    #                if $write {
    #                        $obj.initial_write();
    #                }
    #                else {
    #                    $obj!set_io(True,separator => '>');
    #                }
    #        }
    #        else {
    #                #need to use Bio::Root::Root
    #                say ("Cannot accept $format yet");
    #        }
    #        
    #        return $obj;	
    #}
    #

}
