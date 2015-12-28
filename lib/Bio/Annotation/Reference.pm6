use v6;

use Bio::Annotation::DBLink;
use Bio::Role::Range;

class Bio::Annotation::Reference is Bio::Annotation::DBLink does Bio::Role::Range {

    has Str $.value is rw;
    
    # TODO: should this be an array or a simple string (leaving as Str for now)
    has Str $.authors is rw;
    has Str $.consortium is rw;
    has Str $.location is rw;
    has Str $.title is rw;

    # TODO: some of these could have stricter types
    has Str $.medline is rw;
    has Str $.pubmed is rw;
    has Str $.rp is rw;
    has Str $.rg is rw;
    has Str $.doi is rw;

    # TODO: This is supposed to return a structured format (YAML/JSON/XML), but
    # maybe we need a simple factory for this?  Seems like all public atts are
    # valid for use here, maybe should be implemented by role

    method hash-tree(){ ... }

    method Str() {
        return "Reference: " ~ $.title;
    }

}
