use v6;

use lib './lib';

use Test;

# TODO: these should probably become enums
subset SeqAlphabet of Str where .lc ~~ any <dna rna protein>;
subset SeqStrandInt of Int where any < -1 0 1 >;
subset SeqStrandChar of Str where any < - . + >;
subset SeqStrand where any(SeqStrandChar, SeqStrandInt);

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

done-testing();
