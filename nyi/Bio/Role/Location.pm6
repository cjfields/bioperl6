role Bio::Role::Location {
    #probably add range in time
    #does Bio::Role::Range;

    has Str $.seq_id is rw;
    has Bool $.is_remote is rw = False;

    #will be type of : Location_Pos_Type
    has Str $.start_pos_type is rw = 'EXACT';
    has Str $.end_pos_type is rw = 'EXACT';

    #need to be Location_Type obj
    has Str $.location_type is rw = 'EXACT';



    #need to be Sequence_strand Obj
    has Str $!strand is rw = 0;


    multi method flip_strand() {
	$!strand = $!strand * -1;
    }

    multi method strand(){
	return $!strand;
    }

    multi method strand($value){
	$!strand=$value;
    }

    multi method each_Location($order?) {
	return self;
    }


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
}
