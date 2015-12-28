use v6;

use lib './lib';

=begin NOTE

A bit on Bio::Annotation: this is a demo case that shows an Annotation class can
be ported easily. The question now is: should it?

=end NOTE

use Test;

use Bio::Annotation::Reference;

my $ref = Bio::Annotation::Reference.new( authors  => 'author line',
                                          title    => 'title line',
                                          location => 'location line',
										  database => 'MEDLINE',
                                          start    => 12);

does-ok($ref, Bio::Role::Annotation);
does-ok($ref, Bio::Role::Range);
isa-ok($ref, Bio::Annotation::DBLink); # TODO: this may change

is $ref.authors, 'author line';
is $ref.title,  'title line';
is $ref.location, 'location line';
is $ref.start, 12;
is $ref.database, 'MEDLINE';
is ~$ref, 'Reference: title line';

done-testing();
