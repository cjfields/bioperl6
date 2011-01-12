use v6;

BEGIN {
    @*INC.push('./lib');
}

use Test;

use Bio::Role::Describe;

class Desc does Bio::Role::Describe {  };

my $s = Desc.new(display_name => <ABCD1234>,
                 description => 'Hello, my name is Mr. Ed');

is($s.display_name, 'ABCD1234', 'test display_name');
is($s.description, 'Hello, my name is Mr. Ed', 'test description');

$s.display_name = 'WXYZ4567';
$s.description = 'Goodbye, Mr. Bond';

is($s.display_name, 'WXYZ4567');

# testing aliases out
is($s.description, 'Goodbye, Mr. Bond');

#is($s.desc, 'Goodbye, Mr. Bond');  # TODO: aliases don't work yet
#$s.desc     = 'Frankly, my dear...'; # TODO: set via alias
#is($s.description, 'Frankly, my dear...');

done();
