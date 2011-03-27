use v6;
use Bio::Role::Location;

role Bio::Role::Location::Fuzzy does Bio::Role::Location {
has Int $.minstart is rw;
has Int $.maxstart is rw;

has Int $.minend is rw;
has Int $.maxend is rw;

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



our %strands_switch = ('+' => 1 , '-' => -1);

our %RANGEENCODE  = ('..' => 'EXACT', '.' => 'WITHIN', '?' => 'UNCERTAIN',
             '^'   => 'IN-BETWEEN' );

our %RANGEDECODE  = ('EXACT'      => '..', 'WITHIN' => '.', 'UNCERTAIN'  => '?',
             'IN-BETWEEN' => '^' );

our %POSTYPEENCODE = ('<' => 'BEFORE',
                     '>' => 'AFTER');

our %POSTYPEDECODE = ('BEFORE'  => '<',
                     'AFTER'   => '>');
#########################################

method new(*%params is copy){
    #fuzzy do not have start, they have minstart and/or maxstart
    if ( %params.exists('start')) {
        %params{'minstart'}=%params{'start'};
        %params.delete('start');
    }

    #fuzzy do not have end, they have minend and/or maxend
    if ( %params.exists('end')) {
        %params{'maxend'}=%params{'end'};
        %params.delete('end');
    }
    
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
    if ( %params.exists('minstart') ) {
        my ($encode,$min,$max) = self!fuzzypointdecode(%params{'minstart'});
        $x.start_pos_type = $encode;
        $x.minstart = $min;
        $x.maxstart = $max;
    }

    if ( %params.exists('maxend') ) {
        my ($encode,$min,$max) = self!fuzzypointdecode(%params{'maxend'});
        $x.end_pos_type = $encode;
        $x.minend = $min;
        $x.maxend = $max;
    }    

    return $x;
}

multi method start($value?) {
    if ( defined $value ) {
        my ($encode,$min,$max) = self!fuzzypointdecode($value);
        self.start_pos_type = $encode;
        self.min_start($min);
        self.max_start($max);
    }

    # $self->throw("Use Bio::Location::Simple for IN-BETWEEN locations ["
    #              . $self->SUPER::start. "] and [". $self->SUPER::end. "]")
    # if $self->location_type eq 'IN-BETWEEN'  && defined $self->SUPER::end &&
    #               ($self->SUPER::end - 1 == $self->SUPER::start);

    #if minstart not defined, take maxstart
    return $.minstart ?? $.minstart !! $.maxstart;
}


method end($value?) {
    if ( defined $value ) {
        my ($encode,$min,$max) = self!fuzzypointdecode($value);
        self.end_pos_type =$encode;
        self.min_end($min);
        self.max_end($max);
    }

    # $self->throw("Use Bio::Location::Simple for IN-BETWEEN locations [".
    #              $self->SUPER::start. "] and [". $self->SUPER::end. "]")
    # if $self->location_type eq 'IN-BETWEEN' && defined $self->SUPER::start &&
    #             ($self->SUPER::end - 1 == $self->SUPER::start);

    return $.maxend ?? $.maxend !! $.minend;
}


method min_start($value?){
    if ( defined $value) {
        $.minstart = $value;
    }
    
    return Any if !$.minstart || (self.start_pos_type eq 'BEFORE');
    return $.minstart;
}

method max_start($value?){
    if ( defined $value) {
        $.maxstart = $value;
    }
    return $.maxstart;
}

method max_end($value?) {
    if ( defined $value ) {
        $.maxend = $value;
    }
    return Any if !$.maxend || (self.end_pos_type eq 'AFTER');
    return $.maxend;
}

method min_end($value?) {
    if ( defined $value) {
        $.minend = $value;
    }
    return $.minend;    
}


# submethod BUILD(*%params is copy) {
#     # RAKUDO: These attributes should be auto-initialized but are not
#     $!start = %params.exists('start') ?? %params{'start'} !! 0;
#     $!end = %params.exists('end') ?? %params{'end'} !! 0 ;
#     $.seq_id = %params{'seq_id'};
#     $.is_remote = %params.exists('is_remote') ?? %params{'is_remote'} !! False;
#     $.start_pos_type = %params.exists('start_pos_type') ?? %params{'start_pos_type'} !! 'EXACT';
#     $.end_pos_type = %params.exists('end_pos_type') ?? %params{'end_pos_type'} !! 'EXACT';
#     $.location_type = %params.exists('location_type') ?? %params{'location_type'} !! 'EXACT';

#     $!strand = %params.exists('strand') ?? %params{'strand'} !! 0;
#     $.start_offset = %params.exists('start_offset') ?? %params{'start_offset'} !! 0;
#     $.end_offset = %params.exists('end_offset') ?? %params{'end_offset'} !! 0 ;
    

# #    self.start(%params{'start'});
# #    self.end(%params{'end'});
# }

    

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

multi method !fuzzypointdecode($string is copy) {
    
    # strip off leading and trailing space
    $string = $string.trim();

    #need to flip this around since rx are not just string anymore! they are code blocks
    #will have issue since we have two BEFORE keys..
my %FUZZYPOINTENCODE = ( 

    #  '(.{0})(\d+)\<' => 'BEFORE',
#    'BEFORE' => rx{('')(\d+)\<},
    'BEFORE' => rx{^\<('')(\d+)$},
    'EXACT'=> rx{^(\d+)$},
    'UNCERTAIN' => rx{\?(\d*)},
    'AFTER' => rx{^[(\d+)\>|\>(\d+)]$},
                      #  '\>(\d+)(.{0})' => 'AFTER',
     #'AFTER' => rx{^\>(\d+)$},
    'WITHIN' =>  rx{(\d+)\.(\d+)}  ,                       
    'BETWEEN' => rx{(\d+)\^(\d+)}
   );
    
    
    for (  %FUZZYPOINTENCODE.kv ) -> $type,$pattern {
        if ( $string ~~ $pattern ) {
            my ($min,$max) = ($0,$1) unless (($0 eq '') && (!defined $1));
            if ( ($type eq 'EXACT') ||
                 ($type eq 'UNCERTAIN')
              ) {
                $max = $min;
            } else {
                $max = Any if ((defined $max) && ($max.chars == 0));
                $min = Any if ((defined $min) && ($min.chars == 0));
            }
            return ($type,$min,$max);
        }
    }
    # if ( $self->verbose >= 1 ) {
    #     $self->warn("could not find a valid fuzzy encoding for $string");
    # }
    return ();
}


}
