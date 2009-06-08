role Bio::Role::Describe;

# these are the primary data available that are similar to the BioPerl
# Bio::DescribableI interface.

has Str $.display_name              is rw;
has Str $.description               is rw;

