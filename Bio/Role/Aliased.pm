# this is a stub for aliasing attributes; aliases are ro for now
# (need to introspect and create the mutator if the attribute is rw)

multi trait_mod:<is>(AttributeDeclarand $a, $names, :$aliased!) {
    my $accessor_name = $a.name.substr(2);
    my $get = method { self."$accessor_name" };
    for $names.list -> $name {
        $a.how.add_method($a.how, $name, $get);
    }
}
