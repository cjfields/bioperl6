use v6;
class Bio::Location::FTLocationFactory {


method from_string() {
    # my ($self,$locstr,$op) = @_;
    # my $loc;
    
    # #$self->debug("$locstr\n");
    
    # # $op for operator (error handling)
    
    # # run on first pass only
    # # Note : These location types are now deprecated in GenBank (Oct. 2006)
    # if (!defined($op)) {
    #     # convert all (X.Y) to [X.Y]
    #     $locstr =~ s{\((\d+\.\d+)\)}{\[$1\]}g;
    #     # convert ABC123:(X..Y) to ABC123:[X..Y]
    #     # we should never see the above
    #     $locstr =~ s{:\((\d+\.{2}\d+)\)}{:\[$1\]}g;
    # }
    
    # if ($locstr =~ m{(.*?)\(($LOCREG)\)(.*)}o) { # any matching parentheses?

    #     my ($beg, $mid, $end) = ($1, $2, $3);
    #     my (@sublocs) = (split(q(,),$beg), $mid, split(q(,),$end));
        
    #     my @loc_objs;
    #     my $loc_obj;
        
    #     SUBLOCS:
    #     while (@sublocs) {
    #         my $subloc = shift @sublocs;
    #         next if !$subloc;
    #         my $oparg = ($subloc eq 'join'   || $subloc eq 'bond' ||
    #                      $subloc eq 'order'  || $subloc eq 'complement') ? $subloc : undef;
    #         # has operator, requires further work (recurse)
    #         if ($oparg) {
    #             my $sub = shift @sublocs;
    #             # simple split operators (no recursive calls needed)
    #             if (($oparg eq 'join' || $oparg eq 'order' || $oparg eq 'bond' )
    #                  && $sub !~ m{(?:join|order|bond)}) {
    #                 my @splitlocs = split(q(,), $sub);
    #                 $loc_obj = Bio::Location::Split->new(-verbose => 1,
    #                                                      -splittype => $oparg);
    #                 while (my $splitloc = shift @splitlocs) {
    #                     next unless $splitloc;
    #                     my $sobj;
    #                     if ($splitloc =~ m{\(($LOCREG)\)}) {
    #                         my $comploc = $1;
    #                         $sobj = $self->_parse_location($comploc);
    #                         $sobj->strand(-1);
    #                     } else {
    #                         $sobj = $self->_parse_location($splitloc);
    #                     }
    #                     $loc_obj->add_sub_Location($sobj);
    #                 }
    #             } else {
    #                 $loc_obj = $self->from_string($sub, $oparg);
    #                 # reinsure the operator is set correctly for this level
    #                 # unless it is complement
    #                 $loc_obj->splittype($oparg) unless $oparg eq 'complement';
    #             }
    #         }
    #         # no operator, simple or fuzzy 
    #         else {
    #             $loc_obj = $self->from_string($subloc,1);
    #         }
    #         $loc_obj->strand(-1) if ($op && $op eq 'complement');
    #         push @loc_objs, $loc_obj;
    #     }
    #     my $ct = @loc_objs;
    #     if ($op && !($op eq 'join' || $op eq 'order' || $op eq 'bond')
    #             && $ct > 1 ) {
    #         $self->throw("Bad operator $op: had multiple locations ".
    #                      scalar(@loc_objs).", should be SplitLocationI");
    #     }
    #     if ($ct > 1) {
    #         $loc = Bio::Location::Split->new();
    #         $loc->add_sub_Location(shift @loc_objs) while (@loc_objs);
    #         return $loc;
    #     } else {
    #         $loc = shift @loc_objs;
    #         return $loc;
    #     }
    # } else { # simple location(s)
    #     $loc = $self->_parse_location($locstr);
    #     $loc->strand(-1) if ($op && $op eq 'complement');
    # }
    # return $loc;
}



method _parse_location() {
    # my ($self, $locstr) = @_;
    # my ($loc, $seqid);
    # #$self->debug( "Location parse, processing $locstr\n");
    # # 'remote' location?
    # if($locstr =~ m{^(\S+):(.*)$}o) {
    #     # yes; memorize remote ID and strip from location string
    #     $seqid = $1;
    #     $locstr = $2;
    # }
    
    # # split into start and end
    # my ($start, $end) = split(/\.\./, $locstr);
    # # remove enclosing parentheses if any; note that because of parentheses
    # # possibly surrounding the entire location the parentheses around start
    # # and/or may be asymmetrical
    # # Note: these are from X.Y fuzzy locations, which are deprecated!
    # $start =~ s/(?:^\[+|\]+$)//g if $start;
    # $end   =~ s/(?:^\[+|\]+$)//g if $end;

    # # Is this a simple (exact) or a fuzzy location? Simples have exact start
    # # and end, or is between two adjacent bases. Everything else is fuzzy.
    # my $loctype = ".."; # exact with start and end as default

    # $loctype = '?' if ( ($locstr =~ /\?/) && ($locstr !~ /\?\d+/) );

    # my $locclass = "Bio::Location::Simple";
    # if(! defined($end)) {
    #     if($locstr =~ /(\d+)([\.\^])(\d+)/) {
    #         $start = $1;
    #         $end = $3;
    #         $loctype = $2;
    #         $locclass = "Bio::Location::Fuzzy"
    #           unless (abs($end-$start) <= 1) && ($loctype eq "^");
    #     } else {
    #         $end = $start;
    #     }
    # }
    # # start_num and end_num are for the numeric only versions of 
    # # start and end so they can be compared
    # # in a few lines
    # my ($start_num, $end_num) = ($start,$end);
    # if ( ($start =~ /[\>\<\?\.\^]/) || ($end   =~ /[\>\<\?\.\^]/) ) {
    #     $locclass = 'Bio::Location::Fuzzy';
    #     if($start =~ /(\d+)/) {
    #         ($start_num) = $1;
    #     } else { 
    #         $start_num = 0
    #     }
    #     if ($end =~ /(\d+)/) {
    #         ($end_num)   = $1;
    #     } else { $end_num = 0 }
    # } 
    # my $strand = 1;

    # if( $start_num > $end_num && $loctype ne '?') {
    #     ($start,$end,$strand) = ($end,$start,-1);
    # }
    # # instantiate location and initialize
    # $loc = $locclass->new(-verbose => $self->verbose,
    #                              -start   => $start, 
    #                              -end     => $end, 
    #                              -strand  => $strand, 
    #                              -location_type => $loctype);
    # # set remote ID if remote location
    # if($seqid) {
    #     $loc->is_remote(1);
    #     $loc->seq_id($seqid);
    # }

    # # done (hopefully)
    # return $loc;
}


    
}
