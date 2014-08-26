use v6;

BEGIN {
    @*INC.push('./lib');
}

=begin NOTE

A bit on Bio::Annotation: this is a demo case that shows an Annotation class can
be ported easily. The question now is: should it?

=end NOTE

use Test;

use Bio::Annotation::SimpleValue;

#simple value
my $simple = Bio::Annotation::SimpleValue.new(tagname => 'colour',
					       value   => '1',
					      );

ok($simple ~~ Bio::Role::Annotatable);
is $simple.display_text, 1;
is $simple.as_text, 'Value: 1';
is $simple.value, 1;
is $simple.tagname, 'colour';
ok($simple.tag_term ~~ Any);
is $simple.hash_tree.{'value'},1;
$simple.value = 0;
is $simple.value, 0;
is $simple.display_text, 0;

done();
