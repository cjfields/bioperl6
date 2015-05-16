use v6;

use Bio::Role::Describable;
use Bio::Role::Identifiable;
use Bio::Role::PrimarySeq;

class Bio::PrimarySeq  does Bio::Role::Describable does Bio::Role::Identifiable does Bio::Role::PrimarySeq { }
