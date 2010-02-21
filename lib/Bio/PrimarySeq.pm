use Bio::Role::Describe;
use Bio::Role::Identify;
class Bio::PrimarySeq does Bio::Role::Describe does Bio::Role::Identify {

has Str $.seq is rw;
has Str $.alphabet is rw;
has Bool $.is_circular is rw;

method object_id {
	return $.accession_number;
}

multi method display_name() {
  return $.display_id;
}

multi method display_name(Str $id){
  $.display_name =$id;
}

}
