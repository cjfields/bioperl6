use v6;

use lib './lib';

use Test;

use Bio::Role::Temp;

ok(1);

{
    class MyTemp does Bio::Role::Temp {}
}

##################
#   tmpfile
##################

my ($tfh,$tfile);

{
    ok my $obj = MyTemp.new();
    
    isa_ok $obj, 'MyTemp';
    
    ok $obj ~~ Bio::Role::Temp;
    
    my $TEST_STRING = "Bioperl rocks!\n";
    ($tfile, $tfh) = $obj.tmpfile();
    isa_ok $tfh, 'IO::Handle';
    $tfh.print($TEST_STRING);
    $tfh.close;
    my $IN = $tfile.IO.open(:r) orelse die "Could not read file '$tfile': $!\n";
    my $val = $IN.slurp;
    is $val, $TEST_STRING;
    $IN.close;
    ok $tfile.IO ~~ :e;
    
    $obj = Nil;
    say $obj.perl;
}

todo('NYI; GC occurs when out of scope?', 1);
nok $tfile.IO ~~ :e , 'auto UNLINK => 1';

##################
#   tmpdir
##################

{
    my $obj = MyTemp.new();
    
    my $tdir = $obj.tmpdir(CLEANUP=>1);
    ok $tdir.IO ~~ :d;
    ($tfile, $tfh) = $obj.tmpfile(:dir<$tdir>);
    $tfh.close;
    ok $tfile.IO ~~ :e;
    $obj = Nil; # see Bio::Root::IO::_io_cleanup
}

todo('NYI; GC occurs when out of scope?', 1);
ok $tfile.IO !~~ :e, 'tempfile deleted';

##################
#   tmpfile
#   Unlink = 0
##################

{
    my $obj = MyTemp.new();
    ($tfile, $tfh) = $obj.tmpfile(:!unlink);
    isa_ok $tfh, 'IO::Handle';
    $tfh.close;
    ok $tfile.IO ~~ :e, ':e' ;
    $obj = Nil; 
    
    ok $tfile.IO ~~ :e, 'UNLINK => 0';
    
    ok $tfile.IO.unlink == 1, 'Unlink file manually' ;
}

{
    my $obj = MyTemp.new();
    
    # check suffix is applied
    my ($tfile, $tfh) = $obj.tmpfile(SUFFIX => '.bioperl');
    isa_ok $tfh, 'IO::Handle';
    #like $tfh, rx/\.bioperl$/, 'tempfile suffix';
    ok close $tfh
    
    ## check single return value mode of File::Temp
    #my $fh2 = $obj->tempfile;
    #isa_ok $fh2, 'GLOB';
    #ok $fh2, 'tempfile() in scalar context';
    #ok close $fh2;
    #}
}

done();