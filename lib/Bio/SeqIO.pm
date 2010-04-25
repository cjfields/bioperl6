class Bio::SeqIO;

has $!format;

method new(Str $format,Str $file,:$write?){
	my Junction $formats = any ('fasta'|'genbank');
	
	my $obj;
	
	#could maybe use a junction in the future but simple for now
	if lc($format) eq 'fasta' {
		use Bio::Role::FastaIO;
		$obj = self.bless(*,:$format) does Bio::Role::FastaIO[$file];
		
		#should not have to do this......
		if $write {
			$obj.initial_write();
		}
		else {
			$obj.initial_read();
		}
	}
	else {
		#need to use Bio::Root::Root
		say ("Cannot accept $format yet");
	}
	
	return $obj;	
}


