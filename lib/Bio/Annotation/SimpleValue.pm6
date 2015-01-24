use v6;

use Bio::Role::Annotatable;

class Bio::Annotation::SimpleValue does Bio::Role::Annotatable;

has $.tag-name is rw;
has $.value is rw;
has $.tag-term is rw;

method hash-tree(){
     return ('value' => self.value);
}

method Str() {
    return "Value: " ~ self.value;    
}