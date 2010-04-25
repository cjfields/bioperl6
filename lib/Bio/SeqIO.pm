class Bio::SeqIO;

has $!format;

method new(Str $format,Str $file){
	my Junction $formats = any ('fasta'|'genbank');
	
	my $obj;
	
	#could maybe use a junction in the future but simple for now
	if lc($format) eq 'fasta' {
		use Bio::Role::FastaIO;
		$obj = self.bless(*,:$format) does Bio::Role::FastaIO[$file];
		$obj.initial();
	}
	else {
		self.throw_not_implemented("Cannot accept $format yet");
	}
	
	return $obj;	
}

method next_seq() {
     self.throw_not_implemented("Method not implemented");
}

