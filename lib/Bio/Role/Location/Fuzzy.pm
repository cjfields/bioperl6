use v6;
use Bio::Role::Location;

role Bio::Role::Location::Fuzzy does Bio::Role::Location {


our %FUZZYPOINTENCODE = ( 
    '\>(\d+)(.{0})' => 'AFTER',
    '\<(.{0})(\d+)' => 'BEFORE',
    '(\d+)'         => 'EXACT',
    '\?(\d*)'       => 'UNCERTAIN',
    '(\d+)(.{0})\>' => 'AFTER',
    '(.{0})(\d+)\<' => 'BEFORE',
    '(\d+)\.(\d+)'  => 'WITHIN',
    '(\d+)\^(\d+)'  => 'BETWEEN',
   );

our %FUZZYCODES = ( 'EXACT' => '..', # Position is 'exact
   # Exact position is unknown, but is within the range specified, ((1.2)..100)
            'WITHIN' => '.', 
            # 1^2
            'BETWEEN'    => '^',
            'IN-BETWEEN' => '^',
            'UNCERTAIN'  => '?',
            # <100
            'BEFORE'  => '<',
            # >10
            'AFTER'   => '>');   

    
method each_Location() {
    return self;
}

method to_FTstring() {
    my (%vals) = ( 'start' => self.start,
           'min_start' => self.min_start,
           'max_start' => self.max_start,
           'start_code' => self.start_pos_type,
           'end' => self.end,
           'min_end' => self.min_end,
           'max_end' => self.max_end,
           'end_code' => self.end_pos_type );

    my (%strs) = ( 'start' => '',
           'end'   => '');
    my ($delimiter) = %FUZZYCODES{self.location_type};
    $delimiter = %FUZZYCODES{'EXACT'} if (self.location_type eq 'UNCERTAIN');
    
    
    # I'm lazy, lets do this in a loop since behaviour will be the same for 
    # start and end
    for ( qw<start end> ) -> $point {
        if ( (%vals{$point ~ "_code"} ne 'EXACT') &&
            (%vals{$point ~ "_code"} ne 'UNCERTAIN') ) {
            
            # must have max and min defined to use 'WITHIN', 'BETWEEN'
            if ((!defined %vals{"min_$point"} ||
                 !defined %vals{"max_$point"}) && 
                ( %vals{$point ~ "_code"} eq 'WITHIN' || 
                  %vals{$point ~ "_code"} eq 'BETWEEN'))
            {
                %vals{"min_$point"} = '' unless defined %vals{"min_$point"};
                %vals{"max_$point"} = '' unless defined %vals{"max_$point"};
                
    #             $self->warn("Fuzzy codes for start are in a strange state, (".
    #                     join(",", (%vals{"min_$point"}, 
    #                            %vals{"max_$point"},
    #                            %vals{$point."_code"})). ")");
                return '';
            }
            
            if (defined %vals{$point ~ "_code"} && 
               (%vals{$point ~ "_code"} eq 'BEFORE' ||
                %vals{$point ~ "_code"} eq 'AFTER'))
            {
                %strs{$point} ~= %FUZZYCODES{%vals{$point ~ "_code"}};
                %strs{$point} ~= %vals{"$point"};
            }
 
            if ( defined %vals{$point ~ "_code"} && 
              (%vals{$point ~ "_code"} eq 'WITHIN' ||
               %vals{$point ~ "_code"} eq 'BETWEEN'))
            {
                # Expect odd results with anything but WidestCoordPolicy for now
                %strs{$point} ~= ($point eq 'start') ??
                        %vals{"$point"} ~
                        %FUZZYCODES{%vals{$point ~ "_code"}} ~
                        %vals{'max_' ~ $point}
                        !!
                        %vals{'min_' ~ $point} ~
                        %FUZZYCODES{%vals{$point ~ "_code"}} ~
                        %vals{"$point"};
                %strs{$point} = "(" ~ %strs{$point} ~ ")";
            }
            
        } elsif (%vals{$point ~ "_code"} eq 'UNCERTAIN') {
            %strs{$point}  = %FUZZYCODES{%vals{$point ~ "_code"}};
            %strs{$point} ~= %vals{$point} if defined %vals{$point};
        } else {
            %strs{$point} = %vals{$point};
        }
    }
    
    my $str = %strs{'start'} ~ $delimiter ~ %strs{'end'};
    if (self.is_remote() && self.seq_id()) {
        $str = self.seq_id() ~ ":" ~ $str;
    }
    if ( defined self.strand && 
             self.strand == -1 &&
                 self.location_type() ne "UNCERTAIN") {
        $str = "complement(" ~ $str ~ ")";
    } elsif (self.location_type() eq "WITHIN") {
        $str = "(" ~ $str ~ ")";
    }
    
    return $str;    
}


multi method !fuzzypointdecode() {
    return ();
}

multi method !fuzzypointdecode($string) {
    
    # strip off leading and trailing space
    $string = $string.trim();
    
    for (  %FUZZYPOINTENCODE.keys ) -> $pattern {
        if ( $string ~~ /^$pattern$/ ) {
            my ($min,$max) = ($0,$1) unless (($0 eq '') && (!defined $1));
            if ( (%FUZZYPOINTENCODE{$pattern} eq 'EXACT') ||
                 (%FUZZYPOINTENCODE{$pattern} eq 'UNCERTAIN')
              ) {
                $max = $min;
            } else {
                $max = Mu if ((defined $max) && ($max.chars == 0));
                $min = Mu if ((defined $min) && ($min.chars == 0));
            }
            return (%FUZZYPOINTENCODE{$pattern},$min,$max);
        }
    }
    # if ( $self->verbose >= 1 ) {
    #     $self->warn("could not find a valid fuzzy encoding for $string");
    # }
    return ();
}


}
