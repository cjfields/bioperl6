role Bio::Role::Identify;

# these are the primary data available that are similar to the BioPerl
# Bio::IdentifiableI interface. I've included the primary accession
# (accession_number) in this implementation.

has Str $.display_id                is rw;
has Str $.primary_id                is rw;
has Str $.object_id                 is rw = self.accession_number;
has Int $.version                   is rw; 
has Str $.authority                 is rw;
has Str $.namespace                 is rw;
has Str $.accession_number          is rw;

our method lsid_string returns Str {
  return self.authority ~ ":" ~ self.namespace ~ ":" ~ self.object_id;
}

our method namespace_string returns Str {
  return self.namespace ~ ":" ~ self.object_id ~ (defined(self.version()) ?? "." ~ self.version !! '');
}