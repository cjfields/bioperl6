use v6;

# Using a variation on the old NCBI FT BNF, but perl6-ized

#use Grammar::Tracer;

grammar Bio::Grammar::Location {
    token TOP { <location> }
    
    #location ::= <absolute_location> | <feature_name> |  <functional_operator>(<location_list>)
    token location {
        <absolute_location> | <complex_location>
         }
    
    #absolute_location ::= <local_location> | <path> : <local_location>
    token absolute_location { <local_location> | <remote_location> }
    
    token complex_location { <functional_operator>'('<location_list>')' }
    
    token remote_location { <path> ':' <local_location> }
    
    #path ::= <database> :: <primary_accession> | <primary_accession>
    token path { <primary_accession> | <database_accession>  }

    token database_accession { <database> '::' <primary_accession> }

    ##feature_name ::= <path>:<feature_label> | <feature_label>
    #token feature_name { <path>':'<feature_label> | <feature_label> }
    #
    ##feature_label :== <symbol>
    #token feature_label { <symbol>+ }
    
    #local_location ::= <base_position> | <between_position> | <base_range> 
    token local_location { <base_position> | <base_range> | <between_position> }
    
    #location_list ::= <location> | <location_list>,<location>
    token location_list { <location> [','<location_list> ]* }
    
    #functional_operator ::= <symbol>
    token functional_operator { 'join' | 'order' | 'complement' | 'gap' }
    
    #base_position ::= <integer> | <low_base_bound> | <high_base_bound> |  <two_base_bound> 
    token base_position { <abs_base_position> | <low_base_bound> | <high_base_bound> |  <uncertain_bound> | <two_base_bound> }
    
    # my addition :)
    token abs_base_position { \d+ }
    
    # low_base_bound ::= > <integer>
    token low_base_bound { '>' <abs_base_position> }
    
    token high_base_bound { '<' <abs_base_position> }
    
    # Added, for swissprot seqs
    token uncertain_bound { '?' <abs_base_position>? }
    
    # two_base_bound ::= <base_position>.<base_position>
    token two_base_bound { '('? <abs_base_position>'.'<abs_base_position> ')'? }
    
    # between_position ::= <base_position>^<base_position>
    token between_position { <abs_base_position>'^'<abs_base_position> }
    
    # base_range ::= <base_position>..<base_position>
    token base_range { <base_position>'..'<base_position> }
    
    # database  ::= <symbol>
    token database { <.symbol>+ }
    
    # primary_accession ::= <symbol>
    token primary_accession { <.symbol>+ }
    
    # <up_case_letter> | <low_case_letter> |<digit> | _ | - | ' | *
    token symbol { <.+alpha+digit+[_\-.'*]> }
}


class Bio::Tools::FTLocationParser {
    
}

