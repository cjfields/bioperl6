role Bio::Role::Location;
#probably add range in time
#does Bio::Role::Range;
    

# below should be the interface
# # thinking the below could possibly be flattened into Location or Range
# # via curry/assuming?
# probably not doing CoordinatePolicy
# has Bio::Role::CoordinatePolicy $.coordinate_policy     is rw;

# not sure how I'm going to handle this yet
# our Int method min_start {...}
# our Int method max_start {...}
# our Int method min_end {...}
# our Int method max_end {...}
# our Str method start_pos_type {...}
# our Str method end_pos_type {...}
# our method flip_strand {...}

# our Str to_string {...}
# our Bio::Role::Location next_Location {...}
# our Bool method is_valid {...}
