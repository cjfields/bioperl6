

subset SeqStrandInt of Int where { -1 <= $_ <= 1 };

subset SeqStrandChar of Str where { $_ ~~ any(<. + ->) };

# TODO: junctions in 
#subset SeqStrand of SeqStrandInt | SeqStrandChar;
subset SeqStrand of Any where {$_ ~~ any(SeqStrandInt, SeqStrandChar)} ;

subset SeqAlphabet of Str where { $_.lc ~~ any(<dna rna protein>) };

