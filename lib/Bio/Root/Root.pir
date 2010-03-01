
.HLL "perl6"

.namespace []
.sub "_block11"  :anon :subid("18_1267386530.09191")
    .param pmc param_261 :slurpy
.annotate "line", 0
    .const 'Sub' $P15 = "19_1267386530.09191" 
    capture_lex $P15
.annotate "line", 1
    get_hll_global $P13, "!UNIT_START"
    .const 'Sub' $P15 = "19_1267386530.09191" 
    capture_lex $P15
    .lex "@_", param_261
    .tailcall $P13($P15, param_261)
    .const 'Sub' $P266 = "36_1267386530.09191" 
    .return ($P266)
.end


.HLL "perl6"

.namespace []
.sub "_block14"  :anon :subid("19_1267386530.09191") :outer("18_1267386530.09191")
.annotate "line", 1
    get_hll_global $P24, ["Root"], "_block23" 
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
    get_hll_global $P24, ["Root"], "_block23" 
    capture_lex $P24
    $P259 = $P24()
    .return ($P259)
.end


.HLL "perl6"

.namespace []
.sub "" :load :init :subid("post37") :outer("19_1267386530.09191")
.annotate "line", 1
    .const 'Sub' $P15 = "19_1267386530.09191" 
    .local pmc block
    set block, $P15
    get_hll_global $P260, ["Root"], "!class_init_17"
    $P260()
.end


.HLL "perl6"

.namespace ["Root"]
.sub "_block23"  :subid("20_1267386530.09191") :outer("19_1267386530.09191")
.annotate "line", 1
    .const 'Sub' $P230 = "34_1267386530.09191" 
    capture_lex $P230
    .const 'Sub' $P196 = "31_1267386530.09191" 
    capture_lex $P196
    .const 'Sub' $P172 = "29_1267386530.09191" 
    capture_lex $P172
    .const 'Sub' $P94 = "25_1267386530.09191" 
    capture_lex $P94
    .const 'Sub' $P67 = "23_1267386530.09191" 
    capture_lex $P67
    .const 'Sub' $P32 = "21_1267386530.09191" 
    capture_lex $P32
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
    .const 'Sub' $P230 = "34_1267386530.09191" 
    capture_lex $P230
    .return ($P230)
.end


.HLL "perl6"

.namespace ["Root"]
.sub "throw"  :anon :subid("21_1267386530.09191") :outer("20_1267386530.09191")
    .param pmc param_45 :call_sig
.annotate "line", 13
    .const 'Sub' $P50 = "22_1267386530.09191" 
    capture_lex $P50
    new $P34, 'ExceptionHandler'
    set_addr $P34, control_33
    $P34."handle_types"(58)
    push_eh $P34
    new $P35, "Perl6Scalar"
    .lex "self", $P35
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P36
    find_lex_skip_current $P37, "$_"
    $P38 = new ['Perl6Scalar'], $P37
    setprop $P38, "rw", true
    .lex "$_", $P38
    find_lex_skip_current $P39, "$/"
    $P40 = new ['Perl6Scalar'], $P39
    setprop $P40, "rw", true
    .lex "$/", $P40
    find_lex_skip_current $P41, "$!"
    $P42 = new ['Perl6Scalar'], $P41
    setprop $P42, "rw", true
    .lex "$!", $P42
.annotate "line", 14
    new $P43, "Perl6Scalar"
    setprop $P43, "rw", true
    setprop $P43, "scalar", true
    .lex "$title", $P43
.annotate "line", 15
    new $P44, "Perl6Scalar"
    setprop $P44, "rw", true
    setprop $P44, "scalar", true
    .lex "$footer", $P44
    .lex "call_sig", param_45
    new $P46, "Perl6Scalar"
    .lex "$string", $P46
    new $P47, "Hash"
    .lex "%_", $P47
    find_lex $P48, "call_sig"
    bind_signature $P48
.annotate "line", 14
    find_lex $P55, "$title"
    new $P56, "Perl6Str"
    assign $P56, "------------- EXCEPTION -------------"
    "&infix:<=>"($P55, $P56)
.annotate "line", 15
    find_lex $P57, "$footer"
    new $P58, "Perl6Str"
    assign $P58, "-"
    find_lex $P59, "$title"
    descalarref $P60, $P59
    $P61 = $P60."chars"()
    $P62 = "&infix:<x>"($P58, $P61)
    new $P63, "Perl6Str"
    assign $P63, "\n"
    $P64 = "&infix:<~>"($P62, $P63)
    "&infix:<=>"($P57, $P64)
.annotate "line", 16
    $P65 = "&die"("Stub code executed")
.annotate "line", 13
    .return ($P65)
  control_33:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P66, exception, "payload"
    .return ($P66)
.end


.HLL "perl6"

.namespace ["Root"]
.sub "_block49"  :anon :subid("22_1267386530.09191") :outer("21_1267386530.09191")
.annotate "line", 15
    $P51 = allocate_signature 3
    .local pmc signature_10
    set signature_10, $P51
    null $P0
    null $S0
    get_global $P52, "Mu"
    set_signature_elem signature_10, 0, $S0, 192, $P52, $P0, $P0, $P0, $P0, $P0, $S0
    get_hll_global $P53, "Str"
    set_signature_elem signature_10, 1, "$string", 128, $P53, $P0, $P0, $P0, $P0, $P0, $S0
    get_global $P54, "Mu"
    set_signature_elem signature_10, 2, "%_", 8208, $P54, $P0, $P0, $P0, $P0, $P0, $S0
    .local pmc signature
    set signature, signature_10
    .return (signature)
.end


.HLL "perl6"

.namespace ["Root"]
.sub "throw_not_implemented"  :anon :subid("23_1267386530.09191") :outer("20_1267386530.09191")
    .param pmc param_78 :call_sig
.annotate "line", 19
    .const 'Sub' $P83 = "24_1267386530.09191" 
    capture_lex $P83
    new $P69, 'ExceptionHandler'
    set_addr $P69, control_68
    $P69."handle_types"(58)
    push_eh $P69
    new $P70, "Perl6Scalar"
    .lex "self", $P70
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P71
    find_lex_skip_current $P72, "$_"
    $P73 = new ['Perl6Scalar'], $P72
    setprop $P73, "rw", true
    .lex "$_", $P73
    find_lex_skip_current $P74, "$/"
    $P75 = new ['Perl6Scalar'], $P74
    setprop $P75, "rw", true
    .lex "$/", $P75
    find_lex_skip_current $P76, "$!"
    $P77 = new ['Perl6Scalar'], $P76
    setprop $P77, "rw", true
    .lex "$!", $P77
    .lex "call_sig", param_78
    new $P79, "Perl6Scalar"
    .lex "$string", $P79
    new $P80, "Hash"
    .lex "%_", $P80
    find_lex $P81, "call_sig"
    bind_signature $P81
.annotate "line", 20
    find_lex $P89, "self"
    descalarref $P90, $P89
    new $P91, "Perl6Str"
    assign $P91, "Method not implemented"
    $P92 = $P90."throw"($P91)
.annotate "line", 19
    .return ($P92)
  control_68:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P93, exception, "payload"
    .return ($P93)
.end


.HLL "perl6"

.namespace ["Root"]
.sub "_block82"  :anon :subid("24_1267386530.09191") :outer("23_1267386530.09191")
.annotate "line", 19
    $P84 = allocate_signature 3
    .local pmc signature_11
    set signature_11, $P84
    null $P0
    null $S0
    get_global $P85, "Mu"
    set_signature_elem signature_11, 0, $S0, 192, $P85, $P0, $P0, $P0, $P0, $P0, $S0
    get_hll_global $P86, "Str"
    $P87 = root_new ['parrot'; 'ResizableStringArray']
    push $P87, unicode:"string"
    set_signature_elem signature_11, 1, "$string", 2176, $P86, $P0, $P87, $P0, $P0, $P0, $S0
    get_global $P88, "Mu"
    set_signature_elem signature_11, 2, "%_", 8208, $P88, $P0, $P0, $P0, $P0, $P0, $S0
    .local pmc signature
    set signature, signature_11
    .return (signature)
.end


.HLL "perl6"

.namespace ["Root"]
.sub "warn"  :anon :subid("25_1267386530.09191") :outer("20_1267386530.09191")
    .param pmc param_107 :call_sig
.annotate "line", 23
    .const 'Sub' $P158 = "28_1267386530.09191" 
    capture_lex $P158
    .const 'Sub' $P124 = "27_1267386530.09191" 
    capture_lex $P124
    .const 'Sub' $P112 = "26_1267386530.09191" 
    capture_lex $P112
    new $P96, 'ExceptionHandler'
    set_addr $P96, control_95
    $P96."handle_types"(58)
    push_eh $P96
    new $P97, "Perl6Scalar"
    .lex "self", $P97
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P98
    find_lex_skip_current $P99, "$_"
    $P100 = new ['Perl6Scalar'], $P99
    setprop $P100, "rw", true
    .lex "$_", $P100
    find_lex_skip_current $P101, "$/"
    $P102 = new ['Perl6Scalar'], $P101
    setprop $P102, "rw", true
    .lex "$/", $P102
    find_lex_skip_current $P103, "$!"
    $P104 = new ['Perl6Scalar'], $P103
    setprop $P104, "rw", true
    .lex "$!", $P104
.annotate "line", 27
    new $P105, "Perl6Scalar"
    setprop $P105, "rw", true
    setprop $P105, "scalar", true
    .lex "$title", $P105
.annotate "line", 28
    new $P106, "Perl6Scalar"
    setprop $P106, "rw", true
    setprop $P106, "scalar", true
    .lex "$footer", $P106
    .lex "call_sig", param_107
    new $P108, "Perl6Scalar"
    .lex "$string", $P108
    new $P109, "Hash"
    .lex "%_", $P109
    find_lex $P110, "call_sig"
    bind_signature $P110
.annotate "line", 24
    find_lex $P119, "self"
    descalarref $P120, $P119
    $P121 = $P120."verbose"()
    new $P122, "Integer"
    assign $P122, 2
    $P118 = "&infix:<==>"($P121, $P122)
  chain_end_38:
    unless $P118, if_117_end
    .const 'Sub' $P124 = "27_1267386530.09191" 
    capture_lex $P124
    $P124()
  if_117_end:
.annotate "line", 27
    find_lex $P140, "$title"
    new $P141, "Perl6Str"
    assign $P141, "------------- WARNING -------------"
    "&infix:<=>"($P140, $P141)
.annotate "line", 28
    find_lex $P142, "$footer"
    new $P143, "Perl6Str"
    assign $P143, "-"
    find_lex $P144, "$title"
    descalarref $P145, $P144
    $P146 = $P145."chars"()
    $P147 = "&infix:<x>"($P143, $P146)
    new $P148, "Perl6Str"
    assign $P148, "\n"
    $P149 = "&infix:<~>"($P147, $P148)
    "&infix:<=>"($P142, $P149)
.annotate "line", 29
    new $P153, "Integer"
    assign $P153, 0
    find_lex $P154, "self"
    descalarref $P155, $P154
    $P156 = $P155."verbose"()
    $P152 = "&infix:<<=>"($P153, $P156)
  chain_end_40:
    if $P152, if_151
    set $P150, $P152
    goto if_151_end
  if_151:
    .const 'Sub' $P158 = "28_1267386530.09191" 
    capture_lex $P158
    $P170 = $P158()
    set $P150, $P170
  if_151_end:
.annotate "line", 23
    .return ($P150)
  control_95:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P171, exception, "payload"
    .return ($P171)
.end


.HLL "perl6"

.namespace ["Root"]
.sub "_block111"  :anon :subid("26_1267386530.09191") :outer("25_1267386530.09191")
.annotate "line", 28
    $P113 = allocate_signature 3
    .local pmc signature_14
    set signature_14, $P113
    null $P0
    null $S0
    get_global $P114, "Mu"
    set_signature_elem signature_14, 0, $S0, 192, $P114, $P0, $P0, $P0, $P0, $P0, $S0
    get_hll_global $P115, "Str"
    set_signature_elem signature_14, 1, "$string", 128, $P115, $P0, $P0, $P0, $P0, $P0, $S0
    get_global $P116, "Mu"
    set_signature_elem signature_14, 2, "%_", 8208, $P116, $P0, $P0, $P0, $P0, $P0, $S0
    .local pmc signature
    set signature, signature_14
    .return (signature)
.end


.HLL "perl6"

.namespace ["Root"]
.sub "_block123"  :anon :subid("27_1267386530.09191") :outer("25_1267386530.09191")
    .param pmc param_132 :call_sig
.annotate "line", 24
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P125
    find_lex_skip_current $P126, "$_"
    $P127 = new ['Perl6Scalar'], $P126
    setprop $P127, "rw", true
    .lex "$_", $P127
    find_lex_skip_current $P128, "$/"
    $P129 = new ['Perl6Scalar'], $P128
    setprop $P129, "rw", true
    .lex "$/", $P129
    find_lex_skip_current $P130, "$!"
    $P131 = new ['Perl6Scalar'], $P130
    setprop $P131, "rw", true
    .lex "$!", $P131
    .lex "call_sig", param_132
    find_lex $P133, "call_sig"
    bind_signature $P133
.annotate "line", 25
    new $P134, "Exception"
    set $P134['type'], 58
    find_lex $P135, "self"
    descalarref $P136, $P135
    find_lex $P137, "$string"
    $P138 = $P136."throw"($P137)
    setattribute $P134, 'payload', $P138
    throw $P134
.annotate "line", 24
    .return ()
.end


.HLL "perl6"

.namespace ["Root"]
.sub "" :load :init :subid("post39") :outer("27_1267386530.09191")
.annotate "line", 24
    .const 'Sub' $P124 = "27_1267386530.09191" 
    .local pmc block
    set block, $P124
    $P139 = allocate_signature 0
    .local pmc signature_12
    set signature_12, $P139
    null $P0
    null $S0
    .local pmc signature
    set signature, signature_12
    setprop block, "$!signature", signature
.end


.HLL "perl6"

.namespace ["Root"]
.sub "_block157"  :anon :subid("28_1267386530.09191") :outer("25_1267386530.09191")
    .param pmc param_166 :call_sig
.annotate "line", 29
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P159
    find_lex_skip_current $P160, "$_"
    $P161 = new ['Perl6Scalar'], $P160
    setprop $P161, "rw", true
    .lex "$_", $P161
    find_lex_skip_current $P162, "$/"
    $P163 = new ['Perl6Scalar'], $P162
    setprop $P163, "rw", true
    .lex "$/", $P163
    find_lex_skip_current $P164, "$!"
    $P165 = new ['Perl6Scalar'], $P164
    setprop $P165, "rw", true
    .lex "$!", $P165
    .lex "call_sig", param_166
    find_lex $P167, "call_sig"
    bind_signature $P167
.annotate "line", 30
    $P168 = "&warn"("Stub code executed")
.annotate "line", 29
    .return ($P168)
.end


.HLL "perl6"

.namespace ["Root"]
.sub "" :load :init :subid("post41") :outer("28_1267386530.09191")
.annotate "line", 29
    .const 'Sub' $P158 = "28_1267386530.09191" 
    .local pmc block
    set block, $P158
    $P169 = allocate_signature 0
    .local pmc signature_13
    set signature_13, $P169
    null $P0
    null $S0
    .local pmc signature
    set signature, signature_13
    setprop block, "$!signature", signature
.end


.HLL "perl6"

.namespace ["Root"]
.sub "warn_not_implemented"  :anon :subid("29_1267386530.09191") :outer("20_1267386530.09191")
    .param pmc param_183 :call_sig
.annotate "line", 34
    .const 'Sub' $P187 = "30_1267386530.09191" 
    capture_lex $P187
    new $P174, 'ExceptionHandler'
    set_addr $P174, control_173
    $P174."handle_types"(58)
    push_eh $P174
    new $P175, "Perl6Scalar"
    .lex "self", $P175
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P176
    find_lex_skip_current $P177, "$_"
    $P178 = new ['Perl6Scalar'], $P177
    setprop $P178, "rw", true
    .lex "$_", $P178
    find_lex_skip_current $P179, "$/"
    $P180 = new ['Perl6Scalar'], $P179
    setprop $P180, "rw", true
    .lex "$/", $P180
    find_lex_skip_current $P181, "$!"
    $P182 = new ['Perl6Scalar'], $P181
    setprop $P182, "rw", true
    .lex "$!", $P182
    .lex "call_sig", param_183
    new $P184, "Hash"
    .lex "%_", $P184
    find_lex $P185, "call_sig"
    bind_signature $P185
.annotate "line", 35
    find_lex $P191, "self"
    descalarref $P192, $P191
    new $P193, "Perl6Str"
    assign $P193, "Method not implemented"
    $P194 = $P192."warn"($P193)
.annotate "line", 34
    .return ($P194)
  control_173:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P195, exception, "payload"
    .return ($P195)
.end


.HLL "perl6"

.namespace ["Root"]
.sub "_block186"  :anon :subid("30_1267386530.09191") :outer("29_1267386530.09191")
.annotate "line", 34
    $P188 = allocate_signature 2
    .local pmc signature_15
    set signature_15, $P188
    null $P0
    null $S0
    get_global $P189, "Mu"
    set_signature_elem signature_15, 0, $S0, 192, $P189, $P0, $P0, $P0, $P0, $P0, $S0
    get_global $P190, "Mu"
    set_signature_elem signature_15, 1, "%_", 8208, $P190, $P0, $P0, $P0, $P0, $P0, $S0
    .local pmc signature
    set signature, signature_15
    .return (signature)
.end


.HLL "perl6"

.namespace ["Root"]
.sub "debug"  :anon :subid("31_1267386530.09191") :outer("20_1267386530.09191")
    .param pmc param_207 :call_sig
.annotate "line", 38
    .const 'Sub' $P212 = "32_1267386530.09191" 
    capture_lex $P212
    new $P198, 'ExceptionHandler'
    set_addr $P198, control_197
    $P198."handle_types"(58)
    push_eh $P198
    new $P199, "Perl6Scalar"
    .lex "self", $P199
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P200
    find_lex_skip_current $P201, "$_"
    $P202 = new ['Perl6Scalar'], $P201
    setprop $P202, "rw", true
    .lex "$_", $P202
    find_lex_skip_current $P203, "$/"
    $P204 = new ['Perl6Scalar'], $P203
    setprop $P204, "rw", true
    .lex "$/", $P204
    find_lex_skip_current $P205, "$!"
    $P206 = new ['Perl6Scalar'], $P205
    setprop $P206, "rw", true
    .lex "$!", $P206
    .lex "call_sig", param_207
    new $P208, "Perl6Scalar"
    .lex "$string", $P208
    new $P209, "Hash"
    .lex "%_", $P209
    find_lex $P210, "call_sig"
    bind_signature $P210
.annotate "line", 39
    find_lex $P223, "self"
    descalarref $P224, $P223
    $P225 = $P224."verbose"()
    new $P226, "Integer"
    assign $P226, 0
    $P222 = "&infix:<>>"($P225, $P226)
  chain_end_42:
    if $P222, if_221
    $P228 = "&Nil"()
    set $P220, $P228
    goto if_221_end
  if_221:
    $P227 = "&warn"("Stub code executed")
    set $P220, $P227
  if_221_end:
.annotate "line", 38
    .return ($P220)
  control_197:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P229, exception, "payload"
    .return ($P229)
.end


.HLL "perl6"

.namespace ["Root"]
.sub "_block211"  :anon :subid("32_1267386530.09191") :outer("31_1267386530.09191")
.annotate "line", 38
    .const 'Sub' $P217 = "33_1267386530.09191" 
    capture_lex $P217
    $P213 = allocate_signature 3
    .local pmc signature_16
    set signature_16, $P213
    null $P0
    null $S0
    get_global $P214, "Mu"
    set_signature_elem signature_16, 0, $S0, 192, $P214, $P0, $P0, $P0, $P0, $P0, $S0
    get_hll_global $P215, "Str"
    .const 'Sub' $P217 = "33_1267386530.09191" 
    capture_lex $P217
    set_signature_elem signature_16, 1, "$string", 2176, $P215, $P0, $P0, $P0, $P217, $P0, $S0
    get_global $P219, "Mu"
    set_signature_elem signature_16, 2, "%_", 8208, $P219, $P0, $P0, $P0, $P0, $P0, $S0
    .local pmc signature
    set signature, signature_16
    .return (signature)
.end


.HLL "perl6"

.namespace ["Root"]
.sub "_block216"  :anon :subid("33_1267386530.09191") :outer("32_1267386530.09191")
.annotate "line", 38
    new $P218, "Perl6Str"
    assign $P218, ""
    .return ($P218)
.end


.HLL "perl6"

.namespace ["Root"]
.sub "!class_init_17"  :subid("34_1267386530.09191") :outer("20_1267386530.09191")
.annotate "line", 1
    get_hll_global $P231, "ClassHOW"
    $P232 = $P231."new"("Root")
    .local pmc obj
    set obj, $P232
    $P233 = obj."HOW"()
    .local pmc meta
    set meta, $P233
    get_hll_global $P234, "Method"
    .const 'Sub' $P235 = "31_1267386530.09191" 
    .const 'Sub' $P236 = "32_1267386530.09191" 
    $P237 = $P234."new"($P235, 0, $P236)
    meta."add_method"(obj, "debug", $P237)
    get_hll_global $P238, "Method"
    .const 'Sub' $P239 = "23_1267386530.09191" 
    .const 'Sub' $P240 = "24_1267386530.09191" 
    $P241 = $P238."new"($P239, 0, $P240)
    meta."add_method"(obj, "throw_not_implemented", $P241)
    get_hll_global $P242, "Method"
    .const 'Sub' $P243 = "25_1267386530.09191" 
    .const 'Sub' $P244 = "26_1267386530.09191" 
    $P245 = $P242."new"($P243, 0, $P244)
    meta."add_method"(obj, "warn", $P245)
    get_hll_global $P246, "Method"
    .const 'Sub' $P247 = "29_1267386530.09191" 
    .const 'Sub' $P248 = "30_1267386530.09191" 
    $P249 = $P246."new"($P247, 0, $P248)
    meta."add_method"(obj, "warn_not_implemented", $P249)
    get_hll_global $P250, "Method"
    .const 'Sub' $P251 = "21_1267386530.09191" 
    .const 'Sub' $P252 = "22_1267386530.09191" 
    $P253 = $P250."new"($P251, 0, $P252)
    meta."add_method"(obj, "throw", $P253)
    get_hll_global $P254, "Attribute"
    $P255 = $P254."new"("$!verbose" :named("name"), 1 :named("has_accessor"), 1 :named("rw"))
    meta."add_attribute"(obj, $P255)
    get_hll_global $P256, "Attribute"
    $P257 = $P256."new"("$!strict" :named("name"), 1 :named("has_accessor"), 1 :named("rw"))
    meta."add_attribute"(obj, $P257)
    $P258 = meta."compose"(obj)
    .return ($P258)
.end


.HLL "perl6"

.namespace []
.sub "_block262" :load :init :anon :subid("35_1267386530.09191")
.annotate "line", 1
    $P264 = "!fire_phasers"("CHECK")
    .return ($P264)
.end


.HLL "perl6"

.namespace []
.sub "_block265" :load :anon :subid("36_1267386530.09191")
.annotate "line", 1
    .const 'Sub' $P267 = "18_1267386530.09191" 
    $P268 = "!UNIT_START"($P267)
    .return ($P268)
.end

