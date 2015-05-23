role Bio::Role::RichSeq {
    # wondering if this should be simplified (see comments) and merged with
    # Bio::Role::Seq...

    has Str $.division              is rw;
    has Str $.molecule              is rw;  # this is pretty close to moltype, which is deprecated...

    # the next two may be removed based on input
    has Str $.pid                   is rw;  # is this the same as .primary_id? (Bio::Role::Identify)
    has Str $.seq_version           is rw;  # is this the same as .version?    (Bio::Role::Identify)

    # These grab the (stringified) data from the annotation collection using the
    # corresponding type (the tag name). They're really convenience methods for
    # add_Annotation('foo', @foo) and get_Annotations('foo'), so we can probably
    # decide whether or not it's necessary to even have a RichSeq role as anything
    # more than a convenience

    # TODO: typed arrays/hashes are not implemented in rakudo

    our Bool method add_secondary_accessions (
	Str :$type = 'secondary_accession', Str *@accession
    )
    {...}
    our Array of Str method get_secondary_accessions (
	Str :$type = 'secondary_accession'
    )
    {...}

    our Bool method add_dates (
	Str :$type = 'date_changed', Str *@dates
    )
    {...}
    our Array of Str method get_dates (
	Str :$type = 'date_changed', Str :$date
    )
    {...}

    our Bool method add_keywords (
	Str :$type = 'keyword', *@keywords,
    )
    {...}
    our Array of Str method get_keywords (
	Str :$type = 'keyword', Str :$keyword
    )
    {...}
}
