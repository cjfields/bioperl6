use v6;

use Bio::Role::Range;

role Bio::Role::Location does Bio::Role::Range;

has Int $.start-offset          is rw = 0;
has Int $.end-offset            is rw = 0;
has $.seqid                     is rw;

# use enum here
has $.type                  is rw;

method max-start { ... }
method min-start { ... }
method max-end { ... }
method min-end { ... }

# use enum here
method start-pos-type { ... }
method end-pos-type { ... }

# return Bool
method is-valid { ... }
method is-remote { ... }
method is-fuzzy { ... }

# stringification?
#multi method WHICH { ... }
