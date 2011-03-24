use v6;
use Bio::Role::Location;

role Bio::Role::Location::Simple does Bio::Role::Location {
has Int $.start is rw = 0;
has Int $.end is rw = 0;

#no spec on if we are keeping this or not. Bioperl-live does not have these however biome does
#this is for 'fuzzy' locations like WITHIN, BEFORE, AFTER
has Int $.start_offset is rw = 0;
has Int $.end_offset is rw = 0;

    
has %!IS_FUZZY = map {;$_ => 1} , qw<BEFORE AFTER WITHIN UNCERTAIN>;



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


method to_FTstring() {
    my $str;
    if ( self.start == self.end ) {
        $str =  self.start;
    } else {
        $str = self.start ~ %RANGEDECODE{self.location_type} ~ self.end;
    }
    if (self.is_remote() && self.seq_id()) {
        $str = self.seq_id() ~ ':' ~ $str;
    }
    if ( defined self.strand &&
             self.strand == -1 ) {
        $str = 'complement(' ~ $str ~ ')';
    }
    return $str;    
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


    
}
