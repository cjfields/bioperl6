use v6;

grammar Bio::Grammar::Fasta {
    token TOP  {
        <description_line> <sequence> 
    }
    token description_line    {
        ^\> <id> <.ws> <description> \n
    }
    token id           {
        | <identifier>      {*} 
        | <generic_id>      {*}
    }
    token identifier   {
        
    }    
    token generic_id {
        \S+      {*}
    }
    token description  {
        \N+      {*}
    }
    token sequence     {
        <-[>]>+  {*}
    }
}

