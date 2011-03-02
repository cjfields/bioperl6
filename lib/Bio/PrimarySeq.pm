use Bio::Role::Describe;
use Bio::Role::Identify;
use Bio::Tools::CodonTable; 
class Bio::PrimarySeq does Bio::Role::Describe does Bio::Role::Identify {

has Str $.seq is rw;
has Str $.alphabet is rw;
has Int $!seq_length is ro;
has Bool $.is_circular is rw;

# begin length

# Title   : length
# Usage   : $len = $seq.length();
# Function: Get the length of the sequence in number of symbols (bases
#           or amino acids).

#           You can also set this attribute, even to a number that does
#           not match the length of the sequence string. This is useful
#           if you don''t want to set the sequence too, or if you want
#           to free up memory by unsetting the sequence. In the latter
#           case you could do e.g.

#               $seq.length($seq->length);
#               #todo will not be undef but Mu I believe
#               #$seq.seq(undef);

#           Note that if you set the sequence to a value other than
#           undef at any time, the length attribute will be
#           invalidated, and the length of the sequence string will be
#           reported again. Also, we won''t let you lie about the length.

# Example :
# Returns : integer representing the length of the sequence.
# Args    : Optionally, the value on set

# end length 

multi method length() {

    if $!seq_length {
		 return $!seq_length;
    }
    #not sure which is more reliable in the end, graphs or chars
    #currently graphs does not work for Str
    my Int $len = $.seq.chars();

    
    return $len;
}

multi method length(Int $val){
    #not sure which is more reliable in the end, graphs or chars
    #currently graphs does not work for Str
	 my Int $len = $.seq.chars();
	 
	 if $val != $len {
            #need to have a throw here and die
            self.throw("You're trying to lie about the length: is $len but you say $val");
         }
	 
	$!seq_length = $val;
	
	return $val;
}




# begin trunc

#  Title   : trunc
#  Usage   : $subseq = $myseq->trunc(10,100);
#  Function: Provides a truncation of a sequence.
#  Returns : A fresh Bio::PrimarySeqI implementing object.
#  Args    : Two integers denoting first and last base of the sub-sequence.


# end trunc 

method trunc(Int $start,Int $end where {  $start < $end }) {
    my Str $str;

    $str = self.subseq($start,$end);
    # my $seqclass;
    # if($self->can_call_new()) {
    #     $seqclass = ref($self);
    # } else {
    #     $seqclass = 'Bio::PrimarySeq';
    #     $self->_attempt_to_load_Seq();
    # }

    # my $out = $seqclass->new( seq => $str,
    my $out = Bio::PrimarySeq.new( seq => $str,
                                   display_id  => self.display_id,
                                   accession_number => self.accession_number,
                                   alphabet => self.alphabet,
                                   description => self.description(),
                                   #verbose => self.verbose
                               );
    
   return $out;
}


method subseq(Int $start,Int $end) {
    return 'NYI';
}

# begin revcom

#  Title   : revcom
#  Usage   : $rev = $seq.revcom()
#  Function: Produces a new Bio::SeqI implementing object which
#            is the reversed complement of the sequence. For protein
#            sequences this throws an exception of
#            "Sequence is a protein. Cannot revcom".

#            The id is the same id as the orginal sequence, and the
#            accession number is also indentical. If someone wants to
#            track that this sequence has be reversed, it needs to
#            define its own extensions.

#            To do an inplace edit of an object you can go:

#            $seqobj = $seqobj.revcom();

#            This of course, causes Perl to handle the garbage
#            collection of the old object, but it is roughly speaking as
#            efficient as an inplace edit.

#  Returns : A new (fresh) Bio::SeqI object
#  Args    : none

# end revcom


method revcom() {

   # check the type is good first.
   my $t = self.alphabet;
   
   if  $t eq 'protein'  {
       #todo throw error
#       $self->throw("Sequence is a protein. Cannot revcom");
       
   }

   # if( $t ne 'dna' && $t ne 'rna' ) {
   #     if( $self->can('warn') ) {
   #         $self->warn("Sequence is not dna or rna, but [$t]. ".
   #      	       "Attempting to revcom, but unsure if this is right");
   #     } else {
   #         warn("[$self] Sequence is not dna or rna, but [$t]. ".
   #      	"Attempting to revcom, but unsure if this is right");
   #     }
   # }

   # yank out the sequence string

   my $str = self.seq;

   # if is RNA - map to DNA then map back

   if  $t eq 'rna'  {
       $str .= trans('u' => 't' , 'U' => 'T');
   }

   # revcom etc...

   # old p5 tr function
   # $str =~ tr/acgtrymkswhbvdnxACGTRYMKSWHBVDNX/tgcayrkmswdvbhnxTGCAYRKMSWDVBHNX/;
       
   $str .= trans('a'=>'t','c'=>'g','g'=>'c','t'=>'a','r'=>'y','y'=>'r','m'=>'k','k'=>'m','s'=>'s','w'=>'w','h'=>'d','b'=>'v','v'=>'b','d'=>'h','n'=>'n',
                 'x'=>'x','A'=>'T','C'=>'G','G'=>'C','T'=>'A','R'=>'Y','Y'=>'R','M'=>'K','K'=>'M','S'=>'S','W'=>'W','H'=>'D','B'=>'V','V'=>'B',
                 'D'=>'H','N'=>'N','X'=>'X');       
   my $revseq =  $str.flip;

   if $t eq 'rna'  {
       $revseq.=trans('t' => 'u', 'T' => 'U');
   }

   # will need in future
   # my $seqclass;
   # if($self->can_call_new()) {
   #     $seqclass = ref($self);
   # } else {
   #     $seqclass = 'Bio::PrimarySeq';
   #     $self->_attempt_to_load_Seq();
   # }
       
    my $out = Bio::PrimarySeq.new( seq => $revseq,
                                   display_id  => self.display_id,
                                   accession_number => self.accession_number,
                                   alphabet => self.alphabet,
                                   description => self.description(),
                                   #verbose => self.verbose
                               );
   return $out;
}

multi method translate() {
    my ($terminator, $unknown, $frame, $codonTableId, $complete, $throw,
        $codonTable, $orf, $start_codon, $offset);
    ## Initialize termination codon, unknown codon, codon table id, frame
    $terminator = '*';
    $unknown = "X";
    $frame = 0;
    $codonTableId = 1;

    ## Get a CodonTable, error if custom CodonTable is invalid
    if ($codonTable) {
    #    $self->throw("Need a Bio::Tools::CodonTable object, not ". $codonTable)
    #        unless $codonTable->isa('Bio::Tools::CodonTable');
    } else {
        $codonTable = Bio::Tools::CodonTable.new( id => $codonTableId);
    }

    ## Error if alphabet is "protein"
    # $self->throw("Can't translate an amino acid sequence.") if
    #     	($self->alphabet =~ /protein/i);

    my $seq =  self.seq();
    ## Translate it
    my $output = $codonTable.translate($seq);
    # Use user-input terminator/unknown
    $output ~~ s:g/\*/$terminator/;
    $output ~~ s:g/X/$unknown/;
    # remove me later, need to have emacs syntax highlighting and indents! :g

    my $out = Bio::PrimarySeq.new( seq => $output,
                                   display_id  => self.display_id,
                                   accession_number => self.accession_number,
                                   alphabet => 'protein',
                                   description => self.description(),
                                   #verbose => self.verbose
                               );
    
    return $out;
}


multi method translate(*@parameters) {
    #      my ($self,@args) = @_;
    #      my ($terminator, $unknown, $frame, $codonTableId, $complete, $throw,
    #     	  $codonTable, $orf, $start_codon, $offset);

    #      ## new API with named parameters, post 1.5.1
    #      if ($args[0] && $args[0] =~ /^-[A-Z]+/i) {
    #     	 ($terminator, $unknown, $frame, $codonTableId, $complete, $throw,
    #     	  $codonTable, $orf, $start_codon, $offset) =
    #     		 $self->_rearrange([qw(TERMINATOR
    #     							UNKNOWN
    #     							FRAME
    #     							CODONTABLE_ID
    #     							COMPLETE
    #     							THROW
    #     							CODONTABLE
    #     							ORF
    #     							START
    #     							OFFSET)], @args);
    #      ## old API, 1.5.1 and preceding versions
    #      } else {
    #     	 ($terminator, $unknown, $frame, $codonTableId,
    #     	  $complete, $throw, $codonTable, $offset) = @args;
    #      }

    # ## Initialize termination codon, unknown codon, codon table id, frame
    # $terminator = '*'    unless (defined($terminator) and $terminator ne '');
    # $unknown = "X"       unless (defined($unknown) and $unknown ne '');
    # $frame = 0           unless (defined($frame) and $frame ne '');
    # $codonTableId = 1    unless (defined($codonTableId) and $codonTableId ne '');

    # ## Get a CodonTable, error if custom CodonTable is invalid
    # if ($codonTable) {
    #     	 $self->throw("Need a Bio::Tools::CodonTable object, not ". $codonTable)
    #     		unless $codonTable->isa('Bio::Tools::CodonTable');
    # } else {
    #     	 $codonTable = Bio::Tools::CodonTable->new( -id => $codonTableId);
    #      }

    # ## Error if alphabet is "protein"
    # $self->throw("Can't translate an amino acid sequence.") if
    #     	($self->alphabet =~ /protein/i);

    # ## Error if -start parameter isn't a valid codon
    #      if ($start_codon) {
    #     	 $self->throw("Invalid start codon: $start_codon.") if
    #     		( $start_codon !~ /^[A-Z]{3}$/i );
    #      }
	 
    #      my $seq;
	 
    #      if ($offset) {
    #     	$self->throw("Offset must be 1, 2, or 3.") if
    #     	    ( $offset !~ /^[123]$/ );
    #     	my ($start, $end) = ($offset, $self->length);
    #     	($seq) = $self->subseq($start, $end);
    #      } else {
    #     	($seq) = $self->seq();
    #      }

    # ## ignore frame if an ORF is supposed to be found
    #      if ($orf) {
    #     	 $seq = $self->_find_orf($seq,$codonTable,$start_codon);
    #      } else {
    #      ## use frame, error if frame is not 0, 1 or 2
    #     	 $self->throw("Valid values for frame are 0, 1, or 2, not $frame.")
    #     		unless ($frame == 0 or $frame == 1 or $frame == 2);
    #     	 $seq = substr($seq,$frame);
    # }

    # ## Translate it
    # my $output = $codonTable->translate($seq);
    # # Use user-input terminator/unknown
    # $output =~ s/\*/$terminator/g;
    # $output =~ s/X/$unknown/g;

    # ## Only if we are expecting to translate a complete coding region
    # if ($complete) {
    #     	 my $id = $self->display_id;
    #     	 # remove the terminator character
    #     	 if( substr($output,-1,1) eq $terminator ) {
    #     		 chop $output;
    #     	 } else {
    #     		 $throw && $self->throw("Seq [$id]: Not using a valid terminator codon!");
    #     		 $self->warn("Seq [$id]: Not using a valid terminator codon!");
    #     	 }
    #     	 # test if there are terminator characters inside the protein sequence!
    #     	 if ($output =~ /\*/) {
    #     		 $throw && $self->throw("Seq [$id]: Terminator codon inside CDS!");
    #     		 $self->warn("Seq [$id]: Terminator codon inside CDS!");
    #     	 }
    #     	 # if the initiator codon is not ATG, the amino acid needs to be changed to M
    #     	 if ( substr($output,0,1) ne 'M' ) {
    #     		 if ($codonTable->is_start_codon(substr($seq, 0, 3)) ) {
    #     			 $output = 'M'. substr($output,1);
    #     		 }	elsif ($throw) {
    #     			 $self->throw("Seq [$id]: Not using a valid initiator codon!");
    #     		 } else {
    #     			 $self->warn("Seq [$id]: Not using a valid initiator codon!");
    #     		 }
    #     	 }
    # }

    # my $seqclass;
    # if ($self->can_call_new()) {
    #     	 $seqclass = ref($self);
    # } else {
    #     	 $seqclass = 'Bio::PrimarySeq';
    #     	 $self->_attempt_to_load_Seq();
    # }
    # my $out = $seqclass->new( '-seq' => $output,
    #     									'-display_id'  => $self->display_id,
    #     									'-accession_number' => $self->accession_number,
    #     									# is there anything wrong with retaining the
    #     									# description?
    #     									'-desc' => $self->desc(),
    #     									'-alphabet' => 'protein',
    #                           '-verbose' => $self->verbose
    #     		      );
    # return $out;
    
    return Bio::PrimarySeq.new(seq => 'NYI'); 
}


}
