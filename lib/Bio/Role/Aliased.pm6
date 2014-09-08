role Bio::Role::Aliased;

# this is a stub for aliasing attributes; aliases are ro for now
# based on a simple aliasing trait by Jonathan Worthington

multi trait_mod:<is>(Attribute:D $attr, :$aliased!) is export {
    my $accessor_name = $attr.name.substr(2);
    
    say $attr.package.HOW;
    
    # TODO: this only works for class declarations and not roles
    for $aliased.list -> $name {
        $attr.package.HOW.add_method($attr.HOW, $name, method {
            self."$accessor_name"()
        } );
    }
}
