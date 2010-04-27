#stupid RT bug # 74078 Need to create new reference to see builtin functions
our &shiftt = &shift;
our &op = &open;
our &s = &say;
use Bio::Grammar::Fasta;
use Bio::Grammar::Actions::Fasta;
role Bio::Role::FastaIO[$file]{

has @!results;
has Int $!width=80;
has $!fh;

method next_seq() {
  #rakudo bug, cannot use builtin functions in roles RT #74078
  return &shiftt(@!results);
}

#method will not be private and/or put in new buildmethod
method initial_read() {    
 	@!results = @(Bio::Grammar::Fasta.parsefile($file, :actions(Bio::Grammar::Actions::Fasta)).ast);	
}

method initial_write() {    
 	#rakudo bug RT #74078
 	#need error checking to ensure that we did indeed open a new file
 	$!fh = &op($file,:w);
}

method write_seq(*@seq){
 
 for @seq -> $seq {
   #need to ensure we have Bio::PrimarySeqI
   
   #most raw way to print out fasta files with no options whatsoever
   my $header = ">$seq.display_id() $seq.description()";

   #no variable interploation yet! 
   #my $sequence = $seq.seq().comb( /. ** {1..$width}/).join("\n");

   my $sequence = $seq.seq().comb( /. ** 1..80/).join("\n");
   $!fh.say($header ~ "\n" ~ $sequence);   
   
 }
 
}

}
