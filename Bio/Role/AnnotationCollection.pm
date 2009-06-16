role Bio::Role::AnnotationCollection;

our Array of Str method get_all_Annotation_keys {...}
our Array of Bio::Role::Annotation method get_Annotations (:@tagname? of Str) {...}
our Array of Bio::Role::Annotation method get_nested_Annotations (:@tagname? of Str) {...}
our Array of Bio::Role::Annotation method get_all_Annotations (:@tagname? of Str) {...}
our Array method get_num_Annotations (Str :$tagname?) {...}
our Bool method add_Annotation (Str :$tagname?, Bio::Role::Annotation *@annotations) {...}
our Bio::Role::Annotation method remove_Annotations (:@tagname of Str) {...}
our Array of Bio::Role::Annotation method flatten_Annotations (:@tagname of Str) {...}
