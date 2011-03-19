role Bio::Role::Location;
#probably add range in time
#does Bio::Role::Range;

has Int $!start is rw = 0;
has Int $!end is rw = 0;
has Str $.seq_id is rw;
has Bool $.is_remote is rw = False;

#will be type of : Location_Pos_Type
has Str $.start_pos_type is rw = 'EXACT';
has Str $.end_pos_type is rw = 'EXACT';

#need to be Location_Type obj
has Str $.location_type is rw = 'EXACT';

#need to be Sequence_strand Obj
has Str $!strand is rw = 0;

# this is for 'fuzzy' locations like WITHIN, BEFORE, AFTER
has Int $.start_offset is rw = 0;
has Int $.end_offset is rw = 0;



#really want to get rid of all the hashes below
#however cannot since subtype do not WORK with attributes!
#strand switch since we allow '+' and '-'
our %strands_switch = ('+' => 1 , '-' => -1);

our %RANGEENCODE  = ('..' => 'EXACT',
             '^'   => 'IN-BETWEEN' );

our %RANGEDECODE  = ('EXACT'      => '..',
             'IN-BETWEEN' => '^' );

our %POSTYPEENCODE = ('<' => 'BEFORE',
                     '>' => 'AFTER');

our %POSTYPEDECODE = ('BEFORE'  => '<',
                     'AFTER'   => '>');
#########################################

method new(*%params){
    my $x = self.bless(*,|%params);
    
    #parameter checking that should go away when subtypes work with attributes
    #swapping out  '+' and '-' for integers in strand
    if ( %strands_switch.exists($x.strand)) {
        $x.strand = %strands_switch{%params{'strand'}};
    }

    #swapping out '..' and '^' for words in location_type
    if ( %RANGEENCODE.exists($x.location_type)) {
        $x.location_type = %RANGEENCODE{%params{'location_type'}};
    }

    #swapping out '<' and '>' for words in start/end pos type
    if ( %POSTYPEENCODE.exists($x.start_pos_type)) {
        $x.start_pos_type = %POSTYPEENCODE{%params{'start_pos_type'}};
    }
    if ( %POSTYPEENCODE.exists($x.end_pos_type)) {
        $x.end_pos_type = %POSTYPEENCODE{%params{'end_pos_type'}};
    }

    #checking for fuzzy stuff here
    if ( %params.exists('start') && %params{'start'} ~~ /\<(\d+)/) {
        $x.start ~~ s/\<//;
        $x.start_pos_type = 'BEFORE';
    } 

    return $x;
}

multi method min_start() {
    my $start = self.start;
    return if !$start || (self.start_pos_type eq 'BEFORE');
    return $start;
}

multi method max_start() {
    my $start = self.start;
    return unless $start;
    ($start + self.start_offset);
}

multi method max_end() {
    my $end = self.end;
    return if !$end || (self.end_pos_type eq 'AFTER');
    return ($end + self.end_offset);
}

multi method min_end() {
    return self.end;
}

method flip_strand() {
    self.strand = self.strand * -1;
}

multi method strand(){
    return $!strand;
}

multi method strand($value){
    $!strand=$value;
}

multi method start(){
    return $!start;
}

multi method start($value){
    $!start=$value;
}

multi method end(){
    return $!end;
}

multi method end($value){
    $!end=$value;
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
