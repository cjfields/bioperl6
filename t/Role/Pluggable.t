use v6;

use lib ('./lib', 't/lib');

# note this adds the path to @*INC to check for plugins

use Test;

use Bio::Role::Pluggable;

class MyTest does Bio::Role::Pluggable['PluginDir'] {
    has %.testcase1 = 
      'MyTest::PluginDir::Plugin1'       => True,
      'MyTest::PluginDir::Plugin2'       => True,
      'MyTest::PluginDir::Plugin3'       => False,
    ;
    
    method test() {
        my @plugins = @( $.plugins() );
        
        my ($test, $count);
        $count = 0;
        for %.testcase1.keys -> $k {
            $test = False;
            for @plugins -> $p {
                $test = True, last if $p eq $k;
            }
            $count++ if True ~~ %.testcase1{$k};
            is %.testcase1{$k}, $test, "Test: $k";
        }
    }
};

ok(1);

MyTest.new.test();

done-testing();
