role Bio::Role::PrimarySeq;

# below is intended to disambiguate seq (raw sequence) from bioSeq (Bio::Role::PrimarySeq)
has Str $.raw_seq       is rw;
has Str $.alphabet      is rw where { $alphabet.lc any(<dna rna protein>)} ; 
has Bool $.is_circular  is rw;

# maybe have a flag indicating the sequence is abstract?

# Signatures subject to change, offer not valid in all 50 states...

# below is essentially substr with a bit more bp-specific decoration.
our Str method raw_subseq (
    Int :$start?,
    Int :$end?,
    Bio::Role::Location :$location?,
    Str :$replace?,
    Bool :$gaps = True
)
{...}

our Bio::Role::PrimarySeq method subSeq (
    Int :$start?,
    Int :$end?,
    Bio::Role::Location :$location?,
    Str :$replace?,
    Bool :$gaps = True
)
{...}

# only for DNA/RNA
our Bio::Role::PrimarySeq method revcom (
    
)
{...}

# how should this method differ from subSeq? 
our Bio::Role::PrimarySeq method trunc () {...}

# only for DNA/RNA
our Bio::Role::PrimarySeq method translate () {...}
# Can this be simplified?
# Current options for translate:
# Args    : -terminator    - character for terminator        default is *
#           -unknown       - character for unknown           default is X
#           -frame         - frame                           default is 0
#           -codontable_id - codon table id                  default is 1
#           -complete      - complete CDS expected           default is 0
#           -throw         - throw exception if not complete default is 0
#           -orf           - find 1st ORF                    default is 0
#           -start         - alternative initiation codon
#           -codontable    - Bio::Tools::CodonTable object
#		   -offset        - offset for fuzzy locations      default is 0

# only for protein
our Bio::Role::PrimarySeq method backtranslate () {...}

# Should this be a built-in?  Moved to a utility?  Make a flag?

our Bool method validate_seq {...}

# Peter (from BioPython), when discussing BioSQL, indicated they do not
# guess the alphabet if at all possible (too many ambiguities).  I think
# we can optionally guess it, as is the current way via BioPerl (though
# maybe off by default)

our Str method !guess_alphabet {...}

