=begin Synopsis

General grammar for FASTA format. This can be attached to any action (e.g. parse
and index a FASTA file, create a new Bio::PrimarySeq, etc).  Original grammar from
Philip Mabon (takadonet)

=end Synopsis

use v6;

grammar Bio::Grammar::Fasta {
    token TOP  {
        ^<record>*
    }
    token record {
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
        #assume we going to parse NCBI specific id for reference number and gi numbers
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
