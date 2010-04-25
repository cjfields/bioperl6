use v6;
use Bio::PrimarySeq;

class Bio::Grammar::Actions::Fasta {
	method TOP($/){
		#lazy list implementation
		#reason 'for' loops are NOT lazy yet!
		my @matches = gather for $/<fasta> -> $m {
			take $m.ast;
		};

		make @matches;		
	}
	
	method fasta($/){
		
		my $id =$/<description_line>.ast<id>;
		my $desc = $/<description_line>.ast<description>;
		#very basic, does the bare bones for now
		make Bio::PrimarySeq.new(display_id=>$id,description=>$desc,seq=>$/<sequence>.ast);
	}
	
	method description_line($/){
		make $/;
	}
	
	method sequence($/){
		#turning $/ into a string form of itself
		#reason is that subset cannot work directly onto Regex::match
		make (~$/).subst("\n", '', :g);
		#another way to write it and not sure which way is faster 
		#make $/.trans(/\n/ =>  '');
	}
	
	method id($/) {
		make $/;
	}
	
	method description($/){
		make $/;
	}
	
}
