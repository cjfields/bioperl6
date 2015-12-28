use v6;

role Bio::Role::Annotation {
    # this creates a set of attributes based on role params

    has Str $.tag-name is rw;
    has Str $.tag-term is rw;

    # TODO: This is supposed to return a structured format (YAML/JSON/XML), but
    # maybe we need a factory for this?
    method hash-tree() { ... }

    method Str() { ... }

}
