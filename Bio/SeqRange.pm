role Rangable;

has Int $.start is rw;
has Int $.end is rw;    
has Int $.strand is rw;

method length {
    return $self.start - $self.end
}

#method overlaps {...}
#method contains {...}
#method equals {...}
#method intersection {...}
#method union {...}
