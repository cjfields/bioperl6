use v6;

class Bio::Grammar::Actions::SeqDumper {
    method TOP($/) { }
    method Record($/) { }
    method Annotation($/) {
        say $/<AnnotationData>
    }
    #method AnnotationData($/) { say "Annotation Data:" ~ $/  }
};
