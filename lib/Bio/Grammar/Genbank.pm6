use v6;

#use Grammar::Tracer;

grammar Bio::Grammar::Genbank {
    token  TOP            { ^<record>+$ }
    
    token  record {
        <annotation>+ 
        <feature-block>?
    }
    
    token  annotation {
        ^^
        <annotation-col>
        <?{ $<annotation-col>.chars == 12 }> # must match exactly 12 chars, could be flexible?
        <annotation-data>
        [\n]
    }
    
    token  annotation-col {
        \s**0..2 <annotation-type>? <.ws> 
    }
    
    token  annotation-type { <[A..Z]>+ }
    
    #token  annotation-type {
    #    [
    #        || <primary-annotation>
    #        || <secondary-annotation>
    #    ]
    #}
    #
    ## These could be made stricter (e.g. actual terms)
    #token  primary-annotation { <[A..Z]>+ }
    #
    ## These could be made stricter (e.g. actual terms)
    #token  secondary-annotation { \s**2 <[A..Z]>+ }
    
    token  annotation-data {
        \S\N+             # everything not a newline after initial annotation
        [                 # possibly followed by...
         <!annotation>    # additional text not possibly matched as annotation
         \s**12           
         \N+
        ]*
    }
    
    token feature-block { ^^ 
        FEATURES \N+ \n
        <feature>+
    }
    
    token feature { ^^
        \s**5..*
        <ft-primary-tag>
        <.ws>
        <ft-location-string>
        <ft-tag>+
    }
    
    token ft-primary-tag {
        \S+
    }
    
    token ft-location-string {
        .*? <?ft-tag>
    }
    
    token ft-tag {
        \/<ft-tag-key> '=' <ft-tag-value>
    }
    
    token ft-tag-key { <-[=]>+ }
    
    token ft-tag-value { \S\N+
                        #[
                        #<-[/]>
                        # \N+
                        #]*
                         }
    ##token sequence { .*? }
    #
    token  delimiter     { ^^ <[/]>**2 $$ }
};
