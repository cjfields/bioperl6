#use Bio::Role::Aliased;

role Bio::Role::Describe {
    # these are the primary data available that are similar to the BioPerl
    # Bio::DescribableI interface.
    
    has Str $.display_name              is rw = 'new-id';
    has Str $!description               is rw;
    #best way would to have aliased working again - takadonet
    #has Str $.description               is rw is aliased<desc>;

our method description($desc?) {
    if (defined $desc) {
        $!description =$desc;
    }
    return $!description;
}

our method desc($desc?) {
    return self.description($desc);
}

    
}
