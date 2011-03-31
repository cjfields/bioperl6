class Bio::SeqFeature::Lite {

# use base qw(Bio::Root::Root Bio::SeqFeatureI Bio::LocationI Bio::SeqI Bio::RangeI);

# alias for functions    
# *stop        = \&end;
# *info        = \&name;
# *seqname     = \&name;
# *exons       = *sub_SeqFeature = *merged_segments = \&segments;
# *get_all_SeqFeatures = *get_SeqFeatures = \&segments;
# *method         = \&primary_tag;
# *source         = \&source_tag;
# *get_tag_values = \&each_tag_value;
# *add_SeqFeature = \&add_segment;
# *get_all_tags   = \&all_tags;
# *abs_ref        = \&ref;

# implement Bio::SeqI and FeatureHolderI interface

# method primary_seq { return $_[0] }
method annotation($value?) {
    
    if ( defined $value ) {
        #	$obj->throw("object of class ".ref($value)." does not implement ".
        #		    "Bio::AnnotationCollectionI. Too bad.")
        # 	    unless $value->isa("Bio::AnnotationCollectionI");
 	self._annotation = $value;
    } elsif ( ! defined self._annotation ) {
 	self._annotation = Bio::Annotation::Collection.new();
    }
    return self._annotation;
}

method species($species?) {
    if (defined $species) {
        self.species = $species;
    } else {
        return self.species;
    }
}
    
method is_remote { return }
    
# method feature_count { return scalar @{shift->{segments} || []} }

method target { return; }
method hit    { self.target }
method type() {
   my $method = self.primary_tag;
   my $source = self.source_tag;
   return $source ne '' ?? "$method" ~ ":$source" !! $method;
}


has $.start is rw;
has $.stop is rw;

has $!type is rw;
has $!strand is rw;
has $.ref is rw;

has $.source is rw;

has $!phase is rw;
has $!seq is rw;
has $!class is rw;

has $.name is rw;
has $.desc is rw;
has $!subtype is rw;

has $.refseq is rw;

has @!segments is rw;


# usage:
# Bio::SeqFeature::Lite->new(
#                         -start => 1,
#                         -end   => 100,
#                         -name  => 'fred feature',
#                         -strand => +1);
#
# Alternatively, use -segments => [ [start,stop],[start,stop]...]
# to create a multisegmented feature.
method new(*%args is copy) {
  %args{'strand'} ||= 0;
  
  if (%args{'strand'} ~~ /^<[\+\-\.]>$/) {
      %args{'strand'} = "+" && %args{'strand'} ='1';
      %args{'strand'} = "-" && %args{'strand'} = '-1';
      %args{'strand'} = "." && %args{'strand'} = '0';
  }
  else {
      %args{'strand'}  = %args{'strand'} ?? (%args{'strand'} >= 0 ?? +1 !! -1) !! 0;
  }
  
  %args{'name'}    = %args{'name'}   || %args{'seqname'} || %args{'display_id'} 
      || %args{'display_name'} || %args{'id'};
  %args{'type'}    = %args{'type'}   || %args{'primary_tag'} || 'feature';
  %args{'source'}  = %args{'source'} || %args{'source_tag'} || '';
  %args{'stop'}    = %args.exists('end') ?? %args{'end'} !! %args{'stop'};
  %args{'ref'}     = %args{'seq_id'} || %args{'ref'};

  #list of arguments that need attributes : url seq phase desc attributes primary_id

  # is_circular is needed for Bio::PrimarySeqI compliance
  %args{'is_circular'} = %args{'is_circular'} || 0;

  # fix start, stop
  if (defined %args{'stop'} && defined %args{'start'}
          && %args{'stop'} < %args{'start'}) {
      #swap start and stop values
      (%args{'start'} , %args{'stop'}) = (%args{'stop'} , %args{'start'});
      %args{'strand'} *= -1;
  }


  my @s;
  #remove segments from argument since need some pre processing.
  if (%args.exists('segments')) {
      @s = @(%args{'segments'});
      %args.delete('segments');
  }
  
  my $x = self.bless(*,|%args);
  
  if (@s) {
      # old p5 comments
      # NB: when $self ISA Bio::DB::SeqFeature the following invokes
      # Bio::DB::SeqFeature::add_segment and not
      # Bio::DB::SeqFeature::add_segment (as might be expected?)
      $x.add_segment(@s);
  } 
  
  return $x;
}

method add_segment(@s) {
    my $type = $!subtype || self.type;
    my $ref   = self.seq_id;
    my $name  = self.name;
    my $class = self.class;
    my $source_tag = self.source_tag;

    my $min_start = self.start ||  999_999_999_999;
    my $max_stop  = self.end   || -999_999_999_999;

    my @segments = @!segments;

    for (@s) -> $seg {
        if ($seg ~~ Array ) {
            #flatting array
            my ($start,$stop) = @($seg);
            next unless defined $start && defined $stop;  # fixes an obscure bug somewhere above us
            my $strand = self.strand;

            if ($start > $stop) {
                ($start,$stop) = ($stop,$start);
                $strand = -1;
            }
            
            push @segments,Bio::SeqFeature::Lite.new(start  => $start,
                                                     stop   => $stop,
                                                     strand => $strand,
                                                     ref    => $ref,
                                                     type   => $type,
                                                     name   => $name,
                                                     class  => $class,
                                                     phase  => $!phase,
                                                     #score  => self->{score},
                                                     source_tag  => $source_tag,
                                                     #attributes  => self->{attributes},
                                                 );
            $min_start = $start if $start < $min_start;
            $max_stop  = $stop  if $stop  > $max_stop;
            
            #probably want to check for a generic SeqFeature
        } elsif ($seg ~~ Bio::SeqFeature::Lite) {
            push @segments,$seg;

            $min_start = $seg.start if ($seg.start && $seg.start < $min_start);
            $max_stop  = $seg.end   if ($seg.end && $seg.end > $max_stop);
        }
    }
        
   if (@segments) {
       @!segments = @segments;
       $.ref    ||= @segments[0].seq_id;
       $.start    = $min_start;
       $.stop     = $max_stop;
   }
}

method segments() {
#   my $s = self->{segments} or return wantarray ? () : 0;
#   @$s;
   return @!segments;
}
# method score    {
#   my $self = shift;
#   my $d = self->{score};
#   self->{score} = shift if @_;
#   $d;
# }
method primary_tag($value?) {
    if ( defined $value) {
        $!type = $value;
    }
    return $!type;
}
# method name            {
#   my $self = shift;
#   my $d    = self->{name};
#   self->{name} = shift if @_;
#   $d;
# }

method seq_id($value?){
   my $d    = $.ref;
   $.ref = $value if $value;
   $d;
}

# method start    {
#   my $self = shift;
#   my $d = self->{start};
#   self->{start} = shift if @_;
#   if (my $rs = self->{refseq}) {
#     my $strand = $rs->strand || 1;
#     return $strand >= 0 ? ($d - $rs->start + 1) : ($rs->end - $d + 1);
#   } else {
#     return $d;
#   }
# }
# method end    {
#   my $self = shift;
#   my $d = self->{stop};
#   self->{stop} = shift if @_;
#   if (my $rs = self->{refseq}) {
#     my $strand = $rs->strand || 1;
#     return $strand >= 0 ? ($d - $rs->start + 1) : ($rs->end - $d + 1);
#   }
#   $d;
# }
method strand($value?) {
   my $d = $!strand;
   $!strand = $value if $value;
#   if (my $rs = self->{refseq}) {
   if (my $rs = self.refseq) {       
       my $rstrand = $rs.strand;
       return  0 unless $d;
       return  1 if $rstrand == $d;
       return -1 if $rstrand != $d;
   }
   $d;
}

# # this does nothing, but it is here for compatibility reasons
# method absolute {
#   my $self = shift;
#   my $d = self->{absolute};
#   self->{absolute} = shift if @_;
#   $d;
# }

# method abs_start {
#   my $self = shift;
#   local self->{refseq} = undef;
#   self->start(@_);
# }
# method abs_end {
#   my $self = shift;
#   local self->{refseq} = undef;
#   self->end(@_);
# }
# method abs_strand {
#   my $self = shift;
#   local self->{refseq} = undef;
#   self->strand(@_);
# }

# method length {
#   my $self = shift;
#   return self->end - self->start + 1;
# }

# #is_circular is needed for Bio::PrimarySeqI
# method is_circular {
#   my $self = shift;
#   my $d = self->{is_circular};
#   self->{is_circular} = shift if @_;
#   $d;
# }

method seq() {
    my $seq = defined $!seq ?? $!seq !! '';
    return $seq;
}

method dna {
  my $seq = self.seq;
  #assume that seq could be a Str or an object. No test for this yet
  #$seq    = $seq.seq if CORE::ref($seq);
  return $seq;
}


method display_name() { self.name }

#todo want an easlier way to redispatch
method display_id() { self.name};    



method accession_number {
    return 'unknown';
}




method alphabet {
    return 'dna'; # no way this will be anything other than dna!
}



# method desc {
#   my $self = shift;
#   my $d    = self->notes;
#   self->{desc} = shift if @_;
#   $d;
# }

# method attributes {
#   my $self = shift;
#   if (@_) {
#     return self->each_tag_value(@_);
#   } else {
#     return self->{attributes} ? %{$self->{attributes}} : ();
#   }
# }

# method primary_id {
#   my $self = shift;
#   my $d = self->{primary_id};
#   self->{primary_id} = shift if @_;
#   return $d;
# #  return $d if defined $d;
# #  return (overload::StrVal($self) =~ /0x([a-f0-9]+)/)[0];
# }

# method notes {
#     my $self  = shift;
#     my $notes = self->{desc};
#     return $notes if defined $notes;
#     return self->attributes('Note');
# }

# method aliases {
#     my $self  = shift;
#     return self->attributes('Alias');
# }

# method low {
#   my $self = shift;
#   return self->start < self->end ? self->start : self->end;
# }

# method high {
#   my $self = shift;
#   return self->start > self->end ? self->start : self->end;
# }



# method location {
#    my $self = shift;
#    require Bio::Location::Split unless Bio::Location::Split->can('new');
#    my $location;
#    if (my @segments = self->segments) {
#        $location = Bio::Location::Split->new();
#        foreach (@segments) {
# 	 $location->add_sub_Location($_);
#        }
#    } else {
#        $location = self;
#    }
#    $location;
# }

# method each_Location {
#   my $self = shift;
#   require Bio::Location::Simple unless Bio::Location::Simple->can('new');
#   if (my @segments = self->segments) {
#     return map {
# 	Bio::Location::Simple->new(-start  => $_->start,
# 				   -end    => $_->end,
# 				   -strand => $_->strand);
#       } @segments;
#   } else {
#     return Bio::Location::Simple->new(-start  => self->start,
# 				      -end    => self->end,
# 				      -strand => self->strand);
#   }
# }


# method location_string {
#   my $self = shift;
#   my @segments = self->segments or return self->to_FTstring;
#   join ',',map {$_->to_FTstring} @segments;
# }

# method coordinate_policy {
#    require Bio::Location::WidestCoordPolicy unless Bio::Location::WidestCoordPolicy->can('new');
#    return Bio::Location::WidestCoordPolicy->new();
# }

# method min_start { shift->low }
# method max_start { shift->low }
# method min_end   { shift->high }
# method max_end   { shift->high}
    
method start_pos_type() { 'EXACT' }
method end_pos_type()   { 'EXACT' }

# method to_FTstring {
#   my $self = shift;
#   my $low  = self->min_start;
#   my $high = self->max_end;
#   my $strand = self->strand;
#   my $str = defined $strand && $strand<0 ? "complement($low..$high)" : "$low..$high";
#   if (my $id = self->seq_id()) {
#     $str = $id . ":" . $str;
#   }
#   $str;
# }

method phase($value?) {
    my $d    = $!phase;
    $!phase = $value if $value;
    $d;
}

method class($value?) {
   my $d = $!class;
   $!class = $value if $value;
   return defined($d) ?? $d !! 'Sequence';
}

# # set GFF dumping version
# method version {
#   my $self = shift;
#   my $d    = self->{gff3_version} || 2;
#   self->{gff3_version} = shift if @_;
#   $d;
# }

# method gff_string {
#   my $self    = shift;
  
#   if (self->version == 3) {
#     return self->gff3_string(@_);
#   }
  
#   my $recurse = shift;
#   my $name  = self->name;
#   my $class = self->class;
#   my $group = "$class $name" if $name;
#   my $strand = ('-','.','+')[self->strand+1];
#   my $string;
#   $string .= join("\t",
# 		  self->ref||'.',self->source||'.',self->method||'.',
# 		  self->start||'.',self->stop||'.',
# 		  defined(self->score) ? self->score : '.',
# 		  $strand||'.',
# 		  defined(self->phase) ? self->phase : '.',
# 		  $group||''
# 		 );
#   $string .= "\n";
#   if ($recurse) {
#     foreach (self->sub_SeqFeature) {
#       $string .= $_->gff_string($recurse);
#     }
#   }
#   $string;
# }

# # Suggested strategy for dealing with the multiple parentage issue.
# # First recurse through object tree and record parent tree.
# # Then recurse again, skipping objects we've seen before.
# method gff3_string {
#     my ($self,$recurse,$parent_tree,$seenit,$force_id) = @_;
#     $parent_tree ||= {};
#     $seenit      ||= {};
#     my @rsf      =   ();
#     my @parent_ids;

#     if ($recurse) {
# 	self->_traverse($parent_tree) unless %$parent_tree;  # this will record parents of all children
# 	my $primary_id = defined $force_id ? $force_id : self->_real_or_dummy_id;

# 	return if $seenit->{$primary_id}++;

# 	@rsf = self->get_SeqFeatures;
# 	if (@rsf) {
# 	    # Detect case in which we have a split location feature. In this case we 
# 	    # skip to the grandchildren and trick them into thinking that our parent is theirs.
# 	    my %types = map {$_->primary_tag=>1} @rsf;
# 	    my @types = keys %types;
# 	    if (@types == 1 && $types[0] eq self->primary_tag) {
# 		return join ("\n",map {$_->gff3_string(1,$parent_tree,{},$primary_id)} @rsf);
# 	    }
# 	}

# 	@parent_ids = keys %{$parent_tree->{$primary_id}};
#     }

#     my $group      = self->format_attributes(\@parent_ids,$force_id);
#     my $name       = self->name;

#     my $class = self->class;
#     my $strand = ('-','.','+')[self->strand+1];
#     my $p = join("\t",
# 		 self->seq_id||'.',
# 		 self->source||'.',
# 		 self->method||'.',
# 		 self->start||'.',
# 		 self->stop||'.',
# 		 defined(self->score) ? self->score : '.',
# 		 $strand||'.',
# 		 defined(self->phase) ? self->phase : '.',
# 		 $group||'');
#     return join("\n",
# 		$p,
# 		map {$_->gff3_string(1,$parent_tree,$seenit)} @rsf);
# }

# method _real_or_dummy_id {
#     my $self = shift;
#     my $id   = self->primary_id;
#     return $id if defined $id;
#     return return (overload::StrVal($self) =~ /0x([a-f0-9]+)/)[0];
# }

# method _traverse {
#     my $self   = shift;
#     my $tree   = shift;  # tree => {$child}{$parent} = 1
#     my $parent = shift;
#     my $id     = self->_real_or_dummy_id;
#     defined $id or return;
#     $tree->{$id}{$parent->_real_or_dummy_id}++ if $parent;
#     $_->_traverse($tree,$self) foreach self->get_SeqFeatures;
# }

method db { return }

method source_tag($value?) {
    if ( defined $value) {
        self.source = $value;
    }
    return self.source;
}

# This probably should be deleted.  Not sure why it's here, but might
# have been added for Ace::Sequence::Feature-compliance.
# method introns {
#   my $self = shift;
#   return;
# }

# method has_tag { exists shift->{attributes}{shift()} }

# method escape {
#   my self     = shift;
#   my $toencode = shift;
#   $toencode    =~ s/([^a-zA-Z0-9_.:?^*\(\)\[\]@!+-])/uc sprintf("%%%02x",ord($1))/eg;
#   $toencode;
# }

# method all_tags {
#   my $self = shift;
#   return keys %{$self->{attributes}};
# }

# method add_tag_value {
#   my $self = shift;
#   my ($tag_name,@tag_values) = @_;
#   push @{$self->{attributes}{$tag_name}},@tag_values;
# }

# method remove_tag {
#   my $self = shift;
#   my $tag_name = shift;
#   delete $self->{attributes}{$tag_name};
# }

# method each_tag_value {
#   my $self = shift;
#   my $tag  = shift;
#   my $value = $self->{attributes}{$tag} or return;
#   my $ref = CORE::ref $value;
#   return $ref && $ref eq 'ARRAY' ? @{$self->{attributes}{$tag}}
#                                  : $self->{attributes}{$tag};
# }

# method get_Annotations {
#   my $self = shift;
#   my $tag  = shift;
#   my @values = self->get_tag_values($tag);
#   return $values[0] if @values == 1;
#   return @values;
# }

# method format_attributes {
#   my $self        = shift;
#   my $parent      = shift;
#   my $fallback_id = shift;

#   my @tags = self->all_tags;
#   my @result;
#   for my $t (@tags) {
#     my @values = self->each_tag_value($t);
#     push @result,join '=',self->escape($t),join(',', map {self->escape($_)} @values) if @values;
#   }
#   my $id        = self->escape(self->_real_or_dummy_id) || $fallback_id;

#   my $parent_id;
#   if (@$parent) {
#       $parent_id  = join (',',map {self->escape($_)} @$parent);
#   }

#   my $name = self->display_name;
#   unshift @result,"ID=".$id                                    if defined $id;
#   unshift @result,"Parent=".$parent_id                         if defined $parent_id;
#   unshift @result,"Name=".self->escape($name)                 if defined $name;
#   return join ';',@result;
# }


# method clone {
#   my $self  = shift;
#   my %clone  = %$self;
#   # overwrite attributes
#   my $clone = bless \%clone,CORE::ref($self);
#   $clone{attributes} = {};
#   for my $k (keys %{$self->{attributes}}) {
#     @{$clone{attributes}{$k}} = @{$self->{attributes}{$k}};
#   }
#   return $clone;
# }



# method refseq {
#   my $self = shift;
#   my $d    = self->{refseq};
#   if (@_) {
#     my $newref = shift;
#     $self->throw("attempt to set refseq using a feature that does not share the same seq_id")
#       unless $newref->seq_id eq $self->seq_id;
#     self->{refseq} = $newref;
#   }
#   return $d;
# }



}




# =head1 NAME

# Bio::SeqFeature::Lite - Lightweight Bio::SeqFeatureI class

# =head1 SYNOPSIS

#  # create a simple feature with no internal structure
#  $f = Bio::SeqFeature::Lite->new(-start => 1000,
#                                   -stop  => 2000,
#                                   -type  => 'transcript',
#                                   -name  => 'alpha-1 antitrypsin',
# 				  -desc  => 'an enzyme inhibitor',
#                                  );

#  # create a feature composed of multiple segments, all of type "similarity"
#  $f = Bio::SeqFeature::Lite->new(-segments => [[1000,1100],[1500,1550],[1800,2000]],
#                                   -name     => 'ABC-3',
#                                   -type     => 'gapped_alignment',
#                                   -subtype  => 'similarity');

#  # build up a gene exon by exon
#  $e1 = Bio::SeqFeature::Lite->new(-start=>1,-stop=>100,-type=>'exon');
#  $e2 = Bio::SeqFeature::Lite->new(-start=>150,-stop=>200,-type=>'exon');
#  $e3 = Bio::SeqFeature::Lite->new(-start=>300,-stop=>500,-type=>'exon');
#  $f  = Bio::SeqFeature::Lite->new(-segments=>[$e1,$e2,$e3],-type=>'gene');

# =head1 DESCRIPTION

# This is a simple Bio::SeqFeatureI-compliant object that is compatible
# with Bio::Graphics::Panel.  With it you can create lightweight feature
# objects for drawing.

# All methods are as described in L<Bio::SeqFeatureI> with the following additions:

# =head2 The new() Constructor

#  $feature = Bio::SeqFeature::Lite->new(@args);

# This method creates a new feature object.  You can create a simple
# feature that contains no subfeatures, or a hierarchically nested object.

# Arguments are as follows:

#   -seq_id      the reference sequence
#   -start       the start position of the feature
#   -end         the stop position of the feature
#   -stop        an alias for end
#   -name        the feature name (returned by seqname())
#   -type        the feature type (returned by primary_tag())
#   -primary_tag the same as -type
#   -source      the source tag
#   -score       the feature score (for GFF compatibility)
#   -desc        a description of the feature
#   -segments    a list of subfeatures (see below)
#   -subtype     the type to use when creating subfeatures
#   -strand      the strand of the feature (one of -1, 0 or +1)
#   -phase       the phase of the feature (0..2)
#   -seq         a dna or protein sequence string to attach to feature
#   -id          an alias for -name
#   -seqname     an alias for -name
#   -display_id  an alias for -name
#   -display_name an alias for -name  (do you get the idea the API has changed?)
#   -primary_id  unique database ID
#   -url         a URL to link to when rendered with Bio::Graphics
#   -attributes  a hashref of tag value attributes, in which the key is the tag
#                and the value is an array reference of values
#   -factory     a reference to a feature factory, used for compatibility with
#                more obscure parts of Bio::DB::GFF

# The subfeatures passed in -segments may be an array of
# Bio::SeqFeature::Lite objects, or an array of [$start,$stop]
# pairs. Each pair should be a two-element array reference.  In the
# latter case, the feature type passed in -subtype will be used when
# creating the subfeatures.

# If no feature type is passed, then it defaults to "feature".

# =head2 Non-SeqFeatureI methods

# A number of new methods are provided for compatibility with
# Ace::Sequence, which has a slightly different API from SeqFeatureI:

# =over 4

# =item url()

# Get/set the URL that the graphical rendering of this feature will link to.

# =item add_segment(@segments)

# Add one or more segments (a subfeature).  Segments can either be
# Feature objects, or [start,stop] arrays, as in the -segments argument
# to new().  The feature endpoints are automatically adjusted.

# =item segments()

# An alias for sub_SeqFeature().

# =item get_SeqFeatures()

# Alias for sub_SeqFeature()

# =item get_all_SeqFeatures()

# Alias for sub_SeqFeature()

# =item merged_segments()

# Another alias for sub_SeqFeature().

# =item stop()

# An alias for end().

# =item name()

# An alias for seqname().

# =item exons()

# An alias for sub_SeqFeature() (you don't want to know why!)

# =back

# =cut


# __END__

# =head1 SEE ALSO

# L<Bio::Graphics::Feature> 

# =head1 AUTHOR

# Lincoln Stein E<lt>lstein@cshl.eduE<gt>.

# Copyright (c) 2006 Cold Spring Harbor Laboratory

# This library is free software; you can redistribute it and/or modify
# it under the same terms as Perl itself.  See DISCLAIMER.txt for
# disclaimers of warranty.

# =cut


# =head2 display_name

#  Title   : display_name
#  Usage   : $id = $obj->display_name or $obj->display_name($newid);
#  Function: Gets or sets the display id, also known as the common name of
#            the Seq object.

#            The semantics of this is that it is the most likely string
#            to be used as an identifier of the sequence, and likely to
#            have "human" readability.  The id is equivalent to the LOCUS
#            field of the GenBank/EMBL databanks and the ID field of the
#            Swissprot/sptrembl database. In fasta format, the >(\S+) is
#            presumed to be the id, though some people overload the id
#            to embed other information. Bioperl does not use any
#            embedded information in the ID field, and people are
#            encouraged to use other mechanisms (accession field for
#            example, or extending the sequence object) to solve this.

#            Notice that $seq->id() maps to this function, mainly for
#            legacy/convenience issues.
#  Returns : A string
#  Args    : None or a new id



# =head2 accession_number

#  Title   : accession_number
#  Usage   : $unique_biological_key = $obj->accession_number;
#  Function: Returns the unique biological id for a sequence, commonly
#            called the accession_number. For sequences from established
#            databases, the implementors should try to use the correct
#            accession number. Notice that primary_id() provides the
#            unique id for the implemetation, allowing multiple objects
#            to have the same accession number in a particular implementation.

#            For sequences with no accession number, this method should return
#            "unknown".
#  Returns : A string
#  Args    : None


# =cut


# =head2 alphabet

#  Title   : alphabet
#  Usage   : if( $obj->alphabet eq 'dna' ) { /Do Something/ }
#  Function: Returns the type of sequence being one of
#            'dna', 'rna' or 'protein'. This is case sensitive.

#            This is not called <type> because this would cause
#            upgrade problems from the 0.5 and earlier Seq objects.

#  Returns : a string either 'dna','rna','protein'. NB - the object must
#            make a call of the type - if there is no type specified it
#            has to guess.
#  Args    : none
#  Status  : Virtual


# =cut


# =head2 desc

#  Title   : desc
#  Usage   : $seqobj->desc($string) or $seqobj->desc()
#  Function: Sets or gets the description of the sequence
#  Example :
#  Returns : The description
#  Args    : The description or none


# =cut


# =head2 location

#  Title   : location
#  Usage   : my $location = $seqfeature->location()
#  Function: returns a location object suitable for identifying location
# 	   of feature on sequence or parent feature
#  Returns : Bio::LocationI object
#  Args    : none

# =cut

# =head2 location_string

#  Title   : location_string
#  Usage   : my $string = $seqfeature->location_string()
#  Function: Returns a location string in a format recognized by gbrowse
#  Returns : a string
#  Args    : none

# This is a convenience function used by the generic genome browser. It
# returns the location of the feature and its subfeatures in the compact
# form "start1..end1,start2..end2,...".  Use
# $seqfeature-E<gt>location()-E<gt>toFTString() to obtain a standard
# GenBank/EMBL location representation.

# =cut


# =head2 clone

#  Title   : clone
#  Usage   : my $feature = $seqfeature->clone
#  Function: Create a deep copy of the feature
#  Returns : A copy of the feature
#  Args    : none

# =cut

# =head2 refseq

#  Title   : refseq
#  Usage   : $ref = $s->refseq([$newseq] [,$newseqclass])
#  Function: get/set reference sequence
#  Returns : current reference sequence
#  Args    : new reference sequence and class (optional)
#  Status  : Public

# This method will get or set the reference sequence.  Called with no
# arguments, it returns the current reference sequence.  Called with any
# Bio::SeqFeatureI object that provides the seq_id(), start(), end() and
# strand() methods.

# The method will generate an exception if you attempt to set the
# reference sequence to a sequence that has a different seq_id from the
# current feature.

# =cut
