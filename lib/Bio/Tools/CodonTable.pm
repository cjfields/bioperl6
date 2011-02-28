class Bio::Tools::CodonTable {

## Object preamble - inherits from Bio::Root::Root
#use Bio::Tools::IUPAC;
#use Bio::SeqUtils;
#
#use base qw(Bio::Root::Root);

# first set internal values for all translation tables

# has Str $.gap is rw where {$_.chars == 1} = '-';

# has Str $.terminator is rw where {$_.chars == 1} = '*';

#constant NYI    
has Int $.CODONSIZE = 3 ;

has $.id is rw = 1;

# thinking these could go into a simple basic data class
#constant NYI    
has @!NAMES = (
    'Standard',        #1
    'Vertebrate Mitochondrial',#2
    'Yeast Mitochondrial',# 3
    'Mold, Protozoan, and CoelenterateMitochondrial and Mycoplasma/Spiroplasma',#4
    'Invertebrate Mitochondrial',#5
    'Ciliate, Dasycladacean and Hexamita Nuclear',# 6
    '', '',
    'Echinoderm Mitochondrial',#9
    'Euplotid Nuclear',#10
    '"Bacterial"',# 11
    'Alternative Yeast Nuclear',# 12
    'Ascidian Mitochondrial',# 13
    'Flatworm Mitochondrial',# 14
    'Blepharisma Nuclear',# 15
    'Chlorophycean Mitochondrial',# 16
    '', '',  '', '',
    'Trematode Mitochondrial',# 21
    'Scenedesmus obliquus Mitochondrial', #22
    'Thraustochytrium Mitochondrial'  #23
);

has @!TABLES = <
    FFLLSSSSYY**CC*WLLLLPPPPHHQQRRRRIIIMTTTTNNKKSSRRVVVVAAAADDEEGGGG
    FFLLSSSSYY**CCWWLLLLPPPPHHQQRRRRIIMMTTTTNNKKSS**VVVVAAAADDEEGGGG
    FFLLSSSSYY**CCWWTTTTPPPPHHQQRRRRIIMMTTTTNNKKSSRRVVVVAAAADDEEGGGG
    FFLLSSSSYY**CCWWLLLLPPPPHHQQRRRRIIIMTTTTNNKKSSRRVVVVAAAADDEEGGGG
    FFLLSSSSYY**CCWWLLLLPPPPHHQQRRRRIIMMTTTTNNKKSSSSVVVVAAAADDEEGGGG
    FFLLSSSSYYQQCC*WLLLLPPPPHHQQRRRRIIIMTTTTNNKKSSRRVVVVAAAADDEEGGGG
    '' ''
    FFLLSSSSYY**CCWWLLLLPPPPHHQQRRRRIIIMTTTTNNNKSSSSVVVVAAAADDEEGGGG
    FFLLSSSSYY**CCCWLLLLPPPPHHQQRRRRIIIMTTTTNNKKSSRRVVVVAAAADDEEGGGG
    FFLLSSSSYY**CC*WLLLLPPPPHHQQRRRRIIIMTTTTNNKKSSRRVVVVAAAADDEEGGGG
    FFLLSSSSYY**CC*WLLLSPPPPHHQQRRRRIIIMTTTTNNKKSSRRVVVVAAAADDEEGGGG
    FFLLSSSSYY**CCWWLLLLPPPPHHQQRRRRIIMMTTTTNNKKSSGGVVVVAAAADDEEGGGG
    FFLLSSSSYYY*CCWWLLLLPPPPHHQQRRRRIIIMTTTTNNNKSSSSVVVVAAAADDEEGGGG
    FFLLSSSSYY*QCC*WLLLLPPPPHHQQRRRRIIIMTTTTNNKKSSRRVVVVAAAADDEEGGGG
    FFLLSSSSYY*LCC*WLLLLPPPPHHQQRRRRIIIMTTTTNNKKSSRRVVVVAAAADDEEGGGG
    '' '' '' ''
    FFLLSSSSYY**CCWWLLLLPPPPHHQQRRRRIIMMTTTTNNNKSSSSVVVVAAAADDEEGGGG   
    FFLLSS*SYY*LCC*WLLLLPPPPHHQQRRRRIIIMTTTTNNKKSSRRVVVVAAAADDEEGGGG
    FF*LSSSSYY**CC*WLLLLPPPPHHQQRRRRIIIMTTTTNNKKSSRRVVVVAAAADDEEGGGG
>;

has @!STARTS = <
    ---M---------------M---------------M----------------------------
    --------------------------------MMMM---------------M------------
    ----------------------------------MM----------------------------
    --MM---------------M------------MMMM---------------M------------
    ---M----------------------------MMMM---------------M------------
    -----------------------------------M----------------------------
    '' ''
    -----------------------------------M----------------------------
    -----------------------------------M----------------------------
    ---M---------------M------------MMMM---------------M------------
    -------------------M---------------M----------------------------
    -----------------------------------M----------------------------
    -----------------------------------M----------------------------
    -----------------------------------M----------------------------
    -----------------------------------M----------------------------
    '' ''  '' ''
    -----------------------------------M---------------M------------  
    -----------------------------------M----------------------------
    --------------------------------M--M---------------M------------
>;



#has CODONS => (
#    is => 'ro',
#    isa => 'HashRef'
#);
#
#has TRCOL  => (
#    is => 'ro',    
#    isa => 'HashRef'
#);



#sub BUILD {
#    my @nucs = qw(t c a g);
#    my $x = 0;
#    my $codons;
#    my $trcol;
#    for my $i (@nucs) {
#        for my $j (@nucs) {
#            for my $k (@nucs) {
#                my $codon = "$i$j$k";
#                $codons->{$codon} = $x;
#                $trcol->{$x} = $codon;
#                $x++;
#            }
#        }
#    }
#    CODONS($codons);
#    TRCOL($trcol);
#}

method name() {
    #missing one since array starts at zero
    my ($id) = self.id - 1;
    return @!NAMES[$id];
}
    
multi method translate(*@params) {
    return 'NYI';
}

method revtranslate(*@params){
    return 'NYI';
}

method is_start_codon($value) {
    return 'NYI';
}

method is_ter_codon($value) {
    return 'NYI';
}


method is_unknown_codon($value) {
    return 'NYI';
}

method translate_strict($value) {
    return 'NYI';
}

method add_table(*@params) {
    return 'NYI';
}

method reverse_translate_all(*@params) {
    return 'NYI';
}


#
#BEGIN { 
#    #%IUPAC_DNA = Bio::Tools::IUPAC->iupac_iub();    
#    #%IUPAC_AA = Bio::Tools::IUPAC->iupac_iup();
#    #%THREELETTERSYMBOLS = Bio::SeqUtils->valid_aa(2);
#    #$VALID_PROTEIN = '['.join('',Bio::SeqUtils->valid_aa(0)).']';
#}
#
    
}
