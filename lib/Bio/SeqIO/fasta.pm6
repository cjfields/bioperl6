use v6;

use Bio::Role::SeqStream;
use Bio::Role::IO;
use Bio::Grammar::Fasta;
use Bio::PrimarySeq;

class Bio::Grammar::Fasta::Actions::PrimarySeq {
    method record($/)               {
        $/.make(
            Bio::PrimarySeq.new(
            seq             => $<sequence>.made,
            description     => $<description_line><description>.made // '',
            display_id      => $<description_line><identifier>.made
            )
        );
    }
    
    method sequence($/)             {
        $/.make(~$/.subst("\n", '', :g))
    }
}

class Bio::SeqIO::fasta does Bio::Role::SeqStream does Bio::Role::IO {
    has $.buffer  is rw;
    has $!actions = Bio::Grammar::Fasta::Actions::PrimarySeq.new();
    has $.width = 60;
    has $.block = $!width;  # NYI
    
    multi method initialize-io(:$!width?, :$fh?, :$file?, *%args) {
        # we reset the input record sep here
        callwith(:nl-in("\n>"), :$fh, :$file, |%args);
    }
    
    # TODO: one key future optimization requires implementation in Rakudo:
    # 1) Grammar parsing of a stream of data (e.g. Cat), which is now considered
    #    a post-6.0 update
    
    # 2) Make next-Seq() a multi, which allows it to take arguments for various iterators
    #method next-Seq() {
    #    return if $.fh.eof();
    #    while $.fh.get -> $chunk {
    #        #my ($header, $seq) = $chunk.split("\n", 2);
    #        #$header.=subst(/^^\>/, '');
    #        #my ($display_id, $desc) = $header.split(' ', 2);
    #        #$seq.=subst("\n", '', :g);
    #        #return Bio::PrimarySeq.new(
    #        #    seq             => $seq,
    #        #    description     => $desc || '',
    #        #    display_id      => $display_id
    #        #);
    #        if $chunk !~~ /^^\>/ {
    #            return Bio::Grammar::Fasta.parse( ">$chunk", actions => $!actions, rule => 'record').ast;
    #        } else {
    #            return Bio::Grammar::Fasta.parse( "$chunk", actions => $!actions, rule => 'record').ast;
    #        }
    #    }
    #}
    
    method next-Seq() {
        return if $.fh.eof();
        while $.fh.get -> $chunk {
            my ($header, $seq) = $chunk.split("\n", 2);
            $header.=subst(/^^\>/, '');
            my ($display_id, $desc) = $header.split(' ', 2);
            $seq.=subst("\n", '', :g);
            return Bio::PrimarySeq.new(
                seq             => $seq,
                description     => $desc || '',
                display_id      => $display_id
            );
            #if $chunk !~~ /^^\>/ {
            #    return Bio::Grammar::Fasta.parse( ">$chunk", actions => $!actions, rule => 'record').ast;
            #} else {
            #    return Bio::Grammar::Fasta.parse( "$chunk", actions => $!actions, rule => 'record').ast;
            #}
        }
    }
    
    method write-Seq(Bio::PrimarySeq $seq) {
        self.fh.say(sprintf(">%s %s", $seq.display_id, $seq.description));
        self.fh.say($seq.seq.subst( /(.** {$.width})/, { "$0\n" }, :g));
    }
}