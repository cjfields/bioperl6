use v6;

enum Location-Join-Symbol < . .. ^ >;

# this could probably be made a trait on start/end
enum Location-Pos-Symbol < < > . ? ..>;
enum Location-Pos-Type < EXACT-POS BEFORE AFTER WITHIN-POS UNCERTAIN >;
enum Join-Type < EXACT IN-BETWEEN WITHIN >;
enum Split-Location-Type < JOIN ORDER BOND >;

my %VALID-LOCATION-SYMBOL = 
    '.'          => WITHIN,
    '..'         => EXACT,
    '^'          => IN-BETWEEN,
;

my %VALID-LOCATION-POS-SYMBOL = 
    '..'         => EXACT-POS,
    '<'          => BEFORE,
    '>'          => AFTER,
    '.'          => WITHIN-POS,
    '?'          => UNCERTAIN
;

our %SYMBOL-TYPE is export = 
    EXACT           => '..',
    EXACT-POS       => '',
    BEFORE          => '<',
    AFTER           => '>',
    WITHIN          => '.',
    WITHIN-POS      => '.',
    IN-BETWEEN      => '^',
    UNCERTAIN       => '?'
;
