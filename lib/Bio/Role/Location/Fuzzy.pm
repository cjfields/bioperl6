use v6;
role Bio::Role::Location::Fuzzy {

#probably move to a general Role    
has Int $.start is rw;
has Int $.end is rw;
has Str $.seq_id is rw;
has Str $.strand is rw;
has Str $.location_type is rw;
has Str $.start_pos_type is rw = 'EXACT';
has Str $.end_pos_type is rw = 'EXACT';
###

method each_Location() {
    return self;
}

method to_FTstring() {
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
