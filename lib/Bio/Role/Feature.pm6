role Bio::Role::Feature;

# This is a generic role that describes and manipulates a specific region or
# segment that can be mapped to a start/end (and possibly strand) within another
# instance. In most cases the other instance will be a sequence, but it can also
# be used to describe a section in an alignment (such as a consensus structure),
# etc. If properly abused it could possibly be made to describe portions of a
# tree, where start and end denote start/end nodes.

# Modules using this role may or may not also be a FeatureHolder, and that
# these methods should not rely on that Role being implemented (or should at
# least take the above into consideration and DTRT)

# display_name() could come in from Bio::Role::Describe, which also brings in
# description()

# Tags may or may not be mapped to a Bio::Role::AnnotationCollection (TBD)s
# we could implement it so that Bio::Role::AnnotationCollection does everything
# lazily; if you add a tag, the simple tag value is added (and not a heavier
# Bio::Role::Annotation) whereas if you add a Bio::Role::Annotation it is used
# instead.

qw(
    display_name
    primary_tag
    source_tag
    score
    has_tag
    add_tag_values
    get_tag_values
    get_tagset_values
    get_all_tags
    remove_tag

    splice
    attach_instance
    get_trunc_instance
    entire_instance
    instance_id
    
    location
    primary_id
    set_attributes
);

# seq-specific, should delegate to the generic method, which just curries
# trunc() (or whatever method name we intend on using for getting a slice of an
# object)

# the call to trunc() should allow for optional recursive calls to contained
# objects

# subrole-specific attributes should be mappable to the tag system above (such
# as frame() below), primarily so that persisting the data is done in a
# consistent way, using the most generic Role vs the most specific one

# seq-specific

qw(
    spliced_Seq
    get_Seq
    attach_Seq
    entire_Seq
    frame
);

# alignment-specific

qw(
    spliced_Aln
    get_Aln
    attach_Aln
    entire_Aln
);

# Tree-specific

qw(
    spliced_Tree
    get_Tree
    attach_Tree
    entire_Tree
);
