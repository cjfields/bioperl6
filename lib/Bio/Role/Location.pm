role Bio::Role::Location;

does Bio::Role::Range;

has Str $.location_type         is rw;

# thinking the below could possibly be flattened into Location or Range
# via curry/assuming?
has Bio::Role::CoordinatePolicy $.coordinate_policy     is rw;
has Str seq_id                  is rw;
has Bool is_remote              is rw;

our Int method min_start {...}
our Int method max_start {...}
our Int method min_end {...}
our Int method max_end {...}
our Str method start_pos_type {...}
our Str method end_pos_type {...}
our method flip_strand {...}

our Str to_string {...}
our Bio::Role::Location next_Location {...}
our Bool method is_valid {...}
