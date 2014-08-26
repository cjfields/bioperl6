use v6;

use Bio::Role::Annotatable;

class Bio::Annotation::SimpleValue does Bio::Role::Annotatable;

has $.tagname is rw;
has $.value is rw;
has $.tag_term is rw;

method as_text() {
    return "Value: " ~ self.value;
}

my $DEFAULT_CB = sub ($self) { $self.value() };

method display_text($cb? is copy) {
    $cb ||= $DEFAULT_CB;
    return $cb.(self);
}

method hash_tree(){
     return ('value' => self.value);
}

