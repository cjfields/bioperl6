role Bio::Role::FastaIO[$file];

has @!results;

use Bio::Grammar::Fasta;
use Bio::Grammar::Actions::Fasta;
 
 method next_seq() {
  #rakudo bug, cannot use pop or say in roles
  #return pop @!results;
         @!results;
}

#method will not be private and/or put in new buildmethod
method initial() {    
 	@!results = @(Bio::Grammar::Fasta.parsefile($file, :actions(Bio::Grammar::Actions::Fasta)).ast);	
}