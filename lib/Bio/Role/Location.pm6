use v6;

use Bio::Role::Range;

use Bio::Type::Location;

role Bio::Role::Location does Bio::Role::Range {

    has Int $.start-offset                  is rw = 0;
    has Int $.end-offset                    is rw = 0;
    has $.seqid                             is rw;
    has Location-Pos-Type $.start-pos-type  is rw = EXACT-POS;
    has Location-Pos-Type $.end-pos-type    is rw = EXACT-POS;
    has Join-Type $.type                    is rw = EXACT;

    method max-start {
        $.start + $.start-offset
    }

    method min-start {
        $.start
    }

    method max-end {
        $.end + $.end-offset
    }

    method min-end {
        $.end
    }

    # return Bool
    method is-valid returns Bool {
        $.start.defined && $.end.defined
        and
        $.start-pos-type != AFTER
        and
        $.end-pos-type != BEFORE
    }

    method is-remote returns Bool {
        $!seqid.defined
    }

    method is-fuzzy returns Bool {
        $.type != EXACT
        or
        $.start-pos-type != EXACT-POS
        or
        $.end-pos-type != EXACT-POS
    }

}
