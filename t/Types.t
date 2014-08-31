use v6;

use lib './lib';

use Test;

# TODO: these should probably become enums
subset SeqAlphabet where .lc ~~ any <dna rna protein>;
subset SeqStrandInt where any <-1 0 1>;
subset SeqStrandChar where any <- . +>;
subset SeqStrand where { $_ ~~ SeqStrandChar || $_ ~~ SeqStrandInt};

for -2..2 -> $a {
    if -1 <= $a <= 1 {
        ok($a  ~~ SeqStrandInt, "$a isa SeqStrandInt");
        ok($a  !~~ SeqStrandChar, "$a not a SeqStrandChar");
        ok($a  ~~ SeqStrand, "$a isa SeqStrand");
    } else {
        ok($a  !~~ SeqStrand, "$a is not a SeqStrand");
    }
}

for <! - . + z> -> $a {
    if $a eq any <. + -> {
        ok($a  ~~ SeqStrandChar, "$a isa SeqStrandChar");
        ok($a  !~~ SeqStrandInt, "$a not a SeqStrandInt");
        ok($a  ~~ SeqStrand, "$a isa SeqStrand");
    } else {
        ok($a !~~ SeqStrand, "$a is not a SeqStrand");
    }
}

ok('dna'      ~~ SeqAlphabet, 'some alphabet tests');
ok('DNA'      ~~ SeqAlphabet);
ok('rna'      ~~ SeqAlphabet);
ok('protein'  ~~ SeqAlphabet);
ok('foo'     !~~ SeqAlphabet);

done();
