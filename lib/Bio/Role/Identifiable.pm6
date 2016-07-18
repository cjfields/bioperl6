use v6;

role Bio::Role::Identifiable {

    # these are the primary data available that are similar to the BioPerl
    # Bio::IdentifiableI interface. I've included the primary accession
    # (accession) in this implementation, though it may be replaced at some point

    # Do we need other IDs here? Or should we use a simple key-value store with
    # custom ID types allowed?

    has Str $.display-id                is rw;
    has Str $.primary-id                is rw;
    has Int $.version                   is rw;
    has Str $.authority                 is rw;
    has Str $.namespace                 is rw;
    has Str $.accession                 is rw;

    method object-id() {
        self.accession || ~self
    }

    # these latter two methods may be obsoleted
    method lsid-string() returns Str {
      return join(':',  ~self.authority,
                        ~self.namespace,
                        ~self.accession || ~self.id || '');
    }

    method namespace-string() returns Str {
      return join(':', ~self.namespace,
                  (~self.accession || ~self.id || '') ~ (~(defined(self.version()) ?? "." ~ self.version !! '')));
    }

}

=begin display-id

 Title   : display-id
 Usage   : $string    = $obj.display-id()
 Function: 
 Returns : A scalar Str
 Status  : Virtual

=end display-id

=begin object-id

 Title   : object-id
 Usage   : $string    = $obj.object-id()
 Function: a string which represents the stable primary identifier
           in this namespace of this object. For DNA sequences this
           is its accession, similarly for protein sequences
 Returns : A scalar
 Status  : Virtual

=end object-id
