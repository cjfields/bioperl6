use v6;
role Bio::Location::Simple {


has Int $.start is rw = 0;
has Int $.end is rw = 0;
has Str $.seq_id is rw;
has Bool $.is_remote is rw = False;

#will be type of : Location_Pos_Type
has Str $.start_pos_type is rw = 'EXACT';
has Str $.end_pos_type is rw = 'EXACT';

#need to be Location_Type obj
has Str $.location_type is rw = 'EXACT';

#need to be Sequence_strand Obj
has Str $.strand is rw = 0;



# this is for 'fuzzy' locations like WITHIN, BEFORE, AFTER
has Int $.start_offset is rw = 0;
has Int $.end_offset is rw = 0;

method to_string() {
    return 'NYI';
}

method is_fuzzy() {
#    ( %IS_FUZZY.exists(self.start_pos_type) ||
#         %IS_FUZZY.exists(self.end_pos_type)) ?? True !! False;
    return 'NYI';
}

method length() {
    given (self.location_type) {
        when 'EXACT' {
            return self.end - self.start + 1;
        }
        when 'WITHIN' {
            return self.end - self.start + 1;
        }        
        default {
            return 0
        }
    }
    return 'NYI';
}



method valid_Location() {
    return defined($.start) && defined($.end) ?? True !! False;
}

method min_start() {
    my $start = self.start;
    return if !$start || (self.start_pos_type eq 'BEFORE');
    return $start;
}

method max_start() {
    my $start = self.start;
    return unless $start;
    ($start + self.start_offset);
}

method max_end() {
    my $end = self.end;
    return if !$end || (self.end_pos_type eq 'AFTER');
    return ($end + self.end_offset);
}

method min_end() {
    my $end = self.end;
    return unless $end;
}


    
}
