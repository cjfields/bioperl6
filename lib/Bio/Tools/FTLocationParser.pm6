use v6;

# Perl6 has a decen balanced bracket grammar in Rosetta Code, strating here though
grammar BalancedBrackets {

    # probably need some look-aheads 
    token TOP {
        ^ '('? <simple-location> ')'? $
    }
    
    token simple-location {
        <remote-location>? <start-location> <range-type>? <end-location>?
    }
    
    token remote-location { <seqid> ':' }
    
    token seqid { <-[:]>+ }
    
    token start-location { <fuzzy>? <position> }
    
    token end-location { <position> <fuzzy>? }
    
    token fuzzy { <[ <>? ]> }
    
    token range-type { '..' | '^' }

    token position { '('? <coord> ('.' <coord>)? ')'? }
    
    token coord { \d+ }
}

class Bio::Tools::FTLocationParser {
    
}

