#stupid RT bug # 74078 Need to create new reference to see builtin functions
our &shiftt = &shift;
our &op = &open;
our &s = &say;
role Bio::Role::FastaIO[$file]{

has @!results;
has $!fh;
use Bio::Grammar::Fasta;
use Bio::Grammar::Actions::Fasta;
 
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
   #no width of the sequence even!
   my $header = ">$seq.display_id() $seq.description()";
   my $sequence = $seq.seq();

   $!fh.say($header ~ "\n" ~ $seq.seq());   
   
 }
 
}

}