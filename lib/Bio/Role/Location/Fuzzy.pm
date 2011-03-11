use v6;
use Bio::Role::Location;

role Bio::Role::Location::Fuzzy does Bio::Role::Location {

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
