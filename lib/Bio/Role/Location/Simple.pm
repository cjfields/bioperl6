use v6;
use Bio::Role::Location;

role Bio::Role::Location::Simple does Bio::Role::Location {

has %!IS_FUZZY = map {;$_ => 1} , qw<BEFORE AFTER WITHIN UNCERTAIN>;


our %RANGEENCODE  = ('..' => 'EXACT',
             '^'   => 'IN-BETWEEN' );

our %RANGEDECODE  = ('EXACT'      => '..',
             'IN-BETWEEN' => '^' );


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



method each_Location($order?) {
    return self;
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


    
}
