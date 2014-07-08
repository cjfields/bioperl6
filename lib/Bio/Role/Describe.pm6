use v6;

role Bio::Role::Describe;

    
has Str $.display_name              is rw = 'new-id';
has Str $.description               is rw;
#best way would to have aliased working again - takadonet
#has Str $.description               is rw is aliased<desc>;

method desc($desc?) {
    return self.description($desc);
}
