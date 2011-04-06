use Bio::AnnotationI;
class Bio::Annotation::StructuredValue is Bio::AnnotationI {
# =head2 new

#  Title   : new
#  Usage   : my $sv = Bio::Annotation::StructuredValue.new();
#  Function: Instantiate a new StructuredValue object
#  Returns : Bio::Annotation::StructuredValue object
#  Args    : -value => $value to initialize the object data field [optional]
#            -tagname => $tag to initialize the tagname [optional]

# =cut

# method new{
#    my ($class,@args) = @_;

#    my $self = $class.SUPER::new(@args);
   
#    my ($value,$tag) = $self._rearrange([qw(VALUE TAGNAME)], @args);
#    $self.{'values'} = [];
#    defined $value  && $self.value($value);
#    defined $tag    && $self.tagname($tag);

#    return $self;
# }



# =head2 hash_tree

#  Title   : hash_tree
#  Usage   : my $hashtree = $value.hash_tree
#  Function: For supporting the AnnotationI interface just returns the value
#            as a hashref with the key 'value' pointing to the value
#  Returns : hashrf
#  Args    : none


# =cut

method hash_tree(){
   my %h;
   %h{'value'} = self.value;
   return %h;
}

# =head2 tagname

#  Title   : tagname
#  Usage   : $obj.tagname($newval)
#  Function: Get/set the tagname for this annotation value.

#            Setting this is optional. If set, it obviates the need to provide
#            a tag to AnnotationCollection when adding this object.
#  Example :
#  Returns : value of tagname (a scalar)
#  Args    : new value (a scalar, optional)


# =cut


has $!tagname is rw;
method tagname($value?) {
    return $!tagname = $value if defined $value;
    return $!tagname;
}


# =head1 Specific accessors for StructuredValue

# =cut

# =head2 value

#  Title   : value
#  Usage   : $obj.value($newval)
#  Function: Get/set the value for this annotation.

#            Set mode is here only to retain compatibility with
#            SimpleValue. It is equivalent to calling
#            add_value([0], $newval).

#            In get mode, this implementation allows to pass additional
#            parameters that control how the structured annotation
#            components will be joined together to form a
#            string. Recognized are presently
#                -joins     a reference to an array of join strings, the
#                           elements at index i applying to joining
#                           annotations at dimension i. The last element
#                           will be re-used for dimensions higher than i.
#                           Defaults to ['; '].
#                -brackets  a reference to an array of two strings
#                           denoting the opening and closing brackets for
#                           the elements of one dimension, if there is
#                           more than one element in the dimension.
#                           Defaults to ['(',')'].

#  Returns : value of value
#  Args    : newvalue (optional)


# =cut

has @values is rw;
method value($value?,*@args is copy, :$joins is copy,:$brackets is copy) {

    # set mode?
    return self.add_value([0], $value) if defined($value) && (@args.elems == 0);
    # no, get mode
    # determine joins and brackets

    #no idea why we want this unshift.... - takadonet
    
     unshift(@args, $value);
     $joins = ['; '] unless $joins;
     $brackets = ['(', ')'] unless $brackets;
    
    my $txt = self!to_text( @!values,$joins, $brackets);

    # if there's only brackets at the start and end, remove them
     if ( (@!values.elems == 1) &&
         ($brackets.[0].chars == 1) && ($brackets.[1].chars == 1)
     ) {
         #have done no test to ensure this works below
 # 	my $re = '\\'.$brackets.[0].
 # 	    '([^\\'.$brackets.[1].']*)\\'.$brackets.[1];
         my $re = rx{^ '\\' ~ $brackets.[0] ~
                         '(<[^\\' ~ $brackets.[1] ~ ']>*)\\'
                         ~ $brackets.[1] $};
                    
  	$txt ~~ s/^$re$/$0/;

      }
    return $txt;
}

#was a class fcn, changed to object for now
method !to_text(@arr,$joins,$brackets,$rec_n? is copy) {

     $rec_n = 0 unless defined($rec_n);
    
    my $i = $rec_n >= @($joins).elems ?? @($joins).elems -1 !! $rec_n;

    my $txt = join($joins.[$i],
		   map {
		       $_ ~~ Array ??
			   ($_ ~~ Array ??
			        self!to_text(@($_), $joins, $brackets, $rec_n+1 ) !!
			        $_.value() ) !!
			   $_;
		   } , @arr );
     
    if ($rec_n && (@arr > 1)) {
	$txt = $brackets.[0] ~ $txt ~ $brackets.[1];
    }
     
    return $txt;
}

# =head2 get_values

#  Title   : get_values
#  Usage   :
#  Function: Get the top-level array of values. Each of the elements will
#            recursively be a reference to an array or a scalar, depending
#            on the depth of this structured value annotation.
#  Example :
#  Returns : an array
#  Args    : none


# =cut

method get_values(){
    return @!values;
}

# =head2 get_all_values

#  Title   : get_all_values
#  Usage   :
#  Function: Flattens all values in this structured annotation and
#            returns them as an array.
#  Example :
#  Returns : the (flat) array of values
#  Args    : none


# =cut

method get_all_values(){
    # we code lazy here and just take advantage of value()
    my $txt = self.value(joins => ['@!@'], brackets => ['','']);
    return $txt.split('@!@');
}

# =head2 add_value

#  Title   : add_value
#  Usage   :
#  Function: Adds the given value to the structured annotation at the
#            given index.

#            The index is multi-dimensional, with the first dimension
#            applying to the first level, and so forth. If a particular
#            dimension or a particular index does not exist yet, it will
#            be created. If it does exist and adding the value would
#            mean replacing a scalar with an array reference, we throw
#            an exception to prevent unintended damage. An index of -1
#            at any dimension means append.

#            If an array of values is to be added, it will create an
#            additional dimension at the index specified, unless the
#            last index value is -1, in which case they will all be
#            appended to the last dimension.

#  Example :
#  Returns : none
#  Args    : the index at which to add (a reference to an array)
#            the value(s) to add


# =cut

method add_value(@index,*@values) {
    #binding reference
    my @tree := @!values;
    my $lastidx = pop(@index);
    for (@index) -> $i {
	if ($i < 0) {
	    my @subtree = @values;
            #making an array to array
	    push @tree, [@subtree];
            
            #binding reference here
	    @tree := @subtree;
	} elsif ((! @tree[$i]) || (@tree[$i] ~~ Array )) {
	    @tree[$i] = [] unless @tree[$i] ~~ Array;
	    @tree = @tree[$i];
	} else {
	 #   $self->throw("element $i is a scalar but not in last dimension");
	}
    }
        
    if ($lastidx < 0) {
	push @tree, @values;
    } elsif (@values < 2) {
	@tree[$lastidx] = shift(@values);
    } else {
	@tree[$lastidx] = [@values];
    }


    return;
}

}

# $Id: StructuredValue.pm 14708 2008-06-10 00:08:17Z heikki $
#
# BioPerl module for Bio::Annotation::StructuredValue
#
# Cared for by Hilmar Lapp <hlapp at gmx.net>
#
# (c) Hilmar Lapp, hlapp at gmx.net, 2002.
# (c) GNF, Genomics Institute of the Novartis Research Foundation, 2002.
#
# You may distribute this module under the same terms as perl itself.
# Refer to the Perl Artistic License (see the license accompanying this
# software package, or see http://www.perl.com/language/misc/Artistic.html)
# for the terms under which you may use, modify, and redistribute this module.
#
# THIS PACKAGE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED
# WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF
# MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
#
# POD documentation - main docs before the code

# =head1 NAME

# Bio::Annotation::StructuredValue - A scalar with embedded structured
# information

# =head1 SYNOPSIS

#    use Bio::Annotation::StructuredValue;
#    use Bio::Annotation::Collection;

#    my $col = Bio::Annotation::Collection.new();
#    my $sv = Bio::Annotation::StructuredValue.new(-value => 'someval');
#    $col.add_Annotation('tagname', $sv);

# =head1 DESCRIPTION

# Scalar value annotation object.

# =head1 FEEDBACK

# =head2 Mailing Lists

# User feedback is an integral part of the evolution of this and other
# Bioperl modules. Send your comments and suggestions preferably to one
# of the Bioperl mailing lists. Your participation is much appreciated.

#   bioperl-l@bioperl.org                  - General discussion
#   http://bioperl.org/wiki/Mailing_lists  - About the mailing lists

# =head2 Reporting Bugs

# Report bugs to the Bioperl bug tracking system to help us keep track
# the bugs and their resolution.  Bug reports can be submitted via
# or the web:

#   http://bugzilla.open-bio.org/

# =head1 AUTHOR - Hilmar Lapp

# Email hlapp-at-gmx.net

# =head1 APPENDIX

# The rest of the documentation details each of the object methods. Internal methods are usually preceded with a _

# =cut




