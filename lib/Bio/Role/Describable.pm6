use v6;

role Bio::Role::Describable {

    has Str $.display-name              is rw = 'new-id';
    has Str $.description               is rw;
    
}
