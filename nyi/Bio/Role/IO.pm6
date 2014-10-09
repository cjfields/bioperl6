role Bio::Role::IO[$file]{
    has @!records is rw;

method next_record(){
    shift @!records;
}

method !set_io(Bool $keep_sep? ,Str :$separator where { $separator.chars == 1 } ) {
     @!records := gather {
         #rakudo specific code, hopefully it will go away soon
         my $in = pir::open__PSS($file, 'r');
         $in.record_separator($separator);
         ###
         
         my $x = $in.readline();
        
         #if we did not find $separator at the end, then there is no record at all
         if ($x !~~ /$separator$/) {
             take '';
             return;
         }
        
         while ($x = $in.readline()) {

             #check to see if it's at the end of a record.
             if ($x !~~ /\n$separator$/) {
                 my $next;
                 #if not, readline another line till we hit the end of the record or EOF
                 repeat {
                     $next = $in.readline();
                     $x ~= $next;
                 } while $x !~~ /\n$separator$/ && $next ne ''; 
             }
            
             #remove trailing '>' and append to the beginning of the record
             $x = $x.subst(/$separator$/,'');
             #append to the beginning of the record
             $x = $separator ~ $x;
             take $x;
         }
         
     }

}

    
}
