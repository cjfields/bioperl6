role Bio::Describe;

has $.display_id                is rw;
has $.description               is rw;

=begin display_id

 Title   : display_id
 Usage   : $id_string = $obj.display_id;
 Function: Returns the display id, also known as the common name of the Sequence
           object.

           The semantics of this is that it is the most likely string to be used
           as an identifier of the sequence, and likely to have "human"
           readability. The id is equivalent to the ID field of the GenBank/EMBL
           databanks and the id field of the Swissprot/sptrembl database. In
           fasta format, the >(\S+) is presumed to be the id, though some people
           overload the id to embed other information. Bioperl does not use any
           embedded information in the ID field, and people are encouraged to
           use other mechanisms (accession field for example, or extending the
           sequence object) to solve this.

           Notice that $seq.id() maps to this function, mainly for
 Returns : A string
 Args    : None
 Status  : Virtual

=end display_id

=begin description

 Title   : description
 Usage   : $string    = $obj.description()
 Function: A text string suitable for displaying to the user a 
           description. This string is likely to have spaces, but
           should not have any newlines or formatting - just plain
           text. The string should not be greater than 255 characters
           and clients can feel justified at truncating strings at 255
           characters for the purposes of display
 Returns : A scalar
 Status  : Virtual

=end description