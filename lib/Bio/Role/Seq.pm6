role Bio::Role::Seq;

# should Bio::Seq::RichSeq methods be folded in here?  Makes some sense, but
# we can always add those specific for that interface to a new role...

has Bio::Role::Species $.species            is rw;
has Bio::Role::PrimarySeq $.primary_seq     is rw;
