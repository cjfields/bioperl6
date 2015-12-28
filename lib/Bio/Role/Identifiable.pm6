use v6;

role Bio::Role::Identifiable {

    # these are the primary data available that are similar to the BioPerl
    # Bio::IdentifiableI interface. I've included the primary accession
    # (accession) in this implementation, though it may be replaced at some point

    # Do we need other IDs here? Or should we use a simple key-value store with
    # custom ID types allowed?
    has Str $.id                        is rw;
    has Str $.primary-id                is rw;
    has Int $.version                   is rw;
    has Str $.authority                 is rw;
    has Str $.namespace                 is rw;
    has Str $.accession                 is rw;

    # 'display_id' is an alias of 'id'
    method display-id($id?) {
        $.id = $id if $id;
        $.id
    }

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

=begin object_id

 Title   : object_id
 Usage   : $string    = $obj.object_id()
 Function: a string which represents the stable primary identifier
           in this namespace of this object. For DNA sequences this
           is its accession, similarly for protein sequences
 Returns : A scalar
 Status  : Virtual

=end object_id
