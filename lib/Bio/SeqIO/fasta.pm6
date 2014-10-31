use v6;

use Bio::Role::SeqStream;
use Bio::Grammar::Fasta;

class Bio::Grammar::Fasta::Actions {

    method record($/) {
        make $<sequence>
    }
}

role Bio::SeqIO::fasta does Bio::Role::SeqStream {
    has $!buffer;
    
    has $!actions = Bio::Grammar::Fasta::Actions.new();
    
    # TODO: this is a temporary iterator to return one sequence record at a
    # time; two future optimizations require implementation in Rakudo:
    # 1) Chunking in IO::Handle using nl => "\n>"
    # 2) Grammar parsing of a stream of data (e.g. Cat), which is now considered
    # a close post-6.0 update
    method !chunkify {
        return if $.eof();
        my $current_record;
        while $.get() -> $line {
            if $!buffer {
                $current_record = $!buffer;
                $!buffer = Nil;
            }
            if $line ~~ /^^\>/ {
                if $current_record.defined {
                    $!buffer = "$line\n";
                    last;
                } else {
                    $current_record = "$line\n";
                }
            } else {
                $current_record ~= $line;
            }
        }
        return $current_record;
    };
    
    
    method next-Seq {
        my $chunk = self!chunkify;
        return if !?$chunk.defined;
        my $t = Bio::Grammar::Fasta.subparse($chunk, actions => $!actions, rule => 'record');
        return $t;
    }
    
    method write-Seq { ... }

}