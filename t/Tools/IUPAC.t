use v6;

use lib './lib';

use Test;

eval-lives-ok 'use Bio::Tools::IUPAC', 'Can use Bio::Tools::IUPAC';
eval-lives-ok 'use Bio::PrimarySeq', 'Can use Bio::PrimarySeq';

use Bio::Tools::IUPAC;
use Bio::PrimarySeq; 

# test IUPAC

my %IUB = ( 'A' => [< A >],
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

my  %REV_IUB = ('A'	=> 'A',
                'T'	=> 'T',
                'C'	=> 'C',
                'G' 	=> 'G',
                'AC'	=> 'M',
                'AG'	=> 'R',
                'AT'	=> 'W',
                'CG'	=> 'S',
                'CT'	=> 'Y',
                'GT'	=> 'K',
                'ACG'	=> 'V',
                'ACT'	=> 'H',
                'AGT'	=> 'D',
                'CGT'	=> 'B',
                'ACGT'  => 'N',
                'N'	=> 'N'
            );


my %IUP = ('A' => [<A>],
           'B' => [<D N>],
           'C' => [<C>],
           'D' => [<D>],
           'E' => [<E>],
           'F'=> [<F>],
           'G' => [<G>],
           'H' => [<H>],
           'I' => [<I>],
           'J' => [<I L>],
           'K' => [<K>],
           'L' => [<L>],
           'M' => [<M>],
           'N' => [<N>],
           'O' => [<O>],
           'P' => [<P>],
           'Q' => [<Q>],
           'R' => [<R>],
           'S' => [<S>],
           'T' => [<T>],
           'U' => [<U>],
           'V' => [<V>],
           'W' => [<W>],
           'X' => [<X>],
           'Y' => [<Y>],
           'Z' => [<E Q>],
           '*' => ['*']
       );


my $ambiseq = Bio::PrimarySeq.new(seq => 'ARTCGTTGR',
				  alphabet => dna);

my $stream  = Bio::Tools::IUPAC.new(seq => $ambiseq);
is $stream.count(), 4;

#this is pretty useless but still test it anyway. Probably get rid of this api later
is-deeply($stream.iupac_iub(),%IUB,'Can access IUB hash from method call');
is-deeply($stream.iupac_rev_iub(),%REV_IUB,'Can access REV_IUB hash from method call');
is-deeply($stream.iupac_iup(),%IUP,'Can access IUP hash from method call');

is-deeply(%Bio::Tools::IUPAC::IUB,%IUB,'Can access IUB hash as a class variable');
is-deeply(%Bio::Tools::IUPAC::REV_IUB,%REV_IUB,'Can access REV_IUB hash as a class variable');
is-deeply(%Bio::Tools::IUPAC::IUP,%IUP,'Can access IUP hash as a class variable');

my $b = 1; 
while (my $uniqueseq = $stream.next_seq()) {
    if ( ! $uniqueseq ~~ Bio::PrimarySeq ) {
        $b = 0;
        last; # no point continuing if we get here
    }
}
ok $b;

done-testing();
