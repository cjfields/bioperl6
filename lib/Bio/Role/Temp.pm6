use v6;

use File::Temp;

role Bio::Role::Temp;

has Bool $save-tempfiles = False;

method tmpfile(*%args) {
    if ?$save-tempfiles && (%args{'unlink'}:exists) {
        %args{'unlink'} = False ;
    }
    tempfile(|%args);
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

method tmpdir {
    ...
}

#sub tempdir {
#    my ($self, @args) = @_;
#    if ($FILETEMPLOADED && File::Temp->can('tempdir')) {
#        return File::Temp::tempdir(@args);
#    }
#
#    # we have to do this ourselves, not good
#    # we are planning to cleanup temp files no matter what
#    my %params = @args;
#    print "cleanup is " . $params{CLEANUP} . "\n";
#    $self->{'_cleanuptempdir'} = ( defined $params{CLEANUP} &&
#                                   $params{CLEANUP} == 1);
#    my $tdir = $self->catfile( $TEMPDIR,
#                               sprintf("dir_%s-%s-%s",
#                                       $ENV{USER} || 'unknown',
#                                       $$,
#                                       $TEMPCOUNTER++));
#    mkdir($tdir, 0755);
#    push @{$self->{'_rootio_tempdirs'}}, $tdir;
#    return $tdir;
#}
