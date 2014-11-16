use v6;

use File::Temp;

role Bio::Role::Temp;

has Bool $.cleanup-tmpdir = True;
has Bool $.cleanup-tmpfiles = True;
has @!tmpdirs;
my $tmpcounter = 0;

method tmpfile(*%args) {
    
    # local passed arguments should override the global settings, not ignore them
    
    if %args{'unlink'}:!exists {
        %args{'unlink'} = False ;
    }
    tempfile(|%args);
}

# a hack for temp directories; we need to get a version working for File::Temp
method tmpdir(Bool :$cleanup) {
    $!cleanup-tmpdir = $cleanup if $cleanup;
    my $tdir = $*SPEC.catfile( $*TMPDIR,
        sprintf("dir_%s-%s-%s",
                  %*ENV{'USER'} || 'unknown',
                  $*PID,
                  $tmpcounter++));
    mkdir($tdir, 0o755);
    @!tmpdirs.push: $tdir;
    return $tdir;
}
