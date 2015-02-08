=begin Synopsis

General grammar for GFF v3 format; for older formats we will subclass this

=end Synopsis

use v6;

#use Grammar::Tracer;

grammar Bio::Grammar::GFF {
    
    rule TOP  {
        [
         <gff-line>
        ]+
        <fasta>?
    }
    
    rule gff-line {
        ^^
        [
        | <feature-line>
        | <directive-line>
        | <comment>
        ]
        $$
    }

    token comment {
        '#'<-[#]> <-[\n]>+
    }

    token directive-line {
        '##'
        <directive-name>
        <directive-data>?
    }

    token resolution-line {
        '###'
    }

    # TODO: break out into handling specific directives
    token directive-name {
        \S+
    }

    token directive-data    {
        <-[\n]>+
    }
    
    token feature-line {
        ^^
        <reference> \t
        <source> \t
        <type> \t
        <start> \t
        <end> \t
        <score> \t
        <strand> \t
        <phase> \t
        <attributes>
        $$
    }
    
    token reference {
        <-[\t]>+
    }
    
    token source {
        <-[\t]>+
    }
    
    token type {
        <-[\t]>+
    }
    
    token start {
        \d+
    }
    
    token end {
        \d+
    }
    
    token score {
        <-[\t]>+
    }

    # TODO: optimize this?
    token strand {
        < -1  0  1 - + . >
    }
    
    token phase {
        <[012\.]>
    }
    
    # TODO: expand into canonical vs custom, URI-encoding, etc.?
    token attributes {
        <tag-value>+ % ';'
    }
    
    token tag-value {
        <tag> '=' <value>+ % ','
    }
    
    token tag {
        <-[\s;=&,]>+
    }

    token value {
        <-[\n;=&,]>+
    }
    
    # not sure if there is a way to use a Grammar within another grammar (yet)
    token fasta {
        <record>+
    }
    
    token record {
        <description_line> <sequence> 
    }
    
    token description_line    {
        ^^\> <seq-id> [<.ws> <seq-description>]? $$
    }
    token seq-id {
        | <seq-identifier>
        | <seq-generic-id>
    }
    
    token seq-identifier   {
        \S+ 
    }    
    token seq-generic-id {
        \S+
    }    
    
    token seq-description  {
        \N+
    }
    token sequence     {
        <-[>]>+  
    }
    
}