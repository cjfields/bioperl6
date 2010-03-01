
.HLL "perl6"

.namespace []
.sub "_block11"  :anon :subid("10_1266731898.29791")
    .param pmc param_22 :slurpy
.annotate "line", 0
    .const 'Sub' $P15 = "11_1266731898.29791" 
    capture_lex $P15
.annotate "line", 1
    get_hll_global $P13, "!UNIT_START"
    .const 'Sub' $P15 = "11_1266731898.29791" 
    capture_lex $P15
    .lex "@_", param_22
    .tailcall $P13($P15, param_22)
    .const 'Sub' $P27 = "13_1266731898.29791" 
    .return ($P27)
.end


.HLL "perl6"

.namespace []
.sub "_block14"  :anon :subid("11_1266731898.29791") :outer("10_1266731898.29791")
.annotate "line", 1
    .local pmc true
    true = get_hll_global 'True'
    find_lex_skip_current $P16, "$_"
    $P17 = new ['Perl6Scalar'], $P16
    setprop $P17, "rw", true
    .lex "$_", $P17
    find_lex_skip_current $P18, "$/"
    $P19 = new ['Perl6Scalar'], $P18
    setprop $P19, "rw", true
    .lex "$/", $P19
    find_lex_skip_current $P20, "$!"
    $P21 = new ['Perl6Scalar'], $P20
    setprop $P21, "rw", true
    .lex "$!", $P21
    .return ()
.end


.HLL "perl6"

.namespace []
.sub "_block23" :load :init :anon :subid("12_1266731898.29791")
.annotate "line", 1
    $P25 = "!fire_phasers"("CHECK")
    .return ($P25)
.end


.HLL "perl6"

.namespace []
.sub "_block26" :load :anon :subid("13_1266731898.29791")
.annotate "line", 1
    .const 'Sub' $P28 = "10_1266731898.29791" 
    $P29 = "!UNIT_START"($P28)
    .return ($P29)
.end

