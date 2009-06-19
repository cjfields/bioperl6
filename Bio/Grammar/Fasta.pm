use v6;

grammar Bio::Grammar::Fasta {
    token TOP  {
        <description_line> <sequence> 
    }
    token description_line    {
        \> <id> <description> 
    }
    token id           {
        \S+      {*}
    }
    token description  {
        \N+      {*}
    }
    token sequence     {
        <-[>]>+  {*}
    }
}

