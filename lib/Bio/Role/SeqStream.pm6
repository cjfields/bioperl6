use v6;

use Bio::Role::IO;

role Bio::Role::SeqStream does Bio::Role::IO;

method next-Seq { ... }

method write-Seq { ... }

