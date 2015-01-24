use v6;

use lib './lib';

=begin NOTE

A bit on Bio::Annotation: this is a demo case that shows an Annotation class can
be ported easily. The question now is: should it?

=end NOTE

use Test;

use Bio::Annotation::SimpleValue;

#simple value
my $simple = Bio::Annotation::SimpleValue.new(tag-name => 'colour',
					       value   => '1');

ok($simple ~~ Bio::Role::Annotatable);
is ~$simple, 'Value: 1';
is $simple.value, 1;
is $simple.tag-name, 'colour';
ok($simple.tag-term ~~ Any);
is $simple.hash-tree.{'value'},1;
$simple.value = 0;
is $simple.value, 0;
is ~$simple, 'Value: 0';

done();
