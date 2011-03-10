use v6;
role Bio::Role::Location::Split {

#probably move to a general Role    
has Int $.start is rw;
has Int $.end is rw;
has Str $.seq_id is rw;
has Str $.strand is rw;
###

method sub_Location(*@params){
    return 'NYI';
}


method add_sub_Location(*@params){
    return 'NYI';
}

method each_Location(*@params){
    return 'NYI';
}

method to_FTstring(){
    return 'NYI';
}


method min_start() {
    return 'NYI';
}

method max_start() {
    return 'NYI';
}

method max_end() {
    return 'NYI';
}

method min_end() {
    return 'NYI';
}


}
