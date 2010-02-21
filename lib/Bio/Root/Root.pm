class Bio::Root::Root {

# split up strictness (exceptions) and verbosity (debugging/logging)
has Bool    $.verbose   is rw;
has Int     $.strict    is rw;

# stub methods for a simple root class, will make these a bit more bioperl-like

# exceptions definitely need fleshing out

# Note: Bio::Root::IO is to be a Role, IO-related methods not included here.

method throw (Str $string) {
    my $title = "------------- EXCEPTION -------------";
    my $footer = ('-' x $title.chars) ~ "\n";
    !!! ??? "\n$title\n" ~ "MSG: $string\n" ~ "$footer\n";
}

method throw_not_implemented (Str :$string) {
    self.throw("Method not implemented");
}

method warn (Str $string) {
    if self.verbose == 2 {
        return self.throw($string)
    }
    my $title = "------------- WARNING -------------";
    my $footer = ('-' x $title.chars) ~ "\n";
    if 0 <= self.verbose {
        ??? "\n$title\n" ~ "MSG: $string\n" ~ "$footer\n";
    }
}

method warn_not_implemented () {
    self.warn("Method not implemented");
}

method debug (Str $string? = '') {
    ??? $string if self.verbose > 0;
}

}