use Bio::Type::Sequence;

class Bio::Tools::IUPAC {
    our %IUB = ( 'A' => [< A >],
                  'C' => [< C >],
                  'G' => [< G >],
                  'T' => [< T >],
                  'U' => [< U >],
                  'M' => [<A C>],
                  'R' => [<A G>],
                  'W' => [<A T>],
                  'S' => [<C G>],
                  'Y' => [<C T>],
                  'K' => [<G T>],
                  'V' => [<A C G>],
                  'H' => [<A C T>],
                  'D' => [<A G T>],
                  'B' => [<C G T>],
                  'X' => [<G A T C>],
                  'N' => [<G A T C>]
              );    

    our  %REV_IUB =
                 ('A'   => 'A',
                  'T'   => 'T',
                  'C'   => 'C',
                  'G'   => 'G',
                  'AC'  => 'M',
                  'AG'  => 'R',
                  'AT'  => 'W',
                  'CG'  => 'S',
                  'CT'  => 'Y',
                  'GT'  => 'K',
                  'ACG' => 'V',
                  'ACT' => 'H',
                  'AGT' => 'D',
                  'CGT' => 'B',
                  'ACGT'  => 'N',
                  'N'   => 'N'
              );


    our %IUP = ('A' => [<A>],
              'B' => [<D N>],
              'C' => [<C>],
              'D' => [<D>],
              'E' => [<E>],
              'F'=> [<F>],
              'G' => [<G>],
              'H' => [<H>],
              'I' => [<I>],
              'J' => [<I L>],
              'K' => [<K>],
              'L' => [<L>],
              'M' => [<M>],
              'N' => [<N>],
              'O' => [<O>],
              'P' => [<P>],
              'Q' => [<Q>],
              'R' => [<R>],
              'S' => [<S>],
              'T' => [<T>],
              'U' => [<U>],
              'V' => [<V>],
              'W' => [<W>],
              'X' => [<X>],
              'Y' => [<Y>],
              'Z' => [<E Q>],
              '*' => ['*']
              );

    has $.seq;
    has @.alpha;
    has @.string;

    # should be BUILD?  
    submethod BUILD($self: :$!seq, :$alphabet ) {
        
        my @alpha;
        my @string;
        
        given $!seq.alphabet {
            when ( dna | rna ) {
                @!alpha =  map { %IUB{uc($_)} } , comb(/\S/, $!seq.seq);        
            }
            
            when (protein) {
                @!alpha =  map { %IUP{uc($_)} } , comb(/\S/, $!seq.seq);        
            }
            
            default {
                die "No alphabet can be determine from seq object";
            }
        }
        @!string = 0 xx $!seq.seq.chars;
    
        @!string.elems == 0 && die "Sequence is length 0";
        @!string[0] = -1;
        
    }
    
    # NOTE: Not really sure of the utility here, this class seems to be more a
    # factory than anything else
    
    #being next_seq
    
     # Title   : next_seq
     # Usage   : $iupac.next_seq()
     # Function: returns the next unique Seq object
     # Returns : a Seq.pm object
     # Args    : none.
    
   
    #end
    
    method next_seq {
    
        for 0..@!string.end() -> $i {
            next unless @!string[$i] || @!alpha[$i] > 1;
            if ( @!string[$i] == @!alpha[$i].end ) { # rollover
                if ( $i == @!string.end ) { # end of possibilities
                    return;
                } else {
                    @!string[$i] = 0;
                    next;
                }
            }
            else {
                @!string[$i]++;
                my $j = -1;
                $!seq.seq = join('', map { $j++; @!alpha[$j][$_]; } ,@!string);
                my $desc = $!seq.description();
                if ( !defined $desc ) { $desc = ""; }
    
                # no idea why this is needed. No tests are depend on it and seems to have no value to convert
                # leaving it commented for now
                # $self->{'_num'}++;
                # 1 while $self->{'_num'} =~ s/(\d)(\d\d\d)(?!\d)/$1,$2/;
                # $desc =~ s/( \[Bio::Tools::IUPAC-generated\sunique sequence # [^\]]*\])|$/ \[Bio::Tools::IUPAC-generated unique sequence # $self->{'_num'}\]/;
                # $self->{'_SeqObj'}->desc($desc);
                # $self->{'_num'} =~ s/,//g;
                return $!seq;
            }
        }
    }
    
    #begin iupac_iup
    
     # Title   : iupac_iup
     # Usage   : my %aasymbols = $iupac.iupac_iup
     # Function: Returns a hash of PROTEIN symbols -> symbol components
     # Returns : Hash
     # Args    : none
    
    #end
    
    method iupac_iup {
       return %IUP;
    }
    
    #begin iupac_iub
    
     # Title   : iupac_iub
     # Usage   : my %dnasymbols = $iupac.iupac_iub
     # Function: Returns a hash of DNA symbols -> symbol components
     # Returns : Hash
     # Args    : none
    
    #end
    
    method iupac_iub {
       return %IUB;
    }
    
    #begin iupac_rev_iub
    
     # Title   : iupac_rev_iub
     # Usage   : my %dnasymbols = $iupac.iupac_rev_iub
     # Function: Returns a hash of nucleotide combinations -> IUPAC code
     #           (a reverse of the iupac_iub hash).
     # Returns : Hash
     # Args    : none
    
    #end
    
    method iupac_rev_iub {
       return %REV_IUB;
    }
    
    #begin count
    
     # Title   : count
     # Usage   : my $total = $iupac.count();
     # Function: Calculates the number of unique, unambiguous sequences that
     #           this ambiguous sequence could generate
     # Return  : int
     # Args    : none
    
    #end
    
    method count {
        my $count = 1;
        $count *= $_.elems for @!alpha;
        return $count;
    }



}

# # $Id: IUPAC.pm 15549 2009-02-21 00:48:48Z maj $
# #
# # BioPerl module for IUPAC
# #
# # Please direct questions and support issues to <bioperl-l@bioperl.org> 
# #
# # Cared for by Aaron Mackey <amackey@virginia.edu>
# #
# # Copyright Aaron Mackey
# #
# # You may distribute this module under the same terms as perl itself

# # POD documentation - main docs before the code

# =head1 NAME

# Bio::Tools::IUPAC - Generates unique Seq objects from an ambiguous Seq object

# =head1 SYNOPSIS

#  use Bio::Seq;
#  use Bio::Tools::IUPAC;

#  my $ambiseq = Bio::Seq->new(-seq => 'ARTCGUTGR', -alphabet => 'dna');
#  my $stream  = Bio::Tools::IUPAC->new(-seq => $ambiseq);

#  while ($uniqueseq = $stream->next_seq()) {
#      # process the unique Seq object.
#  }

# =head1 DESCRIPTION

# IUPAC is a tool that produces a stream of unique, "strict"-satisfying Seq
# objects from an ambiquous Seq object (containing non-standard characters given
# the meaning shown below)

#         Extended DNA / RNA alphabet :
#         (includes symbols for nucleotide ambiguity)
#         ------------------------------------------
#         Symbol       Meaning      Nucleic Acid
#         ------------------------------------------
#          A            A           Adenine
#          C            C           Cytosine
#          G            G           Guanine
#          T            T           Thymine
#          U            U           Uracil
#          M          A or C
#          R          A or G
#          W          A or T
#          S          C or G
#          Y          C or T
#          K          G or T
#          V        A or C or G
#          H        A or C or T
#          D        A or G or T
#          B        C or G or T
#          X      G or A or T or C
#          N      G or A or T or C

#         IUPAC-IUB SYMBOLS FOR NUCLEOTIDE NOMENCLATURE:
#           Cornish-Bowden (1985) Nucl. Acids Res. 13: 3021-3030.

# -----------------------------------

#        Amino Acid alphabet:
#         ------------------------------------------
#         Symbol           Meaning
#         ------------------------------------------
#         A        Alanine
#         B        Aspartic Acid, Asparagine
#         C        Cystine
#         D        Aspartic Acid
#         E        Glutamic Acid
#         F        Phenylalanine
#         G        Glycine
#         H        Histidine
#         I        Isoleucine
#         J        Isoleucine/Leucine
#         K        Lysine
#         L        Leucine
#         M        Methionine
#         N        Asparagine
#         O        Pyrrolysine
#         P        Proline
#         Q        Glutamine
#         R        Arginine
#         S        Serine
#         T        Threonine
#         U        Selenocysteine
#         V        Valine
#         W        Tryptophan
#         X        Unknown
#         Y        Tyrosine
#         Z        Glutamic Acid, Glutamine
#         *        Terminator


#         IUPAC-IUP AMINO ACID SYMBOLS:
#           Biochem J. 1984 Apr 15; 219(2): 345-373
#           Eur J Biochem. 1993 Apr 1; 213(1): 2

# =head1 FEEDBACK

# =head2 Mailing Lists

# User feedback is an integral part of the evolution of this and other
# Bioperl modules. Send your comments and suggestions preferably to one
# of the Bioperl mailing lists.  Your participation is much appreciated.

#   bioperl-l@bioperl.org                  - General discussion
#   http://bioperl.org/wiki/Mailing_lists  - About the mailing lists

# =head2 Support 
 
# Please direct usage questions or support issues to the mailing list:
  
# L<bioperl-l@bioperl.org>
  
# rather than to the module maintainer directly. Many experienced and 
# reponsive experts will be able look at the problem and quickly 
# address it. Please include a thorough description of the problem 
# with code and data examples if at all possible.

# =head2 Reporting Bugs

# Report bugs to the Bioperl bug tracking system to help us keep track
# the bugs and their resolution.  Bug reports can be submitted via the
# web:

#   http://bugzilla.open-bio.org/

# =head1 AUTHOR - Aaron Mackey

# Email amackey-at-virginia.edu

# =head1 APPENDIX

# The rest of the documentation details each of the object
# methods. Internal methods are usually preceded with a _

# =cut


# Let the code begin...
