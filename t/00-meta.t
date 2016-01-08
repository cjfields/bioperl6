use v6;
use lib 'lib';
use Test;
constant AUTHOR = ?%*ENV<TEST_AUTHOR>;

if AUTHOR {
    require Test::META <&meta-ok>;
    plan 1;
    meta-ok;
    done-testing;
}
