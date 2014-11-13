use v6;

enum Location-Join-Symbol <. .. ^>;

# this could probably be made a trait on start/end
enum Location-Pos-Symbol < < > . ? ..>;
enum Location-Pos-Type < EXACT-POS BEFORE AFTER WITHIN-POS UNCERTAIN >;
enum Simple-Location-Type < EXACT IN-BETWEEN WITHIN >;
enum Split-Location-Type < JOIN ORDER BOND >;

my %VALID-LOCATION-SYMBOL = 
    '.'          => 'WITHIN',
    '..'         => 'EXACT',
    '^'          => 'IN-BETWEEN',
;

my %VALID-LOCATION-POS-SYMBOL = 
    '..'         => 'EXACT',
    '<'          => 'BEFORE',
    '>'          => 'AFTER',
    '.'          => 'WITHIN',
    '?'          => 'UNCERTAIN'
;

my %SYMBOL-TYPE = 
    'EXACT'     => '..',
    'BEFORE'    => '<',
    'AFTER'     => '>',
    'WITHIN'    => '.',
    'IN-BETWEEN'   => '^',
    'UNCERTAIN' => '?'
;

my %TYPE-SYMBOL = %SYMBOL-TYPE.invert;

# trait for start/end position type
role doc {
    has $.doc is rw;
}
#multi trait_mod:<is>(Attribute $a, pos-typed) is export {
#    $a.container.VAR does pos-typed;
#}
multi trait_mod:<is>(Attribute $a, doc) is export {
    $a.container.VAR does doc;
}

# TODO: convert these to enums
#my %VALID_SPLIT_TYPE = map {$_ => 1}
#    qw(JOIN ORDER BOND);

#my %VALID_SIMPLE_TYPE = map {$_ => 1}
#    qw(EXACT IN-BETWEEN WITHIN);

# WITHIN here is very rare but does occur, ex (122.144)
#my %VALID_LOCATION_TYPE = map {$_ => 1}
#    (keys(%VALID_SIMPLE_TYPE), keys(%VALID_SPLIT_TYPE));

#my %VALID_LOCATION_POS_TYPE = map {$_ => 1}
#    qw(EXACT BEFORE AFTER WITHIN UNCERTAIN);

# TODO: some of these could probably be redef. as enums, but it makes coercion
# easier, needs checking
#subtype Location_Symbol,
#    as Str,
#    where {exists $VALID_LOCATION_SYMBOL{$_}},
#    message {"Unknown Location symbol $_"};
#
#subtype Location_Type,
#    as Str,
#    where {exists $VALID_LOCATION_TYPE{$_}},
#    message {"Unknown Location type $_"};
#
#subtype Split_Location_Type,
#    as Str,
#    where {exists $VALID_SPLIT_TYPE{uc $_}},
#    message {"Unknown Split Location type $_"};
#
#subtype Simple_Location_Type,
#    as Str,
#    where {exists $VALID_SIMPLE_TYPE{uc $_}},
#    message {"Unknown Split Location type $_"};
#
#subtype Location_Pos_Symbol,
#    as Str,
#    where {exists $VALID_LOCATION_POS_SYMBOL{$_}},
#    message {"Unknown Location positional symbol $_"};
#
#subtype Location_Pos_Type,
#    as Str,
#    where {exists $VALID_LOCATION_POS_TYPE{$_}},
#    message {"Unknown Location positional type $_"};

# these may need to be method calls
#coerce Location_Pos_Type,
#    from Location_Pos_Symbol,
#    via {$TYPE_SYMBOL{$_}};
#
#coerce Location_Pos_Symbol,
#    from Location_Pos_Type,
#    via {$SYMBOL_TYPE{$_}};
#
#coerce Location_Symbol,
#    from Location_Type,
#    via {$SYMBOL_TYPE{$_}};
#
#coerce Location_Type,
#    from Location_Symbol,
#    via {$TYPE_SYMBOL{$_}};
#
#role_type Locatable, { role => 'Biome::Role::Location::Locatable' };
#
#subtype ArrayRef_of_Locatable,
#    as ArrayRef[Locatable],
#    message {"Non-Locatable instance added to Split Location"};
