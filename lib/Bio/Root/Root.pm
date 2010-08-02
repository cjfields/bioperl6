class Bio::Root::Root {

# split up strictness (exceptions) and verbosity (debugging/logging)
has Bool    $.verbose   is rw = False;
has Int     $.strict    is rw = 0;

# not sure we need this yet
our method throw (Str $string) {
    my $title = "------------- EXCEPTION -------------";
    my $footer = ('-' x $title.chars) ~ "\n";
    die "\n$title\n" ~ "MSG: $string\n" ~ "$footer\n";
}

our method warn (Str $string) {
    if self.verbose == 2 {
        return self.throw($string)
    }
    my $title = "------------- WARNING -------------";
    my $footer = ('-' x $title.chars) ~ "\n";
    if self.verbose >= 0 {
        my $msg = "\n$title\n" ~ "MSG: $string\n" ~ "$footer\n";
        # TODO: change to warn(), which is a bit buggy ATM
        warn($msg);
    }
}

our method debug (Str $string? = '') {
    ??? $string if self.verbose > 0;
}

}
