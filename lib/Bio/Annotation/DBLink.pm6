use v6.c;

use Bio::Role::Annotation;
use Bio::Role::Identifiable;

class Bio::Annotation::DBLink does Bio::Role::Annotation
                              does Bio::Role::Identifiable  {

    has Str $.database is rw;

    # TODO: maybe move to Identifiable role?  Having one optional ID seems
    # limiting, and this is probably better defined in that role
    has Str $.optional-id is rw;

    # TODO: in common w/ Bio::Annotation::Comment, move to role?
    has Str $.comment is rw;

    # TODO: seeing type popping up more
    has Str $.type is rw;
    has Str $.url is rw;

    # TODO: This is supposed to return a structured format (YAML/JSON/XML), but
    # maybe we need a simple factory for this?  Seems like all public atts are
    # valid for use here, maybe should be implemented by role

    method hash-tree(){ ... }

    method Str() {
        return "Direct database link to "  ~ $.primary-id
                ~ ($.version ?? "." ~ $.version !! "" )
                ~ ($.optional-id ?? " (" ~ $.optional-id ~ ")" !! "" )
                ~ " in database " ~ $.database;
    }

}
