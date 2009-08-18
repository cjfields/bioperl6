#these two role are here till a rakudo bug is fixed
role Bio::Role::Describe{

# these are the primary data available that are similar to the BioPerl
# Bio::DescribableI interface.

has Str $.display_name       is rw;
has Str $.desc               is rw;

multi method description() {
  return $.desc;
}

multi method description(Str $desc){
  $.desc =$desc;
}

}


role Bio::Role::Identify{

# these are the primary data available that are similar to the BioPerl
# Bio::IdentifiableI interface. I've included the primary accession
# (accession_number) in this implementation.

has Str $.display_id                is rw;
has Str $.primary_id                is rw;
has Str $.object_id                 is rw;
has Int $.version                   is rw;
has Str $.authority                 is rw;
has Str $.namespace                 is rw;
has Str $.accession_number          is rw;
has Str $.lsid_string		    is rw;
has Str $.namespace_string	    is rw;

method lsid_string {
	return $.authority ~ ':' ~ $.namespace ~ ':' ~ self.object_id;
}
	

method namespace_string {
	return $.namespace ~ ':' ~ self.object_id ~ '.' ~ $.version;
}

}


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
