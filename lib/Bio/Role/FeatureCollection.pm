role Bio::Role::FeatureCollection;

# this role describes methods for accessing Features for a specific instance.
# implementing classes are considered to contain Bio::Role::Features of some
# type.

# Wondering if this and FeatureHolder should be combined for
# consistency. For instance, it would be nice to have binning available for
# grabbing features by location.  May be redundant for subfeatures...

# Would be nice to have iterative methods. Built-in support for Iterators and
# laziness are planned for perl6 (Iterators are to be a built-in Role):

# http://feather.perl6.nl/syn/S07.html

# Also note that having Grammars that we can attach various Actions to may
# help this quite a bit.  We'll see as the spec develops...

has Int $.min_bin;
has Int $.max_bin;

our Array of Bio::Role::Feature method get_Features
(
    :$range? of any(Range | Bio::Role::Range),  # for grabbing features in a range
    Int :$start?,
    Int :$end?,
    Int :$strand?,
    Bool :$contains?,
    Str :$strand_test?,
)
{...}

our Bool method add_Features (:@features of Bio::Role::Feature)
{...}

our Array of Bio::Role::Features remove_Features
(
    :@features? of Bio::Role::Feature,
    :$range? of any(Range | Bio::Role::Range)
)
{...}

our Int method feature_count
{...}

our Array of Bio::Role::Feature method get_all_Features
{...}

