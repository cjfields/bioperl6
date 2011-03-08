use v6;
role Bio::Role::Location::Simple {


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

has %!IS_FUZZY = map {;$_ => 1} , qw<BEFORE AFTER WITHIN UNCERTAIN>;

# this is for 'fuzzy' locations like WITHIN, BEFORE, AFTER
has Int $.start_offset is rw = 0;
has Int $.end_offset is rw = 0;

#really want to get rid of all the hashes below
#however cannot since subtype do not WORK with attributes!
#strand switch since we allow '+' and '-'
my %strands_switch = ('+' => 1 , '-' => -1);

my %RANGEENCODE  = ('..' => 'EXACT',
             '^'   => 'IN-BETWEEN' );

my %RANGEDECODE  = ('EXACT'      => '..',
             'IN-BETWEEN' => '^' );

my %POSTYPEENCODE = ('<' => 'BEFORE',
                     '>' => 'AFTER');

my %POSTYPEDECODE = ('BEFORE'  => '<',
                     'AFTER'   => '>');
#########################################

method new(*%params is copy){
    
    #parameter checking that should go away when subtypes work with attributes
    #swapping out  '+' and '-' for integers in strand
    if ( %strands_switch.exists(%params{'strand'})) {
        %params{'strand'} = %strands_switch{%params{'strand'}};
    }

    #swapping out '..' and '^' for words in location_type
    if ( %RANGEENCODE.exists(%params{'location_type'})) {
        %params{'location_type'} = %RANGEENCODE{%params{'location_type'}};
    }

    #swapping out '<' and '>' for words in start/end pos type
    if ( %POSTYPEENCODE.exists(%params{'start_pos_type'})) {
        %params{'start_pos_type'} = %POSTYPEENCODE{%params{'start_pos_type'}};
    }
    if ( %POSTYPEENCODE.exists(%params{'end_pos_type'})) {
        %params{'end_pos_type'} = %POSTYPEENCODE{%params{'end_pos_type'}};
    }
    
    
    my $x = self.bless(*,|%params);

    return $x;
}


method to_string() {
    my %data;
    for self.^attributes -> $x {
        %data{$x.name} = $x.get_value(self);
    }
    
    for qw<$!start $!end> -> $pos  {
        my $pos_str = %data{$pos} || '';
        if ($pos eq 'end' && %data{'$!start'} == %data{'$!end'}) {
            $pos_str = '';
        }
        given (%data{"$pos" ~ '_pos_type'}) {
            when ('WITHIN') {
                $pos_str = '(' ~ %data{"$!min_$pos"} ~ '.' ~ %data{"$!max_$pos"} ~ ')';
            }
            when ('BEFORE') {
                $pos_str = '<' ~ $pos_str;
            }
            when ('AFTER') {
                $pos_str = '>' ~ $pos_str;
            }
            when ('UNCERTAIN') {
                $pos_str = '?' ~ $pos_str;
            }
        }
        %data{"$pos" ~  "_string"} = $pos_str;
    }

    my $str = %data{'$!start_string'} ~  (%data{'$!end_string'} ?? 
            %RANGEDECODE{%data{'$!location_type'}} ~ 
            %data{'$!end_string'} !! '');    
    $str = "%data{'$!seq_id'}:$str" if %data{'$!seq_id'} && %data{'$!is_remote'};
    $str = "($str)" if %data{'$!location_type'} eq 'WITHIN';
    if (self.strand == -1) {
        $str = sprintf("complement(%s)",$str)
    }
    return $str;
}


method is_fuzzy() {
    return ( %!IS_FUZZY.exists(self.start_pos_type) ||
         %!IS_FUZZY.exists(self.end_pos_type)) ?? True !! False;
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

method each_Location() {
    return self;
}


    
}
