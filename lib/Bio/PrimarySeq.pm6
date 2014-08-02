use v6;

use Bio::Role::Describe;
use Bio::Role::Identify;
use Bio::Tools::Codontable;

class Bio::PrimarySeq does Bio::Role::Describe does Bio::Role::Identify;

# needs some type-checking, just simple for now
has Str $.seq          is rw;

# limit to 'dna', 'rna', 'protein'
has Str $.alphabet;
has Bool $.is_circular is rw = False;

# this is mainly to deal with display_id being an alias for 'id', and 'desc' being shorthand for 'description'
# This probabky should be re-thought, at least until we can create an 'is aliased' trait again

method new(*%args) {
    #allow for both 'id' and 'display_id' to initialize $!id attributes
    if (%args{'display_id'}:exists) {
        %args{'id'}= %args{'display_id'};
        %args{'display_id'}:delete;
    }

    #allow for both 'desc' and 'description' to initalize $.description attributes
    if (%args{'desc'}:exists) {
        %args{'description'} = %args{'desc'};
        %args{'desc'}:delete;
    }
    return self.bless(|%args);
}

#method !guess_alphabet() {
#   my $type;
#
#   my $str = $!seq;
#   
#   # Remove char's that clearly denote ambiguity
#   $str ~~ s:g/<[\-\.\?]>//;
#   #::g emacs syntax
#
#   my $total = $str.chars;
#   if ( $total == 0 ) {
#   #   if (!$self->{'_nowarnonempty'}) {
#   #     $self->warn("Got a sequence with no letters in it ".
#   #         "cannot guess alphabet");
#   #   }
#       return '';
#   }
#
#   #counting the # of character were found in the string . Need a better way - takadonet
#   my $u = $str.chars - $str.trans('U' => '','u' => '').chars;
#   # The assumption here is that most of sequences comprised of mainly
#   # ATGC, with some N, will be 'dna' despite the fact that N could
#   # also be Asparagine
#   my $atgc = $str.chars - $str.trans('A' => '' ,'T' => '','G'=> '','C'=> '','N'=> '','a'=> '',
#                         't'=> '','g'=> '','c'=> '','n' => '' ).chars;
#   
#   if ( ($atgc / $total) > 0.85 ) {
#       $type = 'dna';
#   } elsif ( (($atgc + $u) / $total) > 0.85 ) {
#       $type = 'rna';
#   } else {
#       $type = 'protein';
#   }
#
#   $.alphabet =$type;
#   return $type;
#}

#method seq(Str $value?,Str $alphabet?) {
#    return $!seq if ! defined $value;
#
#   #     if (defined($value) && (! $obj->validate_seq($value))) {
#   #         $obj->throw("Attempting to set the sequence to [$value] ".
#   #      						"which does not look healthy");
#   #      	}
#    
#    # if a sequence was already set we make sure that we re-adjust the
#    # alphabet, otherwise we skip guessing if alphabet is already set
#    # note: if the new seq is empty or undef, we don't consider that a
#    # change (we wouldn't have anything to guess on anyway)
#    my $is_changed_seq =
#        defined $!seq && $value.chars > 0;
#    $!seq = $value;
#    
#    # new alphabet overridden by arguments?
#    if (defined $alphabet) {
#        # yes, set it no matter what
#        self.alphabet = $alphabet;
#    }
#    elsif ( # if we changed a previous sequence to a new one
#        $is_changed_seq ||
#            # or if there is no alphabet yet at all
#            (! defined($.alphabet)) ) {
#        # we need to guess the (possibly new) alphabet
#        self!guess_alphabet();
#    }
#    
#    # else (seq not changed and alphabet was defined) do nothing
#    # if the seq is changed, make sure we unset a possibly set length
#    #    self.length(undef) if $is_changed_seq || $!seq;
#
#    return $!seq;
#}



=begin length

 Title   : length
 Usage   : $len = $seq.length();
 Function: Get the length of the sequence in number of symbols (bases
           or amino acids).

           You can also set this attribute, even to a number that does
           not match the length of the sequence string. This is useful
           if you don''t want to set the sequence too, or if you want
           to free up memory by unsetting the sequence. In the latter
           case you could do e.g.

               $seq.length($seq->length);
               #todo will not be undef but Mu I believe
               #$seq.seq(undef);

           Note that if you set the sequence to a value other than
           undef at any time, the length attribute will be
           invalidated, and the length of the sequence string will be
           reported again. Also, we won''t let you lie about the length.

 Example :
 Returns : integer representing the length of the sequence.
 Args    : Optionally, the value on set

=end length

multi method length() {
    # we do not cache values, but simply report back the length of the sequence
    return $.seq.chars;
}

## begin trunc
#
##  Title   : trunc
##  Usage   : $subseq = $myseq->trunc(10,100);
##  Function: Provides a truncation of a sequence.
##  Returns : A fresh Bio::PrimarySeqI implementing object.
##  Args    : Two integers denoting first and last base of the sub-sequence.
#
#
## end trunc 
#
#multi method trunc( $location ) {
#    my Str $str;
#
#    $str = self.subseq($location);
#    # my $seqclass;
#    # if($self->can_call_new()) {
#    #     $seqclass = ref($self);
#    # } else {
#    #     $seqclass = 'Bio::PrimarySeq';
#    #     $self->_attempt_to_load_Seq();
#    # }
#
#    my $out = Bio::PrimarySeq.new( seq => $str,
#                                   display_id  => self.display_id,
#                                   accession_number => self.accession_number,
#                                   alphabet => self.alphabet,
#                                   description => self.description(),
#                               );
#    
#   return $out;
#}
#
#
#multi method trunc(Int $start,Int $end where {  $start < $end }) {
#    my Str $str;
#
#    $str = self.subseq(start => $start,end => $end);
#    # my $seqclass;
#    # if($self->can_call_new()) {
#    #     $seqclass = ref($self);
#    # } else {
#    #     $seqclass = 'Bio::PrimarySeq';
#    #     $self->_attempt_to_load_Seq();
#    # }
#
#    # my $out = $seqclass->new( seq => $str,
#    my $out = Bio::PrimarySeq.new( seq => $str,
#                                   display_id  => self.display_id,
#                                   accession_number => self.accession_number,
#                                   alphabet => self.alphabet,
#                                   description => self.description(),
#                                   #verbose => self.verbose
#                               );
#    
#   return $out;
#}


=begin subseq

  Title   : subseq
  Usage   : $substring = $obj.subseq(10,40);
            $substring = $obj.subseq(10,40,True)
            $substring = $obj.subseq(start=>10,end=>40,replace_with=>'tga')
  Function: returns the subseq from start to end, where the first sequence
            character has coordinate 1 number is inclusive, ie 1-2 are the 
            first two characters of the sequence
  Returns : a string
  Args    : integer for start position
            integer for end position
                  OR
            Bio::LocationI location for subseq (strand honored) (NYI)
            Specify 'nogap => True' to return subseq with gap characters removed
            Specify 'replace_with => $new_subseq' to replace the subseq returned
            with $new_subseq in the sequence object (NYI)

=end subseq

#multi method subseq(Bio::Role::Location $loc, Bool :$nogap?,Str :$replace_with?) {
#       my $seq = "";
#       for $loc.each_Location() -> $subloc {
#           my $piece = self.subseq(start=>$subloc.start(),
#                                   end=>$subloc.end(), 
#                                   replace_with=>$replace_with,
#                                   nogap=>$nogap
#                                 );
#           #todo please add uncomment this line one day.
#   #        $piece ~~ s:g/$GAP_SYMBOLS// if $nogap;
#           
#           if ($subloc.strand() < 0) {
#               $piece = Bio::PrimarySeq.new(seq => $piece).revcom().seq();
#           }
#           $seq ~= $piece;
#       }
#   return $seq;
#}


multi method subseq(Int :$start is copy,
                    Int :$end is copy,
                    Int :$strand = 1,
                    Bool :$nogap?,
                    Str :$replace_with?
where { defined $start && defined $end && $end < self.length && $start < $end }
) {
   
    # if $replace_wtih is specified, have the constructor validate it as seq
    my $dummy =  Bio::PrimarySeq.new(seq=>$replace_with, alphabet=>self.alphabet) if defined($replace_with);
 
 
    # remove one from start, and then length is end-start
    $start--;
    
    my $seqstr =  substr(self.seq,$start, ($end-$start));
    
    #       $seqstr ~~ s:g/$GAP_SYMBOLS//g if ($nogap);
    # :g :g remove later, added so I can have emacs syntax highlighting and indents
            
    #no idea why they did it this way in p5 code.....
    #probably a good reason why
    #     my @ss_args = map { eval "defined $_"  ? $_ : () } qw( $self->{seq} $start $end-$start $replace);
    #     my $seqstr = eval join( '', "substr(", join(',',@ss_args), ")");
    #     $seqstr =~ s/[$GAP_SYMBOLS]//g if ($nogap);
   
    if $strand == -1 {
        $seqstr .= trans('acgtrymkswhbvdnxACGTRYMKSWHBVDNX' => 'tgcayrkmswdvbhnxTGCAYRKMSWDVBHNX');
    }
   
   
    return $seqstr;
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
    #$self->throw("Sequence is a protein. Cannot revcom");
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
    $str .= trans('acgtrymkswhbvdnxACGTRYMKSWHBVDNX' => 'tgcayrkmswdvbhnxTGCAYRKMSWDVBHNX');

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
        
    # TODO: I think there is a better clone
    
    my $out = self.clone( seq   => $revseq);
    
    return $out;
}



method translate(:$terminator = '*',
                 :$unknown = 'X',
                 :$frame = 0,
                 Bool :$complete = False,
                 :$throw? is copy,
                 Bio::Tools::CodonTable :$codonTable = Bio::Tools::CodonTable.new( id => 1 ),
                 :$orf? is copy,
                 :start($start_codon)? is copy,
                 :$offset? is copy) {

    ## Get a CodonTable, error if custom CodonTable is invalid
    #if ($codonTable) {
    #    self.throw("Need a Bio::Tools::CodonTable object, not " ~ $codonTable)
    #           unless $codonTable ~~ 'Bio::Tools::CodonTable';
    #} else {
    #    $codonTable = Bio::Tools::CodonTable.new( id => $codonTableId);
    #}

    # TODO: Error if alphabet is "protein"
    # $self->throw("Can't translate an amino acid sequence.") if
    #     	($self->alphabet =~ /protein/i);

    # TODO: Error if -start parameter isn't a valid codon
    #     if ($start_codon) {
    #     	 $self->throw("Invalid start codon: $start_codon.") if
    #     		( $start_codon !~ /^[A-Z]{3}$/i );
    #     }
         
    my $seq;
    
    if ($offset) {
#     	$self->throw("Offset must be 1, 2, or 3.") if
#     	    ( $offset !~ /^[123]$/ );
           my ($start, $end) = ($offset, self.length);
           ($seq) = self.subseq($start, $end);
    } else {
        ($seq) = self.seq();
    }

    # ignore frame if an ORF is supposed to be found
    if ($orf) {
        $seq = self!find_orf($seq,$codonTable,$start_codon);
    } else {
        ## use frame, error if frame is not 0, 1 or 2
        #     	 $self->throw("Valid values for frame are 0, 1, or 2, not $frame.")
        #     		unless ($frame == 0 or $frame == 1 or $frame == 2);
        $seq = substr($seq,$frame);
    }
    

    ## Translate it
    my $output = $codonTable.translate($seq);
    # Use user-input terminator/unknown
    $output ~~ s:g/\*/$terminator/;
    $output ~~ s:g/X/$unknown/;
    # :g comment
        
    ## Only if we are expecting to translate a complete coding region
    if ($complete) {
                 my $id = self.display_id;
                 # remove the terminator character
                 if ( substr($output,-1,1) eq $terminator ) {
                     $output =$output.chop;
                 } else {
    #     		 $throw && $self->throw("Seq [$id]: Not using a valid terminator codon!");
    #     		 $self->warn("Seq [$id]: Not using a valid terminator codon!");
                 }
                 # test if there are terminator characters inside the protein sequence!
                 if ($output ~~ /\*/) {
    #     		 $throw && $self->throw("Seq [$id]: Terminator codon inside CDS!");
    #     		 $self->warn("Seq [$id]: Terminator codon inside CDS!");
                 }
                 # if the initiator codon is not ATG, the amino acid needs to be changed to M
                 if ( substr($output,0,1) ne 'M' ) {
                         if ($codonTable.is_start_codon(substr($seq, 0, 3)) ) {
                                 $output = 'M' ~ substr($output,1);
                         }	elsif ($throw) {
    #     			 $self->throw("Seq [$id]: Not using a valid initiator codon!");
                         } else {
    #     			 $self->warn("Seq [$id]: Not using a valid initiator codon!");
                         }
                 }
    }

    my $seqclass;
    # if ($self->can_call_new()) {
    #     	 $seqclass = ref($self);
    # } else {
    #     	 $seqclass = 'Bio::PrimarySeq';
    #     	 $self->_attempt_to_load_Seq();
    # }


    my $out = Bio::PrimarySeq.new( seq => $output,
                                   display_id  => self.display_id,
                                   accession_number => self.accession_number,
                                   alphabet => 'protein',
                                   description => self.description(),
                               );
    
    return $out
}

=begin find_orf

  Title   : find_orf
  Usage   :
  Function: Finds ORF starting at 1st initiation codon in nucleotide sequence.
            The ORF is not required to have a termination codon.
  Example :
  Returns : A nucleotide sequence or nothing, if no initiation codon is found.
  Args    : Nucleotide sequence, CodonTable object, alternative initiation
            codon (optional).

=end find_orf

method !find_orf($sequence is copy,$codonTable,$start_codon) {
    # find initiation codon and remove leading sequence
    while ($sequence) {
        my $codon = substr($sequence,0,3);
        if ($start_codon) {
            last if ( $codon ~~ m:i/$start_codon/ ); # : 
        }
        else {
            last if ($codonTable.is_start_codon($codon));
        }
                $sequence = substr($sequence,1);
    }
                
    return unless $sequence;

    # find termination codon and remove trailing sequence
        my $len = $sequence.chars;
        my $offset = 3;
        while ($offset < $len) {
                my $codon = substr($sequence,$offset,3);
                if ( $codonTable.is_ter_codon($codon) ) {
                        $sequence = substr($sequence, 0, $offset + 3);
                        return $sequence;
                }
                $offset += 3;
        }
#	$self->warn("No termination codon found, will translate - sequence:\n$sequence");
        return $sequence;
    }

