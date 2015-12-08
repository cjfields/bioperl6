use v6;

use File::Temp;

role Bio::Role::Temp {
    
    has Bool $.cleanup-tempdir = True;
    has Bool $.cleanup-tempfiles = True;
    has @!tempdirs;
    my $tempcounter = 0;
    
    method tempfile(*%args) {
        # local passed arguments should override the global settings, not ignore them
        if %args{'unlink'}:!exists {
            %args{'unlink'} = False ;
        }
        return tempfile(|%args);
    }
    
    # a hack for temp directories; a version is working for File::Temp but is stuck
    # in a pull request
    method tempdir(Bool :$cleanup) {
        $!cleanup-tempdir = $cleanup if $cleanup;
        my $tdir = $*SPEC.catfile( $*TMPDIR,
            sprintf("dir_%s-%s-%s",
                      %*ENV{'USER'} || 'unknown',
                      $*PID,
                      $tempcounter++));
        mkdir($tdir, 0o755);
        @!tempdirs.push: $tdir;
        return $tdir;
    }

}