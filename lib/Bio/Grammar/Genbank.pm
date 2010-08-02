use v6;

grammar Bio::Grammar::GenBank {
    rule  TOP            { ^[<Record>+]$ }
    
    rule  Record         { [<Annotation>+] <End_Record> }
    
    rule Annotation      { <AnnotationType> <AnnotationData>+  }
    
    token AnnotationType { <[A..Z]>+ }
        
    token AnnotationData { \s* \N+ }
    
    token End_Record     { ^^ \/\/ $$ }
};

