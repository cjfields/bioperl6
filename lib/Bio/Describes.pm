role Bio::PrimarySeqI;

# for alphabet, maybe switch to enum or a symbol class?
#our subset Bio::Alphabet of Str where { $_ eq 'dna' | 'rna' | 'protein' };

has $.seq                       is rw;
has $.display_id                is rw;
has $.description               is rw;
has $.accession_number          is rw;
has $.primary_id                is rw;
has $.display_id                is rw;
has Str $.alphabet              is rw = 'dna';
has Bool $.is_circular          is rw = Bool::False;

=begin Functions

=head1 Implementation Specific Functions

These functions are the ones that a specific implementation must
define.

=end Functions

=begin seq

 Title   : seq
 Usage   : $string = $obj.seq
 Function: Returns the sequence as a string of letters. The
           case of the letters is left up to the implementer.
           Suggested cases are upper case for proteins and lower case for
           DNA sequence (IUPAC standard), but implementations are suggested to
           keep an open mind about case (some users want mixed case!)
 Returns : A scalar
 Status  : Virtual

=end seq

=begin subseq

 Title   : subseq
 Usage   : $substring = $obj.subseq(10,40);
 Function: Returns the subseq from start to end, where the first base
           is 1 and the number is inclusive, i.e. 1-2 are the first two
           bases of the sequence.
           Start cannot be larger than end but can be equal.
 Returns : A string
 Args    : start    : sequence start
           end      : sequence end
           relative : boolean flag indicating the positions are relative to sequence start/end
           no_gaps  : if sequence has gap characters, removes them
 Status  : Virtual

=end subseq

method subseq{ ... }

=begin display_id

 Title   : display_id
 Usage   : $id_string = $obj.display_id;
 Function: Returns the display id, also known as the common name of the Sequence
           object.

           The semantics of this is that it is the most likely string
           to be used as an identifier of the sequence, and likely to
           have "human" readability.  The id is equivalent to the ID
           field of the GenBank/EMBL databanks and the id field of the
           Swissprot/sptrembl database. In fasta format, the >(\S+) is
           presumed to be the id, though some people overload the id
           to embed other information. Bioperl does not use any
           embedded information in the ID field, and people are
           encouraged to use other mechanisms (accession field for
           example, or extending the sequence object) to solve this.

           Notice that $seq.id() maps to this function, mainly for
           legacy/convenience reasons.
 Returns : A string
 Args    : None
 Status  : Virtual

=end display_id

=begin accession_number

 Title   : accession_number
 Usage   : $unique_biological_key = $obj.accession_number;
 Function: Returns the unique biological id for a sequence, commonly
           called the accession_number. For sequences from established
           databases, the implementors should try to use the correct
           accession number. Notice that primary_id() provides the
           unique id for the implemetation, allowing multiple objects
           to have the same accession number in a particular implementation.

           For sequences with no accession number, this method should return
           "unknown".
 Returns : A string
 Args    : None
 Status  : Virtual

=end accession_number

=begin primary_id

 Title   : primary_id
 Usage   : $unique_implementation_key = $obj.primary_id;
 Function: Returns the unique id for this object in this
           implementation. This allows implementations to manage their
           own object ids in a way the implementaiton can control
           clients can expect one id to map to one object.

           For sequences with no accession number, this method should
           return a stringified memory location.

 Returns : A string
 Args    : None
 Status  : Virtual

=end primary_id

=begin alphabet

 Title   : alphabet
 Usage   : if( $obj.alphabet eq 'dna' ) { /Do Something/ }
 Function: Returns the type of sequence being one of
           'dna', 'rna' or 'protein'. This is case sensitive.

 Returns : A string, either 'dna','rna','protein'. NB - the object must
           make a call of the alphabet, if there is no alphabet specified it
           has to guess.
 Args    : None
 Status  : Virtual

=end alphabet

=begin Optional

=head1 Optional Implementation Functions

The following functions rely on the above functions. An implementing class does
not need to provide these functions, as they will be provided by this class, but
is free to override these functions.  Care must be taken

The revcom(), trunc(), and translate() methods create new sequence objects. They
will call new() on the class of the sequence object instance passed as argument,
unless can_call_new() returns FALSE. In the latter case a Bio::PrimarySeq object
will be created. Implementors which really want to control how objects are
created (eg, for object persistence over a database, or objects in a CORBA
framework), they are encouraged to override these methods.

=end Optional

=begin id

 Title   : id
 Usage   : $id = $seq.id()
 Function: ID of the sequence. This should normally be (and actually is in
           the implementation provided here) just a synonym for display_id().
 Returns : A string.
 Args    :

=end id

method id {
    return self.display_id;
}

=begin revcom

 Title   : revcom
 Usage   : $rev = $seq.revcom()
 Function: Produces a new Bio::PrimarySeqI implementing object which
           is the reversed complement of the sequence. For protein
           sequences this throws an exception of "Sequence is a
           protein. Cannot revcom".

           The id is the same id as the original sequence, and the
           accession number is also indentical. If someone wants to
           track that this sequence has be reversed, it needs to
           define its own extensionsj.

           To do an inplace edit of an object you can go:

           $seq = $seq.revcom();

           This of course, causes Perl to handle the garbage
           collection of the old object, but it is roughly speaking as
           efficient as an inplace edit.

 Returns : A new (fresh) Bio::PrimarySeqI object
 Args    : None

=end revcom

method revcom{ ... }

=begin trunc

 Title   : trunc
 Usage   : $subseq = $myseq.trunc(10,100);
 Function: Provides a truncation of a sequence.
 Returns : A fresh Bio::PrimarySeqI implementing object.
 Args    : Two integers denoting first and last base of the sub-sequence.

=end trunc

method trunc{ ... }

=begin translate

 Title   : translate
 Usage   : $protein_seq_obj = $dna_seq_obj.translate

           Or if you expect a complete coding sequence (CDS) translation,
           with inititator at the beginning and terminator at the end:

           $protein_seq_obj = $cds_seq_obj.translate(-complete => 1);

           Or if you want translate() to find the first initiation
           codon and return the corresponding protein:

           $protein_seq_obj = $cds_seq_obj.translate(-orf => 1);

 Function: Provides the translation of the DNA sequence using full
           IUPAC ambiguities in DNA/RNA and amino acid codes.

           The complete CDS translation is identical to EMBL/TREMBL
           database translation. Note that the trailing terminator
           character is removed before returning the translated protein
           object.

           Note: if you set $dna_seq_obj.verbose(1) you will get a
           warning if the first codon is not a valid initiator.

 Returns : A Bio::PrimarySeqI implementing object
 Args    : terminator    - character for terminator        default is *
           unknown       - character for unknown           default is X
           frame         - frame                           default is 0
           codontable_id - codon table id                  default is 1
           complete      - complete CDS expected           default is 0
           throw         - throw exception if not complete default is 0
           orf           - find 1st ORF                    default is 0
           start         - alternative initiation codon
           codontable    - Bio::Tools::CodonTable object
		   offset        - offset for fuzzy locations      default is 0

 Notes   : The -start argument only applies when -orf is set to 1. By default
           all initiation codons found in the given codon table are used
           but when "start" is set to some codon this codon will be used
           exclusively as the initiation codon. Note that the default codon
           table (NCBI "Standard") has 3 initiation codons!

           By default translate() translates termination codons to
           the some character (default is *), both internal and trailing
           codons. Setting "-complete" to 1 tells translate() to remove
           the trailing character.

		   -offset is used for seqfeatures which contain the the \codon_start
		   tag and can be set to 1, 2, or 3.  This is the offset by which the
		   sequence translation starts relative to the first base of the
		   feature

For details on codon tables used by translate() see L<Bio::Tools::CodonTable>.

           Deprecated argument set (v. 1.5.1 and prior versions)
           where each argument is an element in an array:

           1: character for terminator (optional), defaults to '*'.
           2: character for unknown amino acid (optional), defaults to 'X'.
           3: frame (optional), valid values are 0, 1, 2, defaults to 0.
           4: codon table id (optional), defaults to 1.
           5: complete coding sequence expected, defaults to 0 (false).
           6: boolean, throw exception if not complete coding sequence
              (true), defaults to warning (false)
           7: codontable, a custom Bio::Tools::CodonTable object (optional).

=end translate

method translate { ... }

=begin length

 Title   : length
 Usage   : $len = $seq.length()
 Function:
 Returns : Integer representing the length of the sequence.
 Args    :

=end length

method length {
    return self.seq.length;
}

=begin description

 Title   : desc
 Usage   : $seq.desc = $newval;
           $description = $seq.desc();
 Function: Get/set description text for a seq object
 Returns : Value of desc
 Args    : newvalue (optional)

=end description

=begin is_circular

 Title   : is_circular
 Usage   : if  $obj.is_circular { /Do Something/ }
 Function: Returns true if the molecule is circular
 Returns : Boolean value
 Args    : none

=end is_circular

