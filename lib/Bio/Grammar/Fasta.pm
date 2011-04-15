grammar Bio::Grammar::Fasta {
     token TOP  {
        ^<fasta>
        
    }
    token fasta {
        <description_line> <sequence> 
    }
    
    token description_line    {
        ^^\> <id> <.ws> <description> \n
    }
    token id           {
        | <identifier>     
        | <generic_id>    
    }
    token identifier   {
        #assume we going to parse NCIB specific id for reference number and gi numbers
        \S+ 
    }    
    token generic_id {
        \S+
    }    
    
    token description  {
        \N+      
    }
    token sequence     {
        <-[>]>+  
    }
}
