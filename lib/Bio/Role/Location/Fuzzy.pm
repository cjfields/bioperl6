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

    
method each_Location() {
    return self;
}

method to_FTstring() {
    return 'NYI';
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
                $max = Mu if((defined $max) && ($max.chars == 0));
                $min = Mu if((defined $min) && ($min.chars == 0));
            }
            return (%FUZZYPOINTENCODE{$pattern},$min,$max);
        }
    }
    # if( $self->verbose >= 1 ) {
    #     $self->warn("could not find a valid fuzzy encoding for $string");
    # }
    return ();
}


}
