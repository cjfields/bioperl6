use v6;

grammar Bio::Grammar::GenBank {
    token TOP            { <Record>+ }
    token Record         { <Annotations>+ .*? <end_record>  };
    rule Annotations    { <AnnotationType> <AnnotationData>  }
    token AnnotationType {
        [
        | LOCUS
        | DEFINITION
        | ACCESSION
        | VERSION
        | DBSOURCE
        | KEYWORDS
        | SOURCE
        | ORGANISM
        | REFERENCE
        | AUTHORS
        | TITLE
        | JOURNAL
        | FEATURES
        ]
        }
    token AnnotationData { <!before AnnotationType> .*?}
    token end_record  { ^^ \/\/ $$ }
};

