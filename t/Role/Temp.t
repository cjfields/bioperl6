use v6;

use lib './lib';

use Test;

use Bio::Role::Temp;

use File::Temp;

ok(1);

my (@cleaned, @kept);

{
    class MyTemp does Bio::Role::Temp {
    }
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
    
    # check write
    isa_ok $tfh, 'IO::Handle';
    $tfh.print($TEST_STRING);
    $tfh.close;

    # check read
    my $IN = $tfile.IO.open(:r) orelse die "Could not read file '$tfile': $!\n";
    my $val = $IN.path.slurp;
    is $val, $TEST_STRING;
    $IN.close;
    
    ok $tfile.IO ~~ :e, 'File exists';
    @cleaned.push: $tfile;
    
    todo('Current problems with END blocks and File::Temp',1);
    ok $tfile.IO !~~ :e, "tempfile $tfile deleted";
}

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
    @cleaned.push: $tfile;
}


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
    @kept.push: $tfile;
    
}

{
    my $obj = MyTemp.new();
    
    # check suffix is applied
    my ($tfile, $tfh) = $obj.tmpfile(:suffix<.bioperl>);
    isa_ok $tfh, 'IO::Handle';
    #like $tfh, rx/\.bioperl$/, 'tempfile suffix';
    ok close $tfh;
    @cleaned.push: $tfile;
    
    ## check single return value mode of File::Temp
    #my $fh2 = $obj->tempfile;
    #isa_ok $fh2, 'GLOB';
    #ok $fh2, 'tempfile() in scalar context';
    #ok close $fh2;
    #}
}


#END {
#    for @cleaned -> $file {
#        todo('NYI; GC occurs when out of scope?', 1);
#        ok $file.IO !~~ :e, "tempfile $file deleted";
#    }
#    
#    for @kept -> $file {
#        ok $file.IO ~~ :e, 'tempfile kept';
#    }
#}

done();
