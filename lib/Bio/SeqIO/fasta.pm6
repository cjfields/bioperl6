use v6;

use Bio::Role::SeqStream;

role Bio::SeqIO::fasta does Bio::Role::SeqStream;

has $!buffer;

method chunkify {
    # null condition to stop iterator
    return if self.fh.eof;
    my $current_record;
    while self.fh.get -> $line {
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
    self.chunkify();
}

method write-Seq {

}
