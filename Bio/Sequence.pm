role BioRange {
    has Int $.start is rw;
    has Int $.end is rw;
    has Int $.strand is rw;
    
    method length {
        return self.end - self.start + 1
    }
    method overlaps (Coordinate @c) {...}
    method contains (Coordinate @c) {...}
    method equals (Coordinate @c) {...}
    method intersection (Coordinate @c) {...}
    method union (Coordinate @c) {...}
}

class BioPrimarySeq {
    has $.seq is rw;
    has $.alphabet is rw;
    method validate_seq {...}
    
    
}

#class BioSeq { #does Annotate does SeqRange does Describe does Identify does HoldFeatures;
#    has BioPrimarySeq $.primaryseq is rw;
#    
#}

