#use Bio::Role::Aliased;

role Bio::Role::Describe {
    # these are the primary data available that are similar to the BioPerl
    # Bio::DescribableI interface.
    
    has Str $.display_name              is rw = 'new-id';
    has Str $.description               is rw;
    #has Str $.description               is rw is aliased<desc>;
}
