use v6;

use Bio::Role::Range;

role Bio::Role::Location does Bio::Role::Range;

has Int $.start-offset          is rw = 0;
has Int $.end-offset            is rw = 0;
has $.seqid                     is rw;

# use enum here
has $.type                      is rw = 'EXACT';

method max-start { self.start + $!start-offset }
method min-start { self.start  }
method max-end { self.end + $!end-offset }
method min-end { self.end }

# use enum here?
#method start-pos-type { ... }
#method end-pos-type { ... }
#
## return Bool
method is-valid returns Bool { ?( self.start.defined && self.end.defined ) }
method is-remote returns Bool { ?($!seqid.defined) }
#method is-fuzzy { ... }

# stringification?
#multi method WHICH { ... }
