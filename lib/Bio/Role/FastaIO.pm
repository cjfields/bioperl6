#stupid RT bug # 74078 Need to create new reference to see builtin functions
our &shiftt = &shift;
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
multi method initial() {    
 	@!results = @(Bio::Grammar::Fasta.parsefile($file, :actions(Bio::Grammar::Actions::Fasta)).ast);	
}

}