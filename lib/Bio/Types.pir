
.HLL "perl6"

.namespace []
.sub "_block11"  :anon :subid("10_1268431459.78469")
    .param pmc param_33 :slurpy
.annotate "line", 0
    .const 'Sub' $P15 = "11_1268431459.78469" 
    capture_lex $P15
.annotate "line", 1
    get_hll_global $P13, "!UNIT_START"
    .const 'Sub' $P15 = "11_1268431459.78469" 
    capture_lex $P15
    .lex "@_", param_33
    .tailcall $P13($P15, param_33)
    .const 'Sub' $P38 = "14_1268431459.78469" 
    .return ($P38)
.end


.HLL "perl6"

.namespace []
.sub "_block14"  :anon :subid("11_1268431459.78469") :outer("10_1268431459.78469")
.annotate "line", 1
    get_hll_global $P24, ["Bio";"Types"], "_block23" 
    capture_lex $P24
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P16
    find_lex_skip_current $P17, "$_"
    $P18 = new ['Perl6Scalar'], $P17
    setprop $P18, "rw", true
    .lex "$_", $P18
    find_lex_skip_current $P19, "$/"
    $P20 = new ['Perl6Scalar'], $P19
    setprop $P20, "rw", true
    .lex "$/", $P20
    find_lex_skip_current $P21, "$!"
    $P22 = new ['Perl6Scalar'], $P21
    setprop $P22, "rw", true
    .lex "$!", $P22
    get_hll_global $P24, ["Bio";"Types"], "_block23" 
    capture_lex $P24
    $P32 = $P24()
    .return ($P32)
.end


.HLL "perl6"

.namespace ["Bio";"Types"]
.sub "_block23"  :subid("12_1268431459.78469") :outer("11_1268431459.78469")
.annotate "line", 1
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P25
    find_lex_skip_current $P26, "$_"
    $P27 = new ['Perl6Scalar'], $P26
    setprop $P27, "rw", true
    .lex "$_", $P27
    find_lex_skip_current $P28, "$/"
    $P29 = new ['Perl6Scalar'], $P28
    setprop $P29, "rw", true
    .lex "$/", $P29
    find_lex_skip_current $P30, "$!"
    $P31 = new ['Perl6Scalar'], $P30
    setprop $P31, "rw", true
    .lex "$!", $P31
    .return ()
.end


.HLL "perl6"

.namespace []
.sub "_block34" :load :init :anon :subid("13_1268431459.78469")
.annotate "line", 1
    $P36 = "!fire_phasers"("CHECK")
    .return ($P36)
.end


.HLL "perl6"

.namespace []
.sub "_block37" :load :anon :subid("14_1268431459.78469")
.annotate "line", 1
    .const 'Sub' $P39 = "10_1268431459.78469" 
    $P40 = "!UNIT_START"($P39)
    .return ($P40)
.end

