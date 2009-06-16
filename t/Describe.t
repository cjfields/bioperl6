use v6;

use Test;
use Bio::Describe;

plan 4;

class Desc does Bio::Describe {  };

my $s = Desc.new(display_id => <ABCD1234>,
                 description => 'Hello, my name is Mr. Ed');

is($s.display_id, 'ABCD1234');
is($s.description, 'Hello, my name is Mr. Ed');

$s.display_id = 'WXYZ4567';
$s.description = 'Goodbye, Mr. Bond';

is($s.display_id, 'WXYZ4567');
is($s.description, 'Goodbye, Mr. Bond');
