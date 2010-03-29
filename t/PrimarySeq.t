use v6;

BEGIN {
    @*INC.push('./lib');
}

use Test;

use Bio::PrimarySeq;

my $seq = Bio::PrimarySeq.new(
					 seq            => 'TTGGTGGCGTCAACT',
			       display_id       => 'new-id',
			       alphabet         => 'dna',
			       accession_number => 'X677667',
			       description             => 'Sample Bio::Seq object');

ok($seq.isa(Bio::PrimarySeq), 'Object is a Bio::PrimarySeq');

ok($seq.^does(Bio::Role::Describe),'Object has Bio::Role::Describe');
ok($seq.^does(Bio::Role::Identify),'Object has Bio::Role::Identify');
is($seq.accession_number(), 'X677667','Object has correct accession_number');
is($seq.seq(), 'TTGGTGGCGTCAACT','Object has correct seq');
is($seq.display_id(), 'new-id','Object has correct display_id');
is($seq.alphabet(), 'dna','Object has correct alphabet');

#I think it's a bug in rakudo where undef is not assigned to attribute with a type
#is($seq.is_circular(), undef,'is_circular has not been set');

$seq.is_circular = True;
is($seq.is_circular,True,'is_circular has been set to true');
is(($seq.is_circular = False), False,'is_circular has been set to false');

# make sure all methods are implemented
is(($seq.authority = "bioperl.org"), "bioperl.org",'authority is implemented');
is(($seq.namespace = "t"), "t",'namespace is implemented');
is(($seq.version = 0), 0,'version is implemented');
is($seq.lsid_string(), "bioperl.org:t:X677667",'lsid_string construct id correctly');
is($seq.namespace_string(), "t:X677667.0",'namespace_string construct string correctly');
is($seq.description, 'Sample Bio::Seq object','description is implemented');

#display_name method given by perl6 cannot override
#need to discuss with folks at #perl6
is($seq.display_name(), "new-id",'display_name is implemented');

done_testing;