=begin Synopsis

General grammar for FASTQ format. This can be attached to any action (e.g. parse
and index a FASTA file, create a new Bio::PrimarySeq, etc).  

=end Synopsis

use v6;

grammar Bio::Grammar::Fastq {
    token TOP  {
        ^<record>*
    }
    token record {
        <description_line> <sequence> <quality_separator> <quality_string>
    }
    # TODO: the description is optional
    token description_line    {
        ^^\@ <id> <.ws> <description> \n
    }
    token id           {
        | <identifier>     
        | <generic_id>    
    }
    token identifier   {
        \S+ 
    }    
    token generic_id {
        \S+
    }    
    token description  {
        \N+     
    }
    token sequence     {
        <-[+]>+
    }
    # TODO: header line can be repeated here
    token quality_separator {
        <[+]>
    }
    token quality_string {
        <[!"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~]>+
    }
    
}
