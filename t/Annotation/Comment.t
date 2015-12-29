use v6;

use lib './lib';
use Test;

use Bio::Annotation::Comment;

my $comment = Bio::Annotation::Comment.new( text => 'sometext');
does-ok($comment, Bio::Role::Annotation);
is $comment.text, 'sometext';
is ~$comment, 'Comment: sometext';

done-testing();
