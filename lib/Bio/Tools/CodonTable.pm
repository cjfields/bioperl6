class Bio::Tools::CodonTable {

## Object preamble - inherits from Bio::Root::Root
#use Bio::Tools::IUPAC;
#use Bio::SeqUtils;
#
#use base qw(Bio::Root::Root);

# first set internal values for all translation tables

# has Str $.gap is rw where {$_.chars == 1} = '-';
has Str $.gap = '-';
    
#has Str $.terminator is rw where { $_.chars == 1 } = '*';
has Str $.terminator is rw = '*';    

#has $.CODONGAP = $GAP x CODONSIZE;
has $.CODONGAP is rw = '---';
#constant NYI    
has Int $.CODONSIZE = 3 ;

has $.id is rw = 1;

has %.codons is ro;
has %.trcol is ro;


has %!IUB = ( 'A' => [< A >],
              'C' => [< C >],
              'G' => [< G >],
              'T' => [< T >],
              'U' => [< U >],
              'M' => [<A C>],
              'R' => [<A G>],
              'W' => [<A T>],
              'S' => [<C G>],
              'Y' => [<C T>],
              'K' => [<G T>],
              'V' => [<A C G>],
              'H' => [<A C T>],
              'D' => [<A G T>],
              'B' => [<C G T>],
              'X' => [<G A T C>],
              'N' => [<G A T C>]
          );


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
multi method new(Int :$id = 1) {
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
    
    my $obj= self.bless(*, id => $id,codons=>%codons,trcol=>%trcol);

    return $obj;
}


method name() {
    #minus one since array starts at zero
    my ($id) = self.id - 1;
    return @!NAMES[$id];
}

method tables() {
  my %tables;
  for  1 .. @!NAMES ->  $id {
    my $name = @!NAMES[$id-1];
    %tables{$id} = $name if $name;
  }
  return %tables;
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
            elsif  %.codons.exists($triplet) {
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

method revtranslate($value is copy,$coding?){
    my ($id) = self.id;
    my (@aas,  $p);
    my (@codons) = ();

    if ($value.chars == 3 ) {
        $value = lc $value;
        $value = ucfirst $value;
        #hash comes from SeqUtil.pm crap!
#         $value = %THREELETTERSYMBOLS{$value};
     }
   # if ( defined $value and $value ~~ /$VALID_PROTEIN/ 
   #        and $value.chars == 1 ) {
   #      $value = uc $value;
   #      @aas = @{$IUPAC_AA{$value}};    
   #      foreach my $aa (@aas) {
   #          #print $aa, " -2\n";
   #          $aa = '\*' if $aa eq '*';
   #        while ($TABLES[$id-1] =~ m/$aa/g) {
   #            $p = pos $TABLES[$id-1];
   #            push (@codons, $TRCOL->{--$p});
   #        }
   #      }
   #  }

   # if ($coding and uc ($coding) eq 'RNA') {
   #     for my $i (0..$#codons)  {
   #        $codons[$i] =~ tr/t/u/;
   #     }
   # }
    
   return @codons;    
}

method is_start_codon($value is copy) {
   my $id = self.id;

   $value  = lc $value;
   $value =$value.trans('u'=>'t');

   if ( $value.chars != 3  )  {
       return 0;
   }
   else {
       my $result = 1;
       my @ms = map { substr(@!STARTS[$id-1],%.codons{$_},1) }, self!unambiquous_codons($value);
       for @ms -> $c {
           $result = 0 if $c ne 'M';
       }
       return $result;
   }    
}

method is_ter_codon($value is copy) {
    my $id = self.id;

    $value  = lc $value;
    $value  =$value.trans('u' =>'t');

    if ( $value.chars != 3  )  {
        return 0;
    }
    else {
        my $result = 1;
        my @ms = map { substr(@!TABLES[$id-1],%.codons{$_},1) }, self!unambiquous_codons($value);
        for @ms -> $c {
            $result = 0 if $c ne $.terminator;
        }
        return $result;
    }    
}


method is_unknown_codon($value is copy) {
   my $id = self.id;

   $value  = lc $value;
   $value  = $value.trans('u' => 't');

   if ( $value.chars != 3  )  {
       return 1;
   }
   else {
       my $result = 0;
       my @cs = map { substr(@!TABLES[$id-1],%.codons{$_},1) }, self!unambiquous_codons($value);
       $result = 1 if @cs.elems == 0;
       return $result;
   }    
}

method translate_strict($value is copy) {
   my ($id) = self.id;

   $value  = lc $value;
   $value  = $value.trans('u' => 't');

   if ($value.chars != 3 ) {
       return '';
   }
   elsif (!(defined %.codons{$value}))  {
       return 'X';
   }
   else {
       return substr(@!TABLES[$id-1],%.codons{$value},1);
   }    
}

method add_table($table,$name? = 'Custom' ~ @!NAMES.elems +1 ,$starts? = @!STARTS[0]) {
    #need to throw this lovely warning out... cjfields!
    # $self->throw('Suspect input!')
    #     unless length($table) == 64 and length($starts) == 64;

     push @!NAMES, $name;
     push @!TABLES, $table;
     push @!STARTS, $starts;

    return @!NAMES.elems;    
}

method reverse_translate_all(*@params) {
    return 'NYI';
}

method !translate_ambiguous_codon($triplet, $partial? = 0) {
    my $id = self.id;
    my $aa='';
    my @codons = self!unambiquous_codons($triplet);
    my %aas;
    
    for @codons -> $codon {
        %aas{substr(@!TABLES[$id-1],%.codons{$codon},1)} = 1;
    }
    my $count =  %aas.keys.elems;
    if $count == 1  {
        $aa = (%aas.keys)[0];
    }
    elsif $count == 2 {
        if (%aas{'D'} and %aas{'N'}) {
            $aa = 'B';
         }
        elsif (%aas{'E'} and %aas{'Q'}) {
            $aa = 'Z';
        } else {
            $partial ?? ($aa = '') !! ($aa = 'X');
        }
    } else {
        $partial ?? ($aa = '') !!  ($aa = 'X');
    }
    return $aa;
}


method !unambiquous_codons($value) {
    my @nts;
    my @codons;
    my ($i, $j, $k);
    @nts = map { %!IUB{uc $_}} , $value.comb();
        for @(@nts[0]) ->  $i {
            #hack for now, since @nts has Any() values. Normally in p5 code you would have undef which would not loop at all
            last if !defined $i;
            for @(@nts[1]) -> $j {
                for @(@nts[2]) -> $k {
                    @codons.push(lc "$i$j$k");
                }
            }
        }
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
