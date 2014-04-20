use v6;

class Fasta::Grammar::Actions {
    method Str() {
        return ~self.WHAT;
    }
    method record($/) {
        say $/;
    }
};
