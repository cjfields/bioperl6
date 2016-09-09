use v6;

use Bio::Role::SeqStream;
use Bio::Role::IO;
use Bio::Grammar::Fasta;
use Bio::PrimarySeq;

class Bio::Grammar::Fasta::Actions::PrimarySeq {
    method record($/) {
        make Bio::PrimarySeq.new(
            seq             => ~$<sequence>,
            description     => ~$<description_line><description>,
            display_id      => ~$<description_line><id>
        );
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
    
    # TODO: this is a temporary iterator to return one sequence record at a
    # time; one key future optimization requires implementation in Rakudo:
    # 1) Grammar parsing of a stream of data (e.g. Cat), which is now considered
    #    a post-6.0 update
    
    method next-Seq {
        return if $.fh.eof();
        while $.fh.get -> $chunk {
            if $chunk !~~ /^^\>/ {
                return Bio::Grammar::Fasta.subparse( ">$chunk", actions => $!actions, rule => 'record').ast;
            } else {
                return Bio::Grammar::Fasta.subparse( "$chunk", actions => $!actions, rule => 'record').ast;
            }
        }
    }
    
    method write-Seq(Bio::PrimarySeq $seq) {
        self.fh.say(sprintf(">%s %s", $seq.display_id, $seq.description));
        self.fh.say($seq.seq.subst( /(.** {$.width})/, { "$0\n" }, :g));
    }
}