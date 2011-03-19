use v6;
use Bio::Role::Location;

role Bio::Role::Location::Split does Bio::Role::Location {

has @!subLocations;
has $.splittype is rw = 'JOIN';

method add_sub_Location(*@locations){
    for @locations -> $loc {
        if ($loc !~~ Bio::Role::Location ) {
            #old bioperl5 msg
	    #self.throw("Trying to add $loc as a sub Location but it doesn't implement Bio::LocationI!");
	    next;
	}
        push @!subLocations,$loc;
    }
    return @!subLocations.elems;
}

method each_Location(Int $order = 0){
    my @locs;
    for self.sub_Location($order) -> $subloc {
	# Recursively check to get hierarchical split locations:
	push @locs, $subloc.each_Location($order);
    }
    return @locs;    
}

method sub_Location(Int $order = 0) {
    #not sure if we really need...
    $order = 1 if ($order > 1);
    $order = -1 if ($order < -1);
    ####
    
    my @sublocs = defined @!subLocations ?? @!subLocations !! ();

    
    # return the array if no ordering requested
    return @sublocs if ( ($order == 0) || !(defined @sublocs) );
    	
    # sort those locations that are on the same sequence as the top (`master')
    # if the top seq is undefined, we take the first defined in a sublocation
    my $seqid = self.seq_id();
    my $i = 0;
    while ((! defined($seqid)) && ($i <= @sublocs.end)) {
        $seqid = @sublocs[$i++].seq_id();
    }
    
    if ((! self.seq_id()) && defined($seqid)) {
        #probably want to keep this
    #     	$self->warn("sorted sublocation array requested but ".
    #     			"root location doesn't define seq_id ".
    #     			"(at least one sublocation does!)");
    }
    
    my @locs = ($seqid ??
         	grep { $_.seq_id() eq $seqid; } , @sublocs !!
         	@sublocs);

    
    
    if (@locs) {
        	if ($order == 1) {
                    # Schwartzian transforms for performance boost	  
                    @locs = map { $_.[0] } ,
         		sort {
                            (defined $^a && defined $^b) ?? $^a.[1] <=> $^b.[1] !!
                                $^a  ??  -1  !! 1
                            } , map { [$_, (defined $_.start ?? $_.start !! $_.end)] } , @locs;
        	} else { # $order == -1

                    @locs = map { $_.[0] } ,
         		sort { 
         			(defined $^a && defined $^b) ?? $^b.[1] <=> $^a.[1] !!
         			$^a                         ?? -1                  !! 1
                            } , map { [$_, (defined $_.end ?? $_.end !! $_.start)] } ,@locs;
        	}
    }
    
    # push the rest unsorted
    if ($seqid) {
        	push(@locs, grep { $_.seq_id() ne $seqid; } ,@sublocs);
    }
    # done!

    return @locs;
}


method to_FTstring(){
    my @strs;
    my $strand = self.strand() || 0;
    my $stype = lc(self.splittype());
    my $guide = self.guide_strand();
    
    if ( $strand < 0 ) {
        self.flip_strand; # this will recursively set the strand
        # to +1 for all the sub locations
    }
    
    # If the split type is join, the order is important;
    # otherwise must be 5'->3' regardless
	
    my @locs = ($stype eq 'join' && (!$guide && $strand == -1)) ??
        reverse self.sub_Location() !! self.sub_Location() ;
    
    for ( @locs ) ->  $loc {
#        $loc.verbose(self.verbose);
        my $str = $loc.to_FTstring();
        # we only append the remote seq_id if it hasn't been done already
        # by the sub-location (which it should if it knows it's remote)
        # (and of course only if it's necessary)
        if ( (! $loc.is_remote) &&
                defined(self.seq_id) && defined($loc.seq_id) &&
                    ($loc.seq_id ne self.seq_id) ) {
            $str = sprintf("%s:%s", $loc.seq_id, $str);
        } 
        push @strs, $str;
    }
    self.flip_strand if $strand < 0;
    my $str;
    if ( @strs == 1 ) {
        ($str) = @strs;
    } elsif ( @strs == 0 ) {
        #		self.warn("no Sublocations for this splitloc, so not returning anything\n");
    } else {
        $str = sprintf('%s(%s)',lc(self.splittype), join(",", @strs));
    }
    if ( $strand < 0 ) {  # wrap this in a complement if it was unrolled
        $str = sprintf('%s(%s)','complement',$str);
    }

    return $str;
}

#bioperl5 version had these values return by coord policy but that is over design
#going to need a faster way to determine start other then resorting every time
multi method start(){
    my @locs = self.sub_Location(1);
    return @locs[0].min_start() if @locs; 
    return;    
}

multi method end(){
    # reverse sort locations by largest ending to smallest ending
    my @locs = self.sub_Location(-1);
    return @locs[0].max_end() if @locs; 
    return;
}
###


method min_start() {
    my @locs = self.sub_Location(1);
    return @locs[0].min_start() if @locs; 
    return;    
}

method max_start() {
    my @locs = self.sub_Location(1);
    return @locs[0].max_start() if @locs; 
    return;        
}

method max_end() {
    # reverse sort locations by largest ending to smallest ending
    my @locs = self.sub_Location(-1);
    return @locs[0].max_end() if @locs; 
    return;
}

method min_end() {
    # reverse sort locations by largest ending to smallest ending
    my @locs = self.sub_Location(-1);
    return @locs[0].min_end() if @locs; 
    return;    
}

method flip_strand() {
    for ( self.sub_Location(0) ) -> $loc {
        $loc.flip_strand();
        if ($loc ~~ Bio::Role::Location::Split) {
            my $gs = (self.guide_strand == -1) ?? Mu !! -1;
            $loc.guide_strand($gs);
        }
    }
}

method guide_strand($value?) {
	return self.strand = $value if defined($value);
	return self.strand;
}

multi method strand($value) {
    if ( defined $value) {
        self.strand = $value;
        # propagate to all sublocs
        for (self.sub_Location(0)) -> $loc {
            $loc.strand($value);
        }
    }
    else {
        my ($strand, $lstrand);
        for (self.sub_Location(0)) -> $loc {
            # we give up upon any location that's remote or doesn't have
            # the strand specified, or has a differing one set than 
            # previously seen.
            # calling strand() is potentially expensive if the subloc is also
            # a split location, so we cache it
            $lstrand = $loc.strand();
            if ((! $lstrand) ||
                   ($strand && ($strand != $lstrand)) ||
                       $loc.is_remote()) {
                $strand = Mu;
                last;
            } elsif (! $strand) {
                $strand = $lstrand;
            }
        }
        return $strand;
    }
    
}



}
