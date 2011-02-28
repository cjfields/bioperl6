class Bio::Tools::CodonTable {

## Object preamble - inherits from Bio::Root::Root
#use Bio::Tools::IUPAC;
#use Bio::SeqUtils;
#
#use base qw(Bio::Root::Root);

# first set internal values for all translation tables

# has Str $.gap is rw where {$_.chars == 1} = '-';

# has Str $.terminator is rw where {$_.chars == 1} = '*';

#has $.CODONGAP = $GAP x CODONSIZE;
has $.CODONGAP is rw = '---';
#constant NYI    
has Int $.CODONSIZE = 3 ;

has $.id is rw = 1;

has %.codons is ro;
has %.trcol is ro;


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




#default where table id is 1
multi method new() {
    my @nucs = <t c a g>;
    my $x = 0;
    my %codons;
    my %trcol;
    
    for @nucs -> $i {
        for @nucs -> $j {
            for @nucs -> $k {
                my $codon = "$i$j$k";
                %codons{$codon} = $x;
                %trcol{$x} = $codon;
                $x++;
            }
        }
    }
    
    my $obj= self.bless(*, id => 1,codons=>%codons,trcol=>%trcol);

    return $obj;
}

method name() {
    #minus one since array starts at zero
    my ($id) = self.id - 1;
    return @!NAMES[$id];
}
    
multi method translate($seq is copy) {
    #    my ($self, $seq) = @_;
    #    $self->throw("Calling translate without a seq argument!") unless defined $seq;
    return '' unless $seq;

    my $id = self.id;
    my ($partial) = 0;
    $partial = 2 if $seq.chars() % $.CODONSIZE == 2;
    
    $seq = lc $seq;
    $seq = $seq.trans('u' => 't');
    
    my $protein = "";
    if $seq ~~ /<-[actg]>/  { #ambiguous chars
        loop (my $i = 0; $i < ($seq.chars - ($.CODONSIZE -1)); $i+=$.CODONSIZE) {
            my $triplet = substr($seq, $i, $.CODONSIZE);
            if $triplet eq $.CODONGAP {
                $protein ~= $.gap;
            }
            if  %.codons.exists($triplet) {
                $protein ~= substr(@!TABLES[$id-1], %.codons{$triplet}, 1);
            } else {
                $protein ~= self!translate_ambiguous_codon($triplet);                
            }        
        }
        
    } else { # simple, strict translation
        loop (my $i = 0; $i < ($seq.chars - ($.CODONSIZE -1)); $i+=$.CODONSIZE) {
            my $triplet = substr($seq, $i, $.CODONSIZE); 
            if $triplet eq $.CODONGAP {
                $protein ~= $.gap;
            }
            if  %.codons.exists($triplet) {
                $protein ~= substr(@!TABLES[$id-1], %.codons{$triplet}, 1);
            } else {
                $protein ~= 'X';
            }
        }
    }

    if $partial == 2 { # 2 overhanging nucleotides
        my $triplet = substr($seq, ($partial -4)) ~ "n";
        if $triplet eq $.CODONGAP {
            $protein ~= $.gap;
        }
        if  %.codons.exists($triplet) {
            $protein ~= substr(@!TABLES[$id-1], %.codons{$triplet}, 1);
        } else {
            $protein ~= self!translate_ambiguous_codon($triplet,$partial);                
        }                
    }

    return $protein;
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

method !translate_ambiguous_codon($triplet, $partial? = 0) {
    # my ($self, $triplet, $partial) = @_;
    # $partial ||= 0;
    my $id = self.id;
    my $aa='';
    my @codons = self!unambiquous_codons($triplet);
    my %aas;
    # foreach my $codon (@codons) {
    #     $aas{substr($TABLES[$id-1],$CODONS->{$codon},1)} = 1;
    # }
    # my $count = scalar keys %aas;
    # if ( $count == 1 ) {
    #     $aa = (keys %aas)[0];
    # }
    # elsif ( $count == 2 ) {
    #     if ($aas{'D'} and $aas{'N'}) {
    #         $aa = 'B';
    #     }
    #     elsif ($aas{'E'} and $aas{'Q'}) {
    #         $aa = 'Z';
    #     } else {
    #         $partial ? ($aa = '') : ($aa = 'X');
    #     }
    # } else {
    #     $partial ? ($aa = '') :  ($aa = 'X');
    # }
    return $aa;
}


method !unambiquous_codons($value) {
    # my ($value) = @_;
    my @nts;
    my @codons;
    my ($i, $j, $k);
    # @nts = map { $IUPAC_DNA{uc $_} }  split(//, $value);
    # for my $i (@{$nts[0]}) {
    #     for my $j (@{$nts[1]}) {
    #         for my $k (@{$nts[2]}) {
    #     	push @codons, lc "$i$j$k";
    #         }
    #     }
    # }
    return @codons;
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
