role Bio::Role::AnnotationCollection {
    # rakudo doesn't handle typed arrays yet for return values, this can be done in the

    our method get_all_Annotation_keys returns Array of Str  {...}

    our method get_Annotations returns Array of Bio::Role::Annotation  (:@tagname? of Str) {...}

    our method get_nested_Annotations returns Array of Bio::Role::Annotation  (:@tagname? of Str) {...}

    our method get_all_Annotations returns Array of Bio::Role::Annotation  (:@tagname? of Str) {...}

    our method get_num_Annotations returns Array  (Str :$tagname?) {...}

    our method add_Annotation returns Bool  (Str :$tagname?, Bio::Role::Annotation *@annotations) {...}

    our method remove_Annotations returns Bio::Role::Annotation  (:@tagname of Str) {...}

    our method flatten_Annotations returns Array of Bio::Role::Annotation  (:@tagname of Str) {...}
}
