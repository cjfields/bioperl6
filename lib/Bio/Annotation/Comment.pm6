use v6.c;

use Bio::Role::Annotation;

class Bio::Annotation::Comment does Bio::Role::Annotation {

    # TODO: in common w/ Bio::Annotation::Comment, move to role?
    has Str $.text is rw = '';

    # TODO type attribute found in multiple places, put into role?
    has Str $.type is rw;

    # TODO: This is supposed to return a structured format (YAML/JSON/XML), but
    # maybe we need a simple factory for this?  Seems like all public atts are
    # valid for use here, maybe should be implemented by role

    method hash-tree(){ ... }

    method Str() {
        return "Comment: " ~ $.text;
    }

}
