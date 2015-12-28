use v6;

use Bio::Role::Annotation;

class Bio::Annotation::SimpleValue does Bio::Role::Annotation {

    has $.value is rw;

    # TODO: This is supposed to return a structured format (YAML/JSON/XML), but
    # maybe we need a factory for this?
    method hash-tree(){
         return ('value' => self.value);
    }

    method Str() {
        return "Value: " ~ self.value;
    }

}
