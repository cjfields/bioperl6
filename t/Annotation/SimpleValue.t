use v6;

use lib './lib';

=begin NOTE

A bit on Bio::Annotation: this is a demo case that shows an Annotation class can
be ported easily. The question now is: should it?

=end NOTE

use Test;

use Bio::Role::Annotation;

{
	class TestAnnotation does Bio::Role::Annotation {

		has $.foo is rw;
		has $.bar is rw;

		method Str() {
			return self.foo ~ ':' ~ self.bar
		}

		method hash-tree() {
			return 'No hash tree here'
		}
	}
}

my $obj = TestAnnotation.new(:foo<Hi>, :bar<There>);

does-ok( $obj, Bio::Role::Annotation);

is( ~$obj, 'Hi:There', 'Stringifies as expected');
is( $obj.hash-tree, 'No hash tree here', 'hash-tree');

use Bio::Annotation::SimpleValue;

#simple value
my $simple = Bio::Annotation::SimpleValue.new(tag-name => 'colour',
					       value   => '1');

does-ok($simple, Bio::Role::Annotation);
is ~$simple, 'Value: 1';
is $simple.value, 1;
is $simple.tag-name, 'colour';
ok($simple.tag-term ~~ Any);
is $simple.hash-tree.{'value'},1;
$simple.value = 0;
is $simple.value, 0;
is ~$simple, 'Value: 0';


done-testing();
