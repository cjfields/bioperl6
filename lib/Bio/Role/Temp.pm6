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

submethod DESTROY {
    say "Destroyed!!!";
}

#sub tempfile { 
#    my ($self, @args) = @_;
#    my ($tfh, $file);
#    my %params = @args;
#
#    # map between naming with and without dash
#    for my $key (keys(%params)) {
#        if( $key =~ /^-/  ) {
#            my $v = $params{$key};
#            delete $params{$key};
#            $params{uc(substr($key,1))} = $v;
#        } else {
#            # this is to upper case
#            my $v = $params{$key};
#            delete $params{$key};
#            $params{uc($key)} = $v;
#        }
#    }
#    $params{'DIR'} = $TEMPDIR if(! exists($params{'DIR'}));
#
#    unless (exists $params{'UNLINK'} &&
#            defined $params{'UNLINK'} &&
#            ! $params{'UNLINK'} ) {
#        $params{'UNLINK'} = 1;
#    } else {
#        $params{'UNLINK'} = 0;
#    }
#
#    if($FILETEMPLOADED) {
#        if(exists($params{'TEMPLATE'})) {
#            my $template = $params{'TEMPLATE'};
#            delete $params{'TEMPLATE'};
#            ($tfh, $file) = File::Temp::tempfile($template, %params);
#        } else {
#            ($tfh, $file) = File::Temp::tempfile(%params);
#        }
#    } else {
#        my $dir = $params{'DIR'};
#        $file = $self->catfile(
#            $dir,
#            (exists($params{'TEMPLATE'}) ?
#             $params{'TEMPLATE'} :
#             sprintf( "%s.%s.%s", $ENV{USER} || 'unknown', $$, $TEMPCOUNTER++))
#        );
#
#        # sneakiness for getting around long filenames on Win32?
#        if( $HAS_WIN32 ) {
#            $file = Win32::GetShortPathName($file);
#        }
#
#        # Try to make sure this will be marked close-on-exec
#        # XXX: Win32 doesn't respect this, nor the proper fcntl,
#        #      but may have O_NOINHERIT. This may or may not be in Fcntl.
#        local $^F = 2;
#        # Store callers umask
#        my $umask = umask();
#        # Set a known umaskr
#        umask(066);
#        # Attempt to open the file
#        if ( sysopen($tfh, $file, $OPENFLAGS, 0600) ) {
#            # Reset umask
#            umask($umask);
#        } else {
#            $self->throw("Could not write temporary file '$file': $!");
#        }
#    }
#
#    if(  $params{'UNLINK'} ) {
#        push @{$self->{'_rootio_tempfiles'}}, $file;
#    }
#
#    return wantarray ? ($tfh,$file) : $tfh;
#}



