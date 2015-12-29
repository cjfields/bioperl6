use v6;

use lib './lib';
use Test;

use Bio::Annotation::DBLink;

my $link1 = Bio::Annotation::DBLink.new(database => 'TSC',
                                         primary-id => 'TSC0000030',
                                        );
does-ok($link1, Bio::Role::Annotation);
does-ok($link1, Bio::Role::Identifiable);

is $link1.database, 'TSC';
is $link1.primary-id, 'TSC0000030';
is ~$link1, 'Direct database link to TSC0000030 in database TSC';

done-testing();
