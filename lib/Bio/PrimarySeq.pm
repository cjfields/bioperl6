use Bio::Role::Describe;
use Bio::Role::Identify;

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

method translate(*@parameters) {
    return Bio::PrimarySeq.new(seq => 'NYI');
}


}
