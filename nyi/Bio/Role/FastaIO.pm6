use Bio::Grammar::Fasta;
use Bio::Grammar::Actions::Fasta;
use Bio::Role::IO;

role Bio::Role::FastaIO[$file] does Bio::Role::IO[$file]{

has Int $!width=80;
has $!fh;

method next_seq() {
  my $record= self.next_record();
  if (defined $record) {
      return Bio::Grammar::Fasta.parse($record, :actions(Bio::Grammar::Actions::Fasta)).ast;
  }
  return Any;
}


method initial_write() {    
 	#need error checking to ensure that we did indeed open a new file

	if $file.WHAT ~~ IO {
 		$!fh = $file;
	}
	else {
		$!fh = open($file,:w);
	}
}

method write_seq(*@seq){
 
 for @seq -> $seq {
   #need to ensure we have Bio::PrimarySeqI
   
   #most raw way to print out fasta files with no options whatsoever
   my $header = ">$seq.display_id() $seq.description()";

   my $sequence = $seq.seq().comb( /. ** {1..$!width}/).join("\n");
   
   $!fh.say($header ~ "\n" ~ $sequence);   
   
 }
 
}

}
