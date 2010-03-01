
.HLL "perl6"

.namespace []
.sub "_block11"  :anon :subid("63_1267386528.16994")
    .param pmc param_1711 :slurpy
.annotate "line", 0
    .const 'Sub' $P15 = "64_1267386528.16994" 
    capture_lex $P15
.annotate "line", 1
    get_hll_global $P13, "!UNIT_START"
    .const 'Sub' $P15 = "64_1267386528.16994" 
    capture_lex $P15
    .lex "@_", param_1711
    .tailcall $P13($P15, param_1711)
    .const 'Sub' $P1716 = "167_1267386528.16994" 
    .return ($P1716)
.end


.HLL "perl6"

.namespace []
.sub "_block14"  :anon :subid("64_1267386528.16994") :outer("63_1267386528.16994")
.annotate "line", 1
    get_hll_global $P24, ["Test"], "_block23" 
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
    get_hll_global $P24, ["Test"], "_block23" 
    capture_lex $P24
    $P1710 = $P24()
    .return ($P1710)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "_block23"  :subid("65_1267386528.16994") :outer("64_1267386528.16994")
.annotate "line", 1
    .const 'Sub' $P1676 = "164_1267386528.16994" 
    capture_lex $P1676
    .const 'Sub' $P1583 = "159_1267386528.16994" 
    capture_lex $P1583
    .const 'Sub' $P1450 = "152_1267386528.16994" 
    capture_lex $P1450
    .const 'Sub' $P1406 = "149_1267386528.16994" 
    capture_lex $P1406
    .const 'Sub' $P1380 = "147_1267386528.16994" 
    capture_lex $P1380
    .const 'Sub' $P1258 = "140_1267386528.16994" 
    capture_lex $P1258
    .const 'Sub' $P1229 = "138_1267386528.16994" 
    capture_lex $P1229
    .const 'Sub' $P1197 = "136_1267386528.16994" 
    capture_lex $P1197
    .const 'Sub' $P1168 = "134_1267386528.16994" 
    capture_lex $P1168
    .const 'Sub' $P1134 = "132_1267386528.16994" 
    capture_lex $P1134
    .const 'Sub' $P1105 = "130_1267386528.16994" 
    capture_lex $P1105
    .const 'Sub' $P1060 = "127_1267386528.16994" 
    capture_lex $P1060
    .const 'Sub' $P1031 = "125_1267386528.16994" 
    capture_lex $P1031
    .const 'Sub' $P987 = "122_1267386528.16994" 
    capture_lex $P987
    .const 'Sub' $P951 = "120_1267386528.16994" 
    capture_lex $P951
    .const 'Sub' $P915 = "118_1267386528.16994" 
    capture_lex $P915
    .const 'Sub' $P885 = "116_1267386528.16994" 
    capture_lex $P885
    .const 'Sub' $P856 = "114_1267386528.16994" 
    capture_lex $P856
    .const 'Sub' $P826 = "112_1267386528.16994" 
    capture_lex $P826
    .const 'Sub' $P799 = "110_1267386528.16994" 
    capture_lex $P799
    .const 'Sub' $P744 = "107_1267386528.16994" 
    capture_lex $P744
    .const 'Sub' $P716 = "105_1267386528.16994" 
    capture_lex $P716
    .const 'Sub' $P692 = "103_1267386528.16994" 
    capture_lex $P692
    .const 'Sub' $P658 = "101_1267386528.16994" 
    capture_lex $P658
    .const 'Sub' $P623 = "99_1267386528.16994" 
    capture_lex $P623
    .const 'Sub' $P591 = "97_1267386528.16994" 
    capture_lex $P591
    .const 'Sub' $P549 = "95_1267386528.16994" 
    capture_lex $P549
    .const 'Sub' $P517 = "93_1267386528.16994" 
    capture_lex $P517
    .const 'Sub' $P480 = "91_1267386528.16994" 
    capture_lex $P480
    .const 'Sub' $P448 = "89_1267386528.16994" 
    capture_lex $P448
    .const 'Sub' $P327 = "83_1267386528.16994" 
    capture_lex $P327
    .const 'Sub' $P298 = "81_1267386528.16994" 
    capture_lex $P298
    .const 'Sub' $P268 = "79_1267386528.16994" 
    capture_lex $P268
    .const 'Sub' $P238 = "77_1267386528.16994" 
    capture_lex $P238
    .const 'Sub' $P208 = "75_1267386528.16994" 
    capture_lex $P208
    .const 'Sub' $P180 = "73_1267386528.16994" 
    capture_lex $P180
    .const 'Sub' $P114 = "69_1267386528.16994" 
    capture_lex $P114
    .const 'Sub' $P87 = "66_1267386528.16994" 
    capture_lex $P87
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
.annotate "line", 9
    get_global $P32, "$num_of_tests_run"
    unless_null $P32, vivify_248
    new $P32, "Perl6Scalar"
    setprop $P32, "rw", true
    setprop $P32, "scalar", true
    set_global "$num_of_tests_run", $P32
  vivify_248:
    .lex "$num_of_tests_run", $P32
.annotate "line", 10
    get_global $P33, "$num_of_tests_failed"
    unless_null $P33, vivify_249
    new $P33, "Perl6Scalar"
    setprop $P33, "rw", true
    setprop $P33, "scalar", true
    set_global "$num_of_tests_failed", $P33
  vivify_249:
    .lex "$num_of_tests_failed", $P33
.annotate "line", 11
    get_global $P34, "$todo_upto_test_num"
    unless_null $P34, vivify_250
    new $P34, "Perl6Scalar"
    setprop $P34, "rw", true
    setprop $P34, "scalar", true
    set_global "$todo_upto_test_num", $P34
  vivify_250:
    .lex "$todo_upto_test_num", $P34
.annotate "line", 12
    get_global $P35, "$todo_reason"
    unless_null $P35, vivify_251
    new $P35, "Perl6Scalar"
    setprop $P35, "rw", true
    setprop $P35, "scalar", true
    set_global "$todo_reason", $P35
  vivify_251:
    .lex "$todo_reason", $P35
.annotate "line", 13
    get_global $P36, "$num_of_tests_planned"
    unless_null $P36, vivify_252
    new $P36, "Perl6Scalar"
    setprop $P36, "rw", true
    setprop $P36, "scalar", true
    set_global "$num_of_tests_planned", $P36
  vivify_252:
    .lex "$num_of_tests_planned", $P36
.annotate "line", 14
    get_global $P37, "$no_plan"
    unless_null $P37, vivify_253
    new $P37, "Perl6Scalar"
    setprop $P37, "rw", true
    setprop $P37, "scalar", true
    set_global "$no_plan", $P37
  vivify_253:
    .lex "$no_plan", $P37
.annotate "line", 15
    get_global $P38, "$die_on_fail"
    unless_null $P38, vivify_254
    new $P38, "Perl6Scalar"
    setprop $P38, "rw", true
    setprop $P38, "scalar", true
    set_global "$die_on_fail", $P38
  vivify_254:
    .lex "$die_on_fail", $P38
.annotate "line", 20
    get_global $P39, "$done_testing_has_been_run"
    unless_null $P39, vivify_255
    new $P39, "Perl6Scalar"
    setprop $P39, "rw", true
    setprop $P39, "scalar", true
    set_global "$done_testing_has_been_run", $P39
  vivify_255:
    .lex "$done_testing_has_been_run", $P39
.annotate "line", 9
    find_lex $P40, "$num_of_tests_run"
    "&infix:<=>"($P40, 0)
.annotate "line", 10
    find_lex $P41, "$num_of_tests_failed"
    "&infix:<=>"($P41, 0)
.annotate "line", 11
    find_lex $P42, "$todo_upto_test_num"
    "&infix:<=>"($P42, 0)
.annotate "line", 12
    find_lex $P43, "$todo_reason"
    new $P44, "Perl6Str"
    assign $P44, ""
    "&infix:<=>"($P43, $P44)
    find_lex $P45, "$num_of_tests_planned"
.annotate "line", 14
    find_lex $P46, "$no_plan"
    "&infix:<=>"($P46, 1)
    find_lex $P47, "$die_on_fail"
.annotate "line", 20
    find_lex $P48, "$done_testing_has_been_run"
    "&infix:<=>"($P48, 0)
    get_global $P49, "&die_on_fail"
    get_global $P50, "&plan"
    get_global $P51, "&pass"
    get_global $P52, "&ok"
    get_global $P53, "&ok"
    get_global $P54, "&nok"
    get_global $P55, "&nok"
    get_global $P56, "&is"
    get_global $P57, "&is"
    get_global $P58, "&isnt"
    get_global $P59, "&isnt"
    get_global $P60, "&is_approx"
    get_global $P61, "&is_approx"
    get_global $P62, "&todo"
    get_global $P63, "&todo"
    get_global $P64, "&skip"
    get_global $P65, "&skip"
    get_global $P66, "&skip"
    get_global $P67, "&skip_rest"
    get_global $P68, "&skip_rest"
    get_global $P69, "&diag"
    get_global $P70, "&flunk"
    get_global $P71, "&isa_ok"
    get_global $P72, "&isa_ok"
    get_global $P73, "&dies_ok"
    get_global $P74, "&dies_ok"
    get_global $P75, "&lives_ok"
    get_global $P76, "&lives_ok"
    get_global $P77, "&eval_dies_ok"
    get_global $P78, "&eval_dies_ok"
    get_global $P79, "&eval_lives_ok"
    get_global $P80, "&eval_lives_ok"
    get_global $P81, "&is_deeply"
    get_global $P82, "&_is_deeply"
    get_global $P83, "&eval_exception"
    get_global $P84, "&proclaim"
    get_global $P85, "&done_testing"
.annotate "line", 1
    .return ()
.end


.HLL "perl6"

.namespace ["Test"]
.sub "" :load :init :subid("post168") :outer("65_1267386528.16994")
.annotate "line", 1
    get_hll_global $P24, ["Test"], "_block23" 
    .local pmc block
    set block, $P24
    get_hll_global $P86, "Sub"
.annotate "line", 26
    .const 'Sub' $P87 = "66_1267386528.16994" 
    capture_lex $P87
    .const 'Sub' $P110 = "67_1267386528.16994" 
    $P111 = $P86."new"($P87, 0, $P110)
.annotate "line", 1
    set_global "&die_on_fail", $P111
    get_global $P112, "&plan"
    unless_null $P112, vivify_169
    $P112 = new ["Perl6MultiSub"]
  vivify_169:
    get_hll_global $P113, "Sub"
.annotate "line", 36
    .const 'Sub' $P114 = "69_1267386528.16994" 
    capture_lex $P114
    .const 'Sub' $P175 = "70_1267386528.16994" 
    $P176 = $P113."new"($P114, 1, $P175)
.annotate "line", 1
    $P177 = $P112."set_candidates"($P176)
    set_global "&plan", $P177
    get_global $P178, "&pass"
    unless_null $P178, vivify_174
    $P178 = new ["Perl6MultiSub"]
  vivify_174:
    get_hll_global $P179, "Sub"
.annotate "line", 49
    .const 'Sub' $P180 = "73_1267386528.16994" 
    capture_lex $P180
    .const 'Sub' $P203 = "74_1267386528.16994" 
    $P204 = $P179."new"($P180, 1, $P203)
.annotate "line", 1
    $P205 = $P178."set_candidates"($P204)
    set_global "&pass", $P205
    get_global $P206, "&ok"
    unless_null $P206, vivify_176
    $P206 = new ["Perl6MultiSub"]
  vivify_176:
    get_hll_global $P207, "Sub"
.annotate "line", 53
    .const 'Sub' $P208 = "75_1267386528.16994" 
    capture_lex $P208
    .const 'Sub' $P235 = "76_1267386528.16994" 
    $P236 = $P207."new"($P208, 1, $P235)
.annotate "line", 1
    get_hll_global $P237, "Sub"
.annotate "line", 57
    .const 'Sub' $P238 = "77_1267386528.16994" 
    capture_lex $P238
    .const 'Sub' $P263 = "78_1267386528.16994" 
    $P264 = $P237."new"($P238, 1, $P263)
.annotate "line", 1
    $P265 = $P206."set_candidates"($P236, $P264)
    set_global "&ok", $P265
    get_global $P266, "&nok"
    unless_null $P266, vivify_179
    $P266 = new ["Perl6MultiSub"]
  vivify_179:
    get_hll_global $P267, "Sub"
.annotate "line", 60
    .const 'Sub' $P268 = "79_1267386528.16994" 
    capture_lex $P268
    .const 'Sub' $P295 = "80_1267386528.16994" 
    $P296 = $P267."new"($P268, 1, $P295)
.annotate "line", 1
    get_hll_global $P297, "Sub"
.annotate "line", 64
    .const 'Sub' $P298 = "81_1267386528.16994" 
    capture_lex $P298
    .const 'Sub' $P322 = "82_1267386528.16994" 
    $P323 = $P297."new"($P298, 1, $P322)
.annotate "line", 1
    $P324 = $P266."set_candidates"($P296, $P323)
    set_global "&nok", $P324
    get_global $P325, "&is"
    unless_null $P325, vivify_182
    $P325 = new ["Perl6MultiSub"]
  vivify_182:
    get_hll_global $P326, "Sub"
.annotate "line", 67
    .const 'Sub' $P327 = "83_1267386528.16994" 
    capture_lex $P327
    .const 'Sub' $P445 = "84_1267386528.16994" 
    $P446 = $P326."new"($P327, 1, $P445)
.annotate "line", 1
    get_hll_global $P447, "Sub"
.annotate "line", 81
    .const 'Sub' $P448 = "89_1267386528.16994" 
    capture_lex $P448
    .const 'Sub' $P475 = "90_1267386528.16994" 
    $P476 = $P447."new"($P448, 1, $P475)
.annotate "line", 1
    $P477 = $P325."set_candidates"($P446, $P476)
    set_global "&is", $P477
    get_global $P478, "&isnt"
    unless_null $P478, vivify_188
    $P478 = new ["Perl6MultiSub"]
  vivify_188:
    get_hll_global $P479, "Sub"
.annotate "line", 84
    .const 'Sub' $P480 = "91_1267386528.16994" 
    capture_lex $P480
    .const 'Sub' $P514 = "92_1267386528.16994" 
    $P515 = $P479."new"($P480, 1, $P514)
.annotate "line", 1
    get_hll_global $P516, "Sub"
.annotate "line", 89
    .const 'Sub' $P517 = "93_1267386528.16994" 
    capture_lex $P517
    .const 'Sub' $P544 = "94_1267386528.16994" 
    $P545 = $P516."new"($P517, 1, $P544)
.annotate "line", 1
    $P546 = $P478."set_candidates"($P515, $P545)
    set_global "&isnt", $P546
    get_global $P547, "&is_approx"
    unless_null $P547, vivify_192
    $P547 = new ["Perl6MultiSub"]
  vivify_192:
    get_hll_global $P548, "Sub"
.annotate "line", 91
    .const 'Sub' $P549 = "95_1267386528.16994" 
    capture_lex $P549
    .const 'Sub' $P588 = "96_1267386528.16994" 
    $P589 = $P548."new"($P549, 1, $P588)
.annotate "line", 1
    get_hll_global $P590, "Sub"
.annotate "line", 96
    .const 'Sub' $P591 = "97_1267386528.16994" 
    capture_lex $P591
    .const 'Sub' $P618 = "98_1267386528.16994" 
    $P619 = $P590."new"($P591, 1, $P618)
.annotate "line", 1
    $P620 = $P547."set_candidates"($P589, $P619)
    set_global "&is_approx", $P620
    get_global $P621, "&todo"
    unless_null $P621, vivify_196
    $P621 = new ["Perl6MultiSub"]
  vivify_196:
    get_hll_global $P622, "Sub"
.annotate "line", 100
    .const 'Sub' $P623 = "99_1267386528.16994" 
    capture_lex $P623
    .const 'Sub' $P655 = "100_1267386528.16994" 
    $P656 = $P622."new"($P623, 1, $P655)
.annotate "line", 1
    get_hll_global $P657, "Sub"
.annotate "line", 105
    .const 'Sub' $P658 = "101_1267386528.16994" 
    capture_lex $P658
    .const 'Sub' $P687 = "102_1267386528.16994" 
    $P688 = $P657."new"($P658, 1, $P687)
.annotate "line", 1
    $P689 = $P621."set_candidates"($P656, $P688)
    set_global "&todo", $P689
    get_global $P690, "&skip"
    unless_null $P690, vivify_199
    $P690 = new ["Perl6MultiSub"]
  vivify_199:
    get_hll_global $P691, "Sub"
.annotate "line", 110
    .const 'Sub' $P692 = "103_1267386528.16994" 
    capture_lex $P692
    .const 'Sub' $P713 = "104_1267386528.16994" 
    $P714 = $P691."new"($P692, 1, $P713)
.annotate "line", 1
    get_hll_global $P715, "Sub"
.annotate "line", 111
    .const 'Sub' $P716 = "105_1267386528.16994" 
    capture_lex $P716
    .const 'Sub' $P741 = "106_1267386528.16994" 
    $P742 = $P715."new"($P716, 1, $P741)
.annotate "line", 1
    get_hll_global $P743, "Sub"
.annotate "line", 112
    .const 'Sub' $P744 = "107_1267386528.16994" 
    capture_lex $P744
    .const 'Sub' $P794 = "108_1267386528.16994" 
    $P795 = $P743."new"($P744, 1, $P794)
.annotate "line", 1
    $P796 = $P690."set_candidates"($P714, $P742, $P795)
    set_global "&skip", $P796
    get_global $P797, "&skip_rest"
    unless_null $P797, vivify_205
    $P797 = new ["Perl6MultiSub"]
  vivify_205:
    get_hll_global $P798, "Sub"
.annotate "line", 117
    .const 'Sub' $P799 = "110_1267386528.16994" 
    capture_lex $P799
    .const 'Sub' $P823 = "111_1267386528.16994" 
    $P824 = $P798."new"($P799, 1, $P823)
.annotate "line", 1
    get_hll_global $P825, "Sub"
.annotate "line", 121
    .const 'Sub' $P826 = "112_1267386528.16994" 
    capture_lex $P826
    .const 'Sub' $P852 = "113_1267386528.16994" 
    $P853 = $P825."new"($P826, 1, $P852)
.annotate "line", 1
    $P854 = $P797."set_candidates"($P824, $P853)
    set_global "&skip_rest", $P854
    get_hll_global $P855, "Sub"
.annotate "line", 125
    .const 'Sub' $P856 = "114_1267386528.16994" 
    capture_lex $P856
    .const 'Sub' $P881 = "115_1267386528.16994" 
    $P882 = $P855."new"($P856, 0, $P881)
.annotate "line", 1
    set_global "&diag", $P882
    get_global $P883, "&flunk"
    unless_null $P883, vivify_209
    $P883 = new ["Perl6MultiSub"]
  vivify_209:
    get_hll_global $P884, "Sub"
.annotate "line", 128
    .const 'Sub' $P885 = "116_1267386528.16994" 
    capture_lex $P885
    .const 'Sub' $P910 = "117_1267386528.16994" 
    $P911 = $P884."new"($P885, 1, $P910)
.annotate "line", 1
    $P912 = $P883."set_candidates"($P911)
    set_global "&flunk", $P912
    get_global $P913, "&isa_ok"
    unless_null $P913, vivify_211
    $P913 = new ["Perl6MultiSub"]
  vivify_211:
    get_hll_global $P914, "Sub"
.annotate "line", 131
    .const 'Sub' $P915 = "118_1267386528.16994" 
    capture_lex $P915
    .const 'Sub' $P948 = "119_1267386528.16994" 
    $P949 = $P914."new"($P915, 1, $P948)
.annotate "line", 1
    get_hll_global $P950, "Sub"
.annotate "line", 134
    .const 'Sub' $P951 = "120_1267386528.16994" 
    capture_lex $P951
    .const 'Sub' $P982 = "121_1267386528.16994" 
    $P983 = $P950."new"($P951, 1, $P982)
.annotate "line", 1
    $P984 = $P913."set_candidates"($P949, $P983)
    set_global "&isa_ok", $P984
    get_global $P985, "&dies_ok"
    unless_null $P985, vivify_214
    $P985 = new ["Perl6MultiSub"]
  vivify_214:
    get_hll_global $P986, "Sub"
.annotate "line", 136
    .const 'Sub' $P987 = "122_1267386528.16994" 
    capture_lex $P987
    .const 'Sub' $P1028 = "123_1267386528.16994" 
    $P1029 = $P986."new"($P987, 1, $P1028)
.annotate "line", 1
    get_hll_global $P1030, "Sub"
.annotate "line", 146
    .const 'Sub' $P1031 = "125_1267386528.16994" 
    capture_lex $P1031
    .const 'Sub' $P1055 = "126_1267386528.16994" 
    $P1056 = $P1030."new"($P1031, 1, $P1055)
.annotate "line", 1
    $P1057 = $P985."set_candidates"($P1029, $P1056)
    set_global "&dies_ok", $P1057
    get_global $P1058, "&lives_ok"
    unless_null $P1058, vivify_217
    $P1058 = new ["Perl6MultiSub"]
  vivify_217:
    get_hll_global $P1059, "Sub"
.annotate "line", 150
    .const 'Sub' $P1060 = "127_1267386528.16994" 
    capture_lex $P1060
    .const 'Sub' $P1102 = "128_1267386528.16994" 
    $P1103 = $P1059."new"($P1060, 1, $P1102)
.annotate "line", 1
    get_hll_global $P1104, "Sub"
.annotate "line", 156
    .const 'Sub' $P1105 = "130_1267386528.16994" 
    capture_lex $P1105
    .const 'Sub' $P1129 = "131_1267386528.16994" 
    $P1130 = $P1104."new"($P1105, 1, $P1129)
.annotate "line", 1
    $P1131 = $P1058."set_candidates"($P1103, $P1130)
    set_global "&lives_ok", $P1131
    get_global $P1132, "&eval_dies_ok"
    unless_null $P1132, vivify_220
    $P1132 = new ["Perl6MultiSub"]
  vivify_220:
    get_hll_global $P1133, "Sub"
.annotate "line", 160
    .const 'Sub' $P1134 = "132_1267386528.16994" 
    capture_lex $P1134
    .const 'Sub' $P1165 = "133_1267386528.16994" 
    $P1166 = $P1133."new"($P1134, 1, $P1165)
.annotate "line", 1
    get_hll_global $P1167, "Sub"
.annotate "line", 168
    .const 'Sub' $P1168 = "134_1267386528.16994" 
    capture_lex $P1168
    .const 'Sub' $P1192 = "135_1267386528.16994" 
    $P1193 = $P1167."new"($P1168, 1, $P1192)
.annotate "line", 1
    $P1194 = $P1132."set_candidates"($P1166, $P1193)
    set_global "&eval_dies_ok", $P1194
    get_global $P1195, "&eval_lives_ok"
    unless_null $P1195, vivify_223
    $P1195 = new ["Perl6MultiSub"]
  vivify_223:
    get_hll_global $P1196, "Sub"
.annotate "line", 172
    .const 'Sub' $P1197 = "136_1267386528.16994" 
    capture_lex $P1197
    .const 'Sub' $P1226 = "137_1267386528.16994" 
    $P1227 = $P1196."new"($P1197, 1, $P1226)
.annotate "line", 1
    get_hll_global $P1228, "Sub"
.annotate "line", 175
    .const 'Sub' $P1229 = "138_1267386528.16994" 
    capture_lex $P1229
    .const 'Sub' $P1253 = "139_1267386528.16994" 
    $P1254 = $P1228."new"($P1229, 1, $P1253)
.annotate "line", 1
    $P1255 = $P1195."set_candidates"($P1227, $P1254)
    set_global "&eval_lives_ok", $P1255
    get_global $P1256, "&is_deeply"
    unless_null $P1256, vivify_226
    $P1256 = new ["Perl6MultiSub"]
  vivify_226:
    get_hll_global $P1257, "Sub"
.annotate "line", 182
    .const 'Sub' $P1258 = "140_1267386528.16994" 
    capture_lex $P1258
    .const 'Sub' $P1376 = "141_1267386528.16994" 
    $P1377 = $P1257."new"($P1258, 1, $P1376)
.annotate "line", 1
    $P1378 = $P1256."set_candidates"($P1377)
    set_global "&is_deeply", $P1378
    get_hll_global $P1379, "Sub"
.annotate "line", 195
    .const 'Sub' $P1380 = "147_1267386528.16994" 
    capture_lex $P1380
    .const 'Sub' $P1403 = "148_1267386528.16994" 
    $P1404 = $P1379."new"($P1380, 0, $P1403)
.annotate "line", 1
    set_global "&_is_deeply", $P1404
    get_hll_global $P1405, "Sub"
.annotate "line", 202
    .const 'Sub' $P1406 = "149_1267386528.16994" 
    capture_lex $P1406
    .const 'Sub' $P1447 = "150_1267386528.16994" 
    $P1448 = $P1405."new"($P1406, 0, $P1447)
.annotate "line", 1
    set_global "&eval_exception", $P1448
    get_hll_global $P1449, "Sub"
.annotate "line", 208
    .const 'Sub' $P1450 = "152_1267386528.16994" 
    capture_lex $P1450
    .const 'Sub' $P1580 = "153_1267386528.16994" 
    $P1581 = $P1449."new"($P1450, 0, $P1580)
.annotate "line", 1
    set_global "&proclaim", $P1581
    get_hll_global $P1582, "Sub"
.annotate "line", 232
    .const 'Sub' $P1583 = "159_1267386528.16994" 
    capture_lex $P1583
    .const 'Sub' $P1673 = "160_1267386528.16994" 
    $P1674 = $P1582."new"($P1583, 0, $P1673)
.annotate "line", 1
    set_global "&done_testing", $P1674
.annotate "line", 250
    .const 'Sub' $P1676 = "164_1267386528.16994" 
    capture_lex $P1676
    "!add_phaser"("END", $P1676)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "die_on_fail"  :anon :subid("66_1267386528.16994") :outer("65_1267386528.16994")
    .param pmc param_97 :call_sig
.annotate "line", 26
    .const 'Sub' $P101 = "67_1267386528.16994" 
    capture_lex $P101
    new $P89, 'ExceptionHandler'
    set_addr $P89, control_88
    $P89."handle_types"(58)
    push_eh $P89
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P90
    find_lex_skip_current $P91, "$_"
    $P92 = new ['Perl6Scalar'], $P91
    setprop $P92, "rw", true
    .lex "$_", $P92
    find_lex_skip_current $P93, "$/"
    $P94 = new ['Perl6Scalar'], $P93
    setprop $P94, "rw", true
    .lex "$/", $P94
    find_lex_skip_current $P95, "$!"
    $P96 = new ['Perl6Scalar'], $P95
    setprop $P96, "rw", true
    .lex "$!", $P96
    .lex "call_sig", param_97
    new $P98, "Perl6Scalar"
    .lex "$fail", $P98
    find_lex $P99, "call_sig"
    bind_signature $P99
.annotate "line", 27
    find_lex $P106, "$die_on_fail"
    find_lex $P107, "$fail"
    $P108 = "&infix:<=>"($P106, $P107)
.annotate "line", 26
    .return ($P108)
  control_88:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, "payload"
    .return ($P109)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "_block100"  :anon :subid("67_1267386528.16994") :outer("66_1267386528.16994")
.annotate "line", 26
    .const 'Sub' $P105 = "68_1267386528.16994" 
    capture_lex $P105
    $P102 = allocate_signature 1
    .local pmc signature_10
    set signature_10, $P102
    null $P0
    null $S0
    get_hll_global $P103, "Any"
    .const 'Sub' $P105 = "68_1267386528.16994" 
    capture_lex $P105
    set_signature_elem signature_10, 0, "$fail", 2176, $P103, $P0, $P0, $P0, $P105, $P0, $S0
    .local pmc signature
    set signature, signature_10
    .return (signature)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "_block104"  :anon :subid("68_1267386528.16994") :outer("67_1267386528.16994")
.annotate "line", 26
    .return (1)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "plan"  :anon :subid("69_1267386528.16994") :outer("65_1267386528.16994")
    .param pmc param_124 :call_sig
.annotate "line", 36
    .const 'Sub' $P152 = "72_1267386528.16994" 
    capture_lex $P152
    .const 'Sub' $P137 = "71_1267386528.16994" 
    capture_lex $P137
    .const 'Sub' $P128 = "70_1267386528.16994" 
    capture_lex $P128
    new $P116, 'ExceptionHandler'
    set_addr $P116, control_115
    $P116."handle_types"(58)
    push_eh $P116
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P117
    find_lex_skip_current $P118, "$_"
    $P119 = new ['Perl6Scalar'], $P118
    setprop $P119, "rw", true
    .lex "$_", $P119
    find_lex_skip_current $P120, "$/"
    $P121 = new ['Perl6Scalar'], $P120
    setprop $P121, "rw", true
    .lex "$/", $P121
    find_lex_skip_current $P122, "$!"
    $P123 = new ['Perl6Scalar'], $P122
    setprop $P123, "rw", true
    .lex "$!", $P123
    .lex "call_sig", param_124
    new $P125, "Perl6Scalar"
    .lex "$number_of_tests", $P125
    find_lex $P126, "call_sig"
    bind_signature $P126
.annotate "line", 37
    find_lex $P134, "$number_of_tests"
    get_hll_global $P135, "Whatever"
    $P133 = "&infix:<~~>"($P134, $P135)
  chain_end_171:
    if $P133, if_132
.annotate "line", 40
    .const 'Sub' $P152 = "72_1267386528.16994" 
    capture_lex $P152
    $P170 = $P152()
    set $P131, $P170
.annotate "line", 37
    goto if_132_end
  if_132:
    .const 'Sub' $P137 = "71_1267386528.16994" 
    capture_lex $P137
    $P150 = $P137()
    set $P131, $P150
  if_132_end:
.annotate "line", 36
    .return ($P131)
  control_115:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P171, exception, "payload"
    .return ($P171)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "" :load :init :subid("post170") :outer("69_1267386528.16994")
.annotate "line", 36
    .const 'Sub' $P114 = "69_1267386528.16994" 
    .local pmc block
    set block, $P114
    get_hll_global $P172, "Sub"
    $P173 = $P172."new"(block, 0, "")
    .local pmc trait_subject
    set trait_subject, $P173
    get_hll_global $P174, ["Bool"], "True"
    "&trait_mod:<is>"(trait_subject, $P174 :named("export"))
.end


.HLL "perl6"

.namespace ["Test"]
.sub "_block127"  :anon :subid("70_1267386528.16994") :outer("69_1267386528.16994")
.annotate "line", 36
    $P129 = allocate_signature 1
    .local pmc signature_13
    set signature_13, $P129
    null $P0
    null $S0
    get_hll_global $P130, "Any"
    set_signature_elem signature_13, 0, "$number_of_tests", 128, $P130, $P0, $P0, $P0, $P0, $P0, $S0
    .local pmc signature
    set signature, signature_13
    .return (signature)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "_block151"  :anon :subid("72_1267386528.16994") :outer("69_1267386528.16994")
    .param pmc param_160 :call_sig
.annotate "line", 40
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P153
    find_lex_skip_current $P154, "$_"
    $P155 = new ['Perl6Scalar'], $P154
    setprop $P155, "rw", true
    .lex "$_", $P155
    find_lex_skip_current $P156, "$/"
    $P157 = new ['Perl6Scalar'], $P156
    setprop $P157, "rw", true
    .lex "$/", $P157
    find_lex_skip_current $P158, "$!"
    $P159 = new ['Perl6Scalar'], $P158
    setprop $P159, "rw", true
    .lex "$!", $P159
    .lex "call_sig", param_160
    find_lex $P161, "call_sig"
    bind_signature $P161
.annotate "line", 41
    find_lex $P162, "$num_of_tests_planned"
    find_lex $P163, "$number_of_tests"
    "&infix:<=>"($P162, $P163)
.annotate "line", 42
    find_lex $P164, "$no_plan"
    "&infix:<=>"($P164, 0)
.annotate "line", 44
    new $P165, "Perl6Str"
    assign $P165, "1.."
    find_lex $P166, "$number_of_tests"
    $P167 = "&infix:<~>"($P165, $P166)
    $P168 = "&say"($P167)
.annotate "line", 40
    .return ($P168)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "" :load :init :subid("post172") :outer("72_1267386528.16994")
.annotate "line", 40
    .const 'Sub' $P152 = "72_1267386528.16994" 
    .local pmc block
    set block, $P152
    $P169 = allocate_signature 0
    .local pmc signature_12
    set signature_12, $P169
    null $P0
    null $S0
    .local pmc signature
    set signature, signature_12
    setprop block, "$!signature", signature
.end


.HLL "perl6"

.namespace ["Test"]
.sub "_block136"  :anon :subid("71_1267386528.16994") :outer("69_1267386528.16994")
    .param pmc param_145 :call_sig
.annotate "line", 37
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P138
    find_lex_skip_current $P139, "$_"
    $P140 = new ['Perl6Scalar'], $P139
    setprop $P140, "rw", true
    .lex "$_", $P140
    find_lex_skip_current $P141, "$/"
    $P142 = new ['Perl6Scalar'], $P141
    setprop $P142, "rw", true
    .lex "$/", $P142
    find_lex_skip_current $P143, "$!"
    $P144 = new ['Perl6Scalar'], $P143
    setprop $P144, "rw", true
    .lex "$!", $P144
    .lex "call_sig", param_145
    find_lex $P146, "call_sig"
    bind_signature $P146
.annotate "line", 38
    find_lex $P147, "$no_plan"
    $P148 = "&infix:<=>"($P147, 1)
.annotate "line", 37
    .return ($P148)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "" :load :init :subid("post173") :outer("71_1267386528.16994")
.annotate "line", 37
    .const 'Sub' $P137 = "71_1267386528.16994" 
    .local pmc block
    set block, $P137
    $P149 = allocate_signature 0
    .local pmc signature_11
    set signature_11, $P149
    null $P0
    null $S0
    .local pmc signature
    set signature, signature_11
    setprop block, "$!signature", signature
.end


.HLL "perl6"

.namespace ["Test"]
.sub "pass"  :anon :subid("73_1267386528.16994") :outer("65_1267386528.16994")
    .param pmc param_190 :call_sig
.annotate "line", 49
    .const 'Sub' $P194 = "74_1267386528.16994" 
    capture_lex $P194
    new $P182, 'ExceptionHandler'
    set_addr $P182, control_181
    $P182."handle_types"(58)
    push_eh $P182
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P183
    find_lex_skip_current $P184, "$_"
    $P185 = new ['Perl6Scalar'], $P184
    setprop $P185, "rw", true
    .lex "$_", $P185
    find_lex_skip_current $P186, "$/"
    $P187 = new ['Perl6Scalar'], $P186
    setprop $P187, "rw", true
    .lex "$/", $P187
    find_lex_skip_current $P188, "$!"
    $P189 = new ['Perl6Scalar'], $P188
    setprop $P189, "rw", true
    .lex "$!", $P189
    .lex "call_sig", param_190
    new $P191, "Perl6Scalar"
    .lex "$desc", $P191
    find_lex $P192, "call_sig"
    bind_signature $P192
.annotate "line", 50
    find_lex $P197, "$desc"
    $P198 = "&proclaim"(1, $P197)
.annotate "line", 49
    .return ($P198)
  control_181:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P199, exception, "payload"
    .return ($P199)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "" :load :init :subid("post175") :outer("73_1267386528.16994")
.annotate "line", 49
    .const 'Sub' $P180 = "73_1267386528.16994" 
    .local pmc block
    set block, $P180
    get_hll_global $P200, "Sub"
    $P201 = $P200."new"(block, 0, "")
    .local pmc trait_subject
    set trait_subject, $P201
    get_hll_global $P202, ["Bool"], "True"
    "&trait_mod:<is>"(trait_subject, $P202 :named("export"))
.end


.HLL "perl6"

.namespace ["Test"]
.sub "_block193"  :anon :subid("74_1267386528.16994") :outer("73_1267386528.16994")
.annotate "line", 49
    $P195 = allocate_signature 1
    .local pmc signature_14
    set signature_14, $P195
    null $P0
    null $S0
    get_hll_global $P196, "Any"
    set_signature_elem signature_14, 0, "$desc", 128, $P196, $P0, $P0, $P0, $P0, $P0, $S0
    .local pmc signature
    set signature, signature_14
    .return (signature)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "ok"  :anon :subid("75_1267386528.16994") :outer("65_1267386528.16994")
    .param pmc param_218 :call_sig
.annotate "line", 53
    .const 'Sub' $P223 = "76_1267386528.16994" 
    capture_lex $P223
    new $P210, 'ExceptionHandler'
    set_addr $P210, control_209
    $P210."handle_types"(58)
    push_eh $P210
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P211
    find_lex_skip_current $P212, "$_"
    $P213 = new ['Perl6Scalar'], $P212
    setprop $P213, "rw", true
    .lex "$_", $P213
    find_lex_skip_current $P214, "$/"
    $P215 = new ['Perl6Scalar'], $P214
    setprop $P215, "rw", true
    .lex "$/", $P215
    find_lex_skip_current $P216, "$!"
    $P217 = new ['Perl6Scalar'], $P216
    setprop $P217, "rw", true
    .lex "$!", $P217
    .lex "call_sig", param_218
    new $P219, "Perl6Scalar"
    .lex "$cond", $P219
    new $P220, "Perl6Scalar"
    .lex "$desc", $P220
    find_lex $P221, "call_sig"
    bind_signature $P221
.annotate "line", 54
    find_lex $P227, "$cond"
    $P228 = "&prefix:<?>"($P227)
    find_lex $P229, "$desc"
    $P230 = "&proclaim"($P228, $P229)
.annotate "line", 53
    .return ($P230)
  control_209:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P231, exception, "payload"
    .return ($P231)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "" :load :init :subid("post177") :outer("75_1267386528.16994")
.annotate "line", 53
    .const 'Sub' $P208 = "75_1267386528.16994" 
    .local pmc block
    set block, $P208
    get_hll_global $P232, "Sub"
    $P233 = $P232."new"(block, 0, "")
    .local pmc trait_subject
    set trait_subject, $P233
    get_hll_global $P234, ["Bool"], "True"
    "&trait_mod:<is>"(trait_subject, $P234 :named("export"))
.end


.HLL "perl6"

.namespace ["Test"]
.sub "_block222"  :anon :subid("76_1267386528.16994") :outer("75_1267386528.16994")
.annotate "line", 53
    $P224 = allocate_signature 2
    .local pmc signature_15
    set signature_15, $P224
    null $P0
    null $S0
    get_hll_global $P225, "Mu"
    set_signature_elem signature_15, 0, "$cond", 128, $P225, $P0, $P0, $P0, $P0, $P0, $S0
    get_hll_global $P226, "Any"
    set_signature_elem signature_15, 1, "$desc", 128, $P226, $P0, $P0, $P0, $P0, $P0, $S0
    .local pmc signature
    set signature, signature_15
    .return (signature)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "ok"  :anon :subid("77_1267386528.16994") :outer("65_1267386528.16994")
    .param pmc param_248 :call_sig
.annotate "line", 57
    .const 'Sub' $P252 = "78_1267386528.16994" 
    capture_lex $P252
    new $P240, 'ExceptionHandler'
    set_addr $P240, control_239
    $P240."handle_types"(58)
    push_eh $P240
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P241
    find_lex_skip_current $P242, "$_"
    $P243 = new ['Perl6Scalar'], $P242
    setprop $P243, "rw", true
    .lex "$_", $P243
    find_lex_skip_current $P244, "$/"
    $P245 = new ['Perl6Scalar'], $P244
    setprop $P245, "rw", true
    .lex "$/", $P245
    find_lex_skip_current $P246, "$!"
    $P247 = new ['Perl6Scalar'], $P246
    setprop $P247, "rw", true
    .lex "$!", $P247
    .lex "call_sig", param_248
    new $P249, "Perl6Scalar"
    .lex "$cond", $P249
    find_lex $P250, "call_sig"
    bind_signature $P250
    find_lex $P255, "$cond"
    $P256 = "&prefix:<?>"($P255)
    new $P257, "Perl6Str"
    assign $P257, ""
    $P258 = "&ok"($P256, $P257)
    .return ($P258)
  control_239:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P259, exception, "payload"
    .return ($P259)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "" :load :init :subid("post178") :outer("77_1267386528.16994")
.annotate "line", 57
    .const 'Sub' $P238 = "77_1267386528.16994" 
    .local pmc block
    set block, $P238
    get_hll_global $P260, "Sub"
    $P261 = $P260."new"(block, 0, "")
    .local pmc trait_subject
    set trait_subject, $P261
    get_hll_global $P262, ["Bool"], "True"
    "&trait_mod:<is>"(trait_subject, $P262 :named("export"))
.end


.HLL "perl6"

.namespace ["Test"]
.sub "_block251"  :anon :subid("78_1267386528.16994") :outer("77_1267386528.16994")
.annotate "line", 57
    $P253 = allocate_signature 1
    .local pmc signature_16
    set signature_16, $P253
    null $P0
    null $S0
    get_hll_global $P254, "Mu"
    set_signature_elem signature_16, 0, "$cond", 128, $P254, $P0, $P0, $P0, $P0, $P0, $S0
    .local pmc signature
    set signature, signature_16
    .return (signature)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "nok"  :anon :subid("79_1267386528.16994") :outer("65_1267386528.16994")
    .param pmc param_278 :call_sig
.annotate "line", 60
    .const 'Sub' $P283 = "80_1267386528.16994" 
    capture_lex $P283
    new $P270, 'ExceptionHandler'
    set_addr $P270, control_269
    $P270."handle_types"(58)
    push_eh $P270
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P271
    find_lex_skip_current $P272, "$_"
    $P273 = new ['Perl6Scalar'], $P272
    setprop $P273, "rw", true
    .lex "$_", $P273
    find_lex_skip_current $P274, "$/"
    $P275 = new ['Perl6Scalar'], $P274
    setprop $P275, "rw", true
    .lex "$/", $P275
    find_lex_skip_current $P276, "$!"
    $P277 = new ['Perl6Scalar'], $P276
    setprop $P277, "rw", true
    .lex "$!", $P277
    .lex "call_sig", param_278
    new $P279, "Perl6Scalar"
    .lex "$cond", $P279
    new $P280, "Perl6Scalar"
    .lex "$desc", $P280
    find_lex $P281, "call_sig"
    bind_signature $P281
.annotate "line", 61
    find_lex $P287, "$cond"
    $P288 = "&prefix:<!>"($P287)
    find_lex $P289, "$desc"
    $P290 = "&proclaim"($P288, $P289)
.annotate "line", 60
    .return ($P290)
  control_269:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P291, exception, "payload"
    .return ($P291)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "" :load :init :subid("post180") :outer("79_1267386528.16994")
.annotate "line", 60
    .const 'Sub' $P268 = "79_1267386528.16994" 
    .local pmc block
    set block, $P268
    get_hll_global $P292, "Sub"
    $P293 = $P292."new"(block, 0, "")
    .local pmc trait_subject
    set trait_subject, $P293
    get_hll_global $P294, ["Bool"], "True"
    "&trait_mod:<is>"(trait_subject, $P294 :named("export"))
.end


.HLL "perl6"

.namespace ["Test"]
.sub "_block282"  :anon :subid("80_1267386528.16994") :outer("79_1267386528.16994")
.annotate "line", 60
    $P284 = allocate_signature 2
    .local pmc signature_17
    set signature_17, $P284
    null $P0
    null $S0
    get_hll_global $P285, "Mu"
    set_signature_elem signature_17, 0, "$cond", 128, $P285, $P0, $P0, $P0, $P0, $P0, $S0
    get_hll_global $P286, "Any"
    set_signature_elem signature_17, 1, "$desc", 128, $P286, $P0, $P0, $P0, $P0, $P0, $S0
    .local pmc signature
    set signature, signature_17
    .return (signature)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "nok"  :anon :subid("81_1267386528.16994") :outer("65_1267386528.16994")
    .param pmc param_308 :call_sig
.annotate "line", 64
    .const 'Sub' $P312 = "82_1267386528.16994" 
    capture_lex $P312
    new $P300, 'ExceptionHandler'
    set_addr $P300, control_299
    $P300."handle_types"(58)
    push_eh $P300
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P301
    find_lex_skip_current $P302, "$_"
    $P303 = new ['Perl6Scalar'], $P302
    setprop $P303, "rw", true
    .lex "$_", $P303
    find_lex_skip_current $P304, "$/"
    $P305 = new ['Perl6Scalar'], $P304
    setprop $P305, "rw", true
    .lex "$/", $P305
    find_lex_skip_current $P306, "$!"
    $P307 = new ['Perl6Scalar'], $P306
    setprop $P307, "rw", true
    .lex "$!", $P307
    .lex "call_sig", param_308
    new $P309, "Perl6Scalar"
    .lex "$cond", $P309
    find_lex $P310, "call_sig"
    bind_signature $P310
    find_lex $P315, "$cond"
    new $P316, "Perl6Str"
    assign $P316, ""
    $P317 = "&nok"($P315, $P316)
    .return ($P317)
  control_299:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P318, exception, "payload"
    .return ($P318)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "" :load :init :subid("post181") :outer("81_1267386528.16994")
.annotate "line", 64
    .const 'Sub' $P298 = "81_1267386528.16994" 
    .local pmc block
    set block, $P298
    get_hll_global $P319, "Sub"
    $P320 = $P319."new"(block, 0, "")
    .local pmc trait_subject
    set trait_subject, $P320
    get_hll_global $P321, ["Bool"], "True"
    "&trait_mod:<is>"(trait_subject, $P321 :named("export"))
.end


.HLL "perl6"

.namespace ["Test"]
.sub "_block311"  :anon :subid("82_1267386528.16994") :outer("81_1267386528.16994")
.annotate "line", 64
    $P313 = allocate_signature 1
    .local pmc signature_18
    set signature_18, $P313
    null $P0
    null $S0
    get_hll_global $P314, "Mu"
    set_signature_elem signature_18, 0, "$cond", 128, $P314, $P0, $P0, $P0, $P0, $P0, $S0
    .local pmc signature
    set signature, signature_18
    .return (signature)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "is"  :anon :subid("83_1267386528.16994") :outer("65_1267386528.16994")
    .param pmc param_338 :call_sig
.annotate "line", 67
    .const 'Sub' $P363 = "85_1267386528.16994" 
    capture_lex $P363
    .const 'Sub' $P344 = "84_1267386528.16994" 
    capture_lex $P344
    new $P329, 'ExceptionHandler'
    set_addr $P329, control_328
    $P329."handle_types"(58)
    push_eh $P329
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P330
    find_lex_skip_current $P331, "$_"
    $P332 = new ['Perl6Scalar'], $P331
    setprop $P332, "rw", true
    .lex "$_", $P332
    find_lex_skip_current $P333, "$/"
    $P334 = new ['Perl6Scalar'], $P333
    setprop $P334, "rw", true
    .lex "$/", $P334
    find_lex_skip_current $P335, "$!"
    $P336 = new ['Perl6Scalar'], $P335
    setprop $P336, "rw", true
    .lex "$!", $P336
.annotate "line", 69
    new $P337, "Perl6Scalar"
    setprop $P337, "rw", true
    setprop $P337, "scalar", true
    .lex "$test", $P337
    .lex "call_sig", param_338
    new $P339, "Perl6Scalar"
    .lex "$got", $P339
    new $P340, "Perl6Scalar"
    .lex "$expected", $P340
    new $P341, "Perl6Scalar"
    .lex "$desc", $P341
    find_lex $P342, "call_sig"
    bind_signature $P342
.annotate "line", 68
    find_lex $P349, "$got"
    descalarref $P350, $P349
    $P350."defined"()
.annotate "line", 69
    find_lex $P351, "$test"
    find_lex $P353, "$got"
    find_lex $P354, "$expected"
    $P352 = "&infix:<eq>"($P353, $P354)
  chain_end_184:
    "&infix:<=>"($P351, $P352)
.annotate "line", 70
    find_lex $P355, "$test"
    $P356 = "&prefix:<?>"($P355)
    find_lex $P357, "$desc"
    "&proclaim"($P356, $P357)
.annotate "line", 71
    find_lex $P360, "$test"
    $P361 = "&prefix:<!>"($P360)
    if $P361, if_359
    set $P358, $P361
    goto if_359_end
  if_359:
    .const 'Sub' $P363 = "85_1267386528.16994" 
    capture_lex $P363
    $P440 = $P363()
    set $P358, $P440
  if_359_end:
.annotate "line", 67
    .return ($P358)
  control_328:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P441, exception, "payload"
    .return ($P441)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "" :load :init :subid("post183") :outer("83_1267386528.16994")
.annotate "line", 67
    .const 'Sub' $P327 = "83_1267386528.16994" 
    .local pmc block
    set block, $P327
    get_hll_global $P442, "Sub"
    $P443 = $P442."new"(block, 0, "")
    .local pmc trait_subject
    set trait_subject, $P443
    get_hll_global $P444, ["Bool"], "True"
    "&trait_mod:<is>"(trait_subject, $P444 :named("export"))
.end


.HLL "perl6"

.namespace ["Test"]
.sub "_block343"  :anon :subid("84_1267386528.16994") :outer("83_1267386528.16994")
.annotate "line", 69
    $P345 = allocate_signature 3
    .local pmc signature_21
    set signature_21, $P345
    null $P0
    null $S0
    get_hll_global $P346, "Mu"
    set_signature_elem signature_21, 0, "$got", 128, $P346, $P0, $P0, $P0, $P0, $P0, $S0
    get_hll_global $P347, "Mu"
    set_signature_elem signature_21, 1, "$expected", 128, $P347, $P0, $P0, $P0, $P0, $P0, $S0
    get_hll_global $P348, "Any"
    set_signature_elem signature_21, 2, "$desc", 128, $P348, $P0, $P0, $P0, $P0, $P0, $S0
    .local pmc signature
    set signature, signature_21
    .return (signature)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "_block362"  :anon :subid("85_1267386528.16994") :outer("83_1267386528.16994")
    .param pmc param_373 :call_sig
.annotate "line", 71
    .const 'Sub' $P420 = "88_1267386528.16994" 
    capture_lex $P420
    .const 'Sub' $P395 = "87_1267386528.16994" 
    capture_lex $P395
    .const 'Sub' $P378 = "86_1267386528.16994" 
    capture_lex $P378
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P364
    find_lex_skip_current $P365, "$_"
    $P366 = new ['Perl6Scalar'], $P365
    setprop $P366, "rw", true
    .lex "$_", $P366
    find_lex_skip_current $P367, "$/"
    $P368 = new ['Perl6Scalar'], $P367
    setprop $P368, "rw", true
    .lex "$/", $P368
    find_lex_skip_current $P369, "$!"
    $P370 = new ['Perl6Scalar'], $P369
    setprop $P370, "rw", true
    .lex "$!", $P370
.annotate "line", 72
    new $P371, "Perl6Scalar"
    setprop $P371, "rw", true
    setprop $P371, "scalar", true
    .lex "$got_perl", $P371
.annotate "line", 73
    new $P372, "Perl6Scalar"
    setprop $P372, "rw", true
    setprop $P372, "scalar", true
    .lex "$expected_perl", $P372
    .lex "call_sig", param_373
    find_lex $P374, "call_sig"
    bind_signature $P374
.annotate "line", 72
    find_lex $P375, "$got_perl"
    push_eh catch_376
    .const 'Sub' $P378 = "86_1267386528.16994" 
    capture_lex $P378
    $P389 = $P378()
    pop_eh 
    $P390 = "!FAIL"()
    store_lex "$!", $P390
    goto catch_376_end
  catch_376:
    .get_results ($P391)
    $P0 = new ["Perl6Exception"]
    setattribute $P0, "$!exception", $P391
    store_lex "$!", $P0
    pop_eh 
  catch_376_end:
    "&infix:<=>"($P375, $P389)
.annotate "line", 73
    find_lex $P392, "$expected_perl"
    push_eh catch_393
    .const 'Sub' $P395 = "87_1267386528.16994" 
    capture_lex $P395
    $P406 = $P395()
    pop_eh 
    $P407 = "!FAIL"()
    store_lex "$!", $P407
    goto catch_393_end
  catch_393:
    .get_results ($P408)
    $P0 = new ["Perl6Exception"]
    setattribute $P0, "$!exception", $P408
    store_lex "$!", $P0
    pop_eh 
  catch_393_end:
    "&infix:<=>"($P392, $P406)
.annotate "line", 74
    find_lex $P413, "$got_perl"
    descalarref $P414, $P413
    $P415 = $P414."defined"()
    if $P415, if_412
    set $P411, $P415
    goto if_412_end
  if_412:
    find_lex $P416, "$expected_perl"
    descalarref $P417, $P416
    $P418 = $P417."defined"()
    set $P411, $P418
  if_412_end:
    if $P411, if_410
    set $P409, $P411
    goto if_410_end
  if_410:
    .const 'Sub' $P420 = "88_1267386528.16994" 
    capture_lex $P420
    $P438 = $P420()
    set $P409, $P438
  if_410_end:
.annotate "line", 71
    .return ($P409)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "" :load :init :subid("post185") :outer("85_1267386528.16994")
.annotate "line", 71
    .const 'Sub' $P363 = "85_1267386528.16994" 
    .local pmc block
    set block, $P363
    $P439 = allocate_signature 0
    .local pmc signature_20
    set signature_20, $P439
    null $P0
    null $S0
    .local pmc signature
    set signature, signature_20
    setprop block, "$!signature", signature
.end


.HLL "perl6"

.namespace ["Test"]
.sub "_block377"  :anon :subid("86_1267386528.16994") :outer("85_1267386528.16994")
.annotate "line", 72
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P379
    find_lex_skip_current $P380, "$_"
    $P381 = new ['Perl6Scalar'], $P380
    setprop $P381, "rw", true
    .lex "$_", $P381
    find_lex_skip_current $P382, "$/"
    $P383 = new ['Perl6Scalar'], $P382
    setprop $P383, "rw", true
    .lex "$/", $P383
    find_lex_skip_current $P384, "$!"
    $P385 = new ['Perl6Scalar'], $P384
    setprop $P385, "rw", true
    .lex "$!", $P385
    find_lex $P386, "$got"
    descalarref $P387, $P386
    $P388 = $P387."perl"()
    .return ($P388)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "_block394"  :anon :subid("87_1267386528.16994") :outer("85_1267386528.16994")
.annotate "line", 73
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P396
    find_lex_skip_current $P397, "$_"
    $P398 = new ['Perl6Scalar'], $P397
    setprop $P398, "rw", true
    .lex "$_", $P398
    find_lex_skip_current $P399, "$/"
    $P400 = new ['Perl6Scalar'], $P399
    setprop $P400, "rw", true
    .lex "$/", $P400
    find_lex_skip_current $P401, "$!"
    $P402 = new ['Perl6Scalar'], $P401
    setprop $P402, "rw", true
    .lex "$!", $P402
    find_lex $P403, "$expected"
    descalarref $P404, $P403
    $P405 = $P404."perl"()
    .return ($P405)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "_block419"  :anon :subid("88_1267386528.16994") :outer("85_1267386528.16994")
    .param pmc param_428 :call_sig
.annotate "line", 74
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P421
    find_lex_skip_current $P422, "$_"
    $P423 = new ['Perl6Scalar'], $P422
    setprop $P423, "rw", true
    .lex "$_", $P423
    find_lex_skip_current $P424, "$/"
    $P425 = new ['Perl6Scalar'], $P424
    setprop $P425, "rw", true
    .lex "$/", $P425
    find_lex_skip_current $P426, "$!"
    $P427 = new ['Perl6Scalar'], $P426
    setprop $P427, "rw", true
    .lex "$!", $P427
    .lex "call_sig", param_428
    find_lex $P429, "call_sig"
    bind_signature $P429
.annotate "line", 75
    new $P430, "Perl6Str"
    assign $P430, "     got: "
    find_lex $P431, "$got_perl"
    concat $P432, $P430, $P431
    "&diag"($P432)
.annotate "line", 76
    new $P433, "Perl6Str"
    assign $P433, "expected: "
    find_lex $P434, "$expected_perl"
    concat $P435, $P433, $P434
    $P436 = "&diag"($P435)
.annotate "line", 74
    .return ($P436)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "" :load :init :subid("post186") :outer("88_1267386528.16994")
.annotate "line", 74
    .const 'Sub' $P420 = "88_1267386528.16994" 
    .local pmc block
    set block, $P420
    $P437 = allocate_signature 0
    .local pmc signature_19
    set signature_19, $P437
    null $P0
    null $S0
    .local pmc signature
    set signature, signature_19
    setprop block, "$!signature", signature
.end


.HLL "perl6"

.namespace ["Test"]
.sub "is"  :anon :subid("89_1267386528.16994") :outer("65_1267386528.16994")
    .param pmc param_458 :call_sig
.annotate "line", 81
    .const 'Sub' $P463 = "90_1267386528.16994" 
    capture_lex $P463
    new $P450, 'ExceptionHandler'
    set_addr $P450, control_449
    $P450."handle_types"(58)
    push_eh $P450
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P451
    find_lex_skip_current $P452, "$_"
    $P453 = new ['Perl6Scalar'], $P452
    setprop $P453, "rw", true
    .lex "$_", $P453
    find_lex_skip_current $P454, "$/"
    $P455 = new ['Perl6Scalar'], $P454
    setprop $P455, "rw", true
    .lex "$/", $P455
    find_lex_skip_current $P456, "$!"
    $P457 = new ['Perl6Scalar'], $P456
    setprop $P457, "rw", true
    .lex "$!", $P457
    .lex "call_sig", param_458
    new $P459, "Perl6Scalar"
    .lex "$got", $P459
    new $P460, "Perl6Scalar"
    .lex "$expected", $P460
    find_lex $P461, "call_sig"
    bind_signature $P461
    find_lex $P467, "$got"
    find_lex $P468, "$expected"
    new $P469, "Perl6Str"
    assign $P469, ""
    $P470 = "&is"($P467, $P468, $P469)
    .return ($P470)
  control_449:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P471, exception, "payload"
    .return ($P471)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "" :load :init :subid("post187") :outer("89_1267386528.16994")
.annotate "line", 81
    .const 'Sub' $P448 = "89_1267386528.16994" 
    .local pmc block
    set block, $P448
    get_hll_global $P472, "Sub"
    $P473 = $P472."new"(block, 0, "")
    .local pmc trait_subject
    set trait_subject, $P473
    get_hll_global $P474, ["Bool"], "True"
    "&trait_mod:<is>"(trait_subject, $P474 :named("export"))
.end


.HLL "perl6"

.namespace ["Test"]
.sub "_block462"  :anon :subid("90_1267386528.16994") :outer("89_1267386528.16994")
.annotate "line", 81
    $P464 = allocate_signature 2
    .local pmc signature_22
    set signature_22, $P464
    null $P0
    null $S0
    get_hll_global $P465, "Mu"
    set_signature_elem signature_22, 0, "$got", 128, $P465, $P0, $P0, $P0, $P0, $P0, $S0
    get_hll_global $P466, "Mu"
    set_signature_elem signature_22, 1, "$expected", 128, $P466, $P0, $P0, $P0, $P0, $P0, $S0
    .local pmc signature
    set signature, signature_22
    .return (signature)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "isnt"  :anon :subid("91_1267386528.16994") :outer("65_1267386528.16994")
    .param pmc param_491 :call_sig
.annotate "line", 84
    .const 'Sub' $P497 = "92_1267386528.16994" 
    capture_lex $P497
    new $P482, 'ExceptionHandler'
    set_addr $P482, control_481
    $P482."handle_types"(58)
    push_eh $P482
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P483
    find_lex_skip_current $P484, "$_"
    $P485 = new ['Perl6Scalar'], $P484
    setprop $P485, "rw", true
    .lex "$_", $P485
    find_lex_skip_current $P486, "$/"
    $P487 = new ['Perl6Scalar'], $P486
    setprop $P487, "rw", true
    .lex "$/", $P487
    find_lex_skip_current $P488, "$!"
    $P489 = new ['Perl6Scalar'], $P488
    setprop $P489, "rw", true
    .lex "$!", $P489
.annotate "line", 85
    new $P490, "Perl6Scalar"
    setprop $P490, "rw", true
    setprop $P490, "scalar", true
    .lex "$test", $P490
    .lex "call_sig", param_491
    new $P492, "Perl6Scalar"
    .lex "$got", $P492
    new $P493, "Perl6Scalar"
    .lex "$expected", $P493
    new $P494, "Perl6Scalar"
    .lex "$desc", $P494
    find_lex $P495, "call_sig"
    bind_signature $P495
    find_lex $P502, "$test"
    find_lex $P504, "$got"
    find_lex $P505, "$expected"
    $P503 = "&infix:<eq>"($P504, $P505)
  chain_end_190:
    $P506 = "&prefix:<!>"($P503)
    "&infix:<=>"($P502, $P506)
.annotate "line", 86
    find_lex $P507, "$test"
    find_lex $P508, "$desc"
    $P509 = "&proclaim"($P507, $P508)
.annotate "line", 84
    .return ($P509)
  control_481:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P510, exception, "payload"
    .return ($P510)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "" :load :init :subid("post189") :outer("91_1267386528.16994")
.annotate "line", 84
    .const 'Sub' $P480 = "91_1267386528.16994" 
    .local pmc block
    set block, $P480
    get_hll_global $P511, "Sub"
    $P512 = $P511."new"(block, 0, "")
    .local pmc trait_subject
    set trait_subject, $P512
    get_hll_global $P513, ["Bool"], "True"
    "&trait_mod:<is>"(trait_subject, $P513 :named("export"))
.end


.HLL "perl6"

.namespace ["Test"]
.sub "_block496"  :anon :subid("92_1267386528.16994") :outer("91_1267386528.16994")
.annotate "line", 85
    $P498 = allocate_signature 3
    .local pmc signature_23
    set signature_23, $P498
    null $P0
    null $S0
    get_hll_global $P499, "Mu"
    set_signature_elem signature_23, 0, "$got", 128, $P499, $P0, $P0, $P0, $P0, $P0, $S0
    get_hll_global $P500, "Mu"
    set_signature_elem signature_23, 1, "$expected", 128, $P500, $P0, $P0, $P0, $P0, $P0, $S0
    get_hll_global $P501, "Any"
    set_signature_elem signature_23, 2, "$desc", 128, $P501, $P0, $P0, $P0, $P0, $P0, $S0
    .local pmc signature
    set signature, signature_23
    .return (signature)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "isnt"  :anon :subid("93_1267386528.16994") :outer("65_1267386528.16994")
    .param pmc param_527 :call_sig
.annotate "line", 89
    .const 'Sub' $P532 = "94_1267386528.16994" 
    capture_lex $P532
    new $P519, 'ExceptionHandler'
    set_addr $P519, control_518
    $P519."handle_types"(58)
    push_eh $P519
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P520
    find_lex_skip_current $P521, "$_"
    $P522 = new ['Perl6Scalar'], $P521
    setprop $P522, "rw", true
    .lex "$_", $P522
    find_lex_skip_current $P523, "$/"
    $P524 = new ['Perl6Scalar'], $P523
    setprop $P524, "rw", true
    .lex "$/", $P524
    find_lex_skip_current $P525, "$!"
    $P526 = new ['Perl6Scalar'], $P525
    setprop $P526, "rw", true
    .lex "$!", $P526
    .lex "call_sig", param_527
    new $P528, "Perl6Scalar"
    .lex "$got", $P528
    new $P529, "Perl6Scalar"
    .lex "$expected", $P529
    find_lex $P530, "call_sig"
    bind_signature $P530
    find_lex $P536, "$got"
    find_lex $P537, "$expected"
    new $P538, "Perl6Str"
    assign $P538, ""
    $P539 = "&isnt"($P536, $P537, $P538)
    .return ($P539)
  control_518:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P540, exception, "payload"
    .return ($P540)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "" :load :init :subid("post191") :outer("93_1267386528.16994")
.annotate "line", 89
    .const 'Sub' $P517 = "93_1267386528.16994" 
    .local pmc block
    set block, $P517
    get_hll_global $P541, "Sub"
    $P542 = $P541."new"(block, 0, "")
    .local pmc trait_subject
    set trait_subject, $P542
    get_hll_global $P543, ["Bool"], "True"
    "&trait_mod:<is>"(trait_subject, $P543 :named("export"))
.end


.HLL "perl6"

.namespace ["Test"]
.sub "_block531"  :anon :subid("94_1267386528.16994") :outer("93_1267386528.16994")
.annotate "line", 89
    $P533 = allocate_signature 2
    .local pmc signature_24
    set signature_24, $P533
    null $P0
    null $S0
    get_hll_global $P534, "Mu"
    set_signature_elem signature_24, 0, "$got", 128, $P534, $P0, $P0, $P0, $P0, $P0, $S0
    get_hll_global $P535, "Mu"
    set_signature_elem signature_24, 1, "$expected", 128, $P535, $P0, $P0, $P0, $P0, $P0, $S0
    .local pmc signature
    set signature, signature_24
    .return (signature)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "is_approx"  :anon :subid("95_1267386528.16994") :outer("65_1267386528.16994")
    .param pmc param_560 :call_sig
.annotate "line", 91
    .const 'Sub' $P566 = "96_1267386528.16994" 
    capture_lex $P566
    new $P551, 'ExceptionHandler'
    set_addr $P551, control_550
    $P551."handle_types"(58)
    push_eh $P551
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P552
    find_lex_skip_current $P553, "$_"
    $P554 = new ['Perl6Scalar'], $P553
    setprop $P554, "rw", true
    .lex "$_", $P554
    find_lex_skip_current $P555, "$/"
    $P556 = new ['Perl6Scalar'], $P555
    setprop $P556, "rw", true
    .lex "$/", $P556
    find_lex_skip_current $P557, "$!"
    $P558 = new ['Perl6Scalar'], $P557
    setprop $P558, "rw", true
    .lex "$!", $P558
.annotate "line", 92
    new $P559, "Perl6Scalar"
    setprop $P559, "rw", true
    setprop $P559, "scalar", true
    .lex "$test", $P559
    .lex "call_sig", param_560
    new $P561, "Perl6Scalar"
    .lex "$got", $P561
    new $P562, "Perl6Scalar"
    .lex "$expected", $P562
    new $P563, "Perl6Scalar"
    .lex "$desc", $P563
    find_lex $P564, "call_sig"
    bind_signature $P564
    find_lex $P571, "$test"
    find_lex $P573, "$got"
    find_lex $P574, "$expected"
    $P575 = "&infix:<->"($P573, $P574)
    descalarref $P576, $P575
    $P577 = $P576."abs"()
    get_hll_global $P578, "Rat"
    $P579 = $P578."new"(1, 100000)
    $P572 = "&infix:<<=>"($P577, $P579)
  chain_end_194:
    "&infix:<=>"($P571, $P572)
.annotate "line", 93
    find_lex $P580, "$test"
    $P581 = "&prefix:<?>"($P580)
    find_lex $P582, "$desc"
    $P583 = "&proclaim"($P581, $P582)
.annotate "line", 91
    .return ($P583)
  control_550:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P584, exception, "payload"
    .return ($P584)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "" :load :init :subid("post193") :outer("95_1267386528.16994")
.annotate "line", 91
    .const 'Sub' $P549 = "95_1267386528.16994" 
    .local pmc block
    set block, $P549
    get_hll_global $P585, "Sub"
    $P586 = $P585."new"(block, 0, "")
    .local pmc trait_subject
    set trait_subject, $P586
    get_hll_global $P587, ["Bool"], "True"
    "&trait_mod:<is>"(trait_subject, $P587 :named("export"))
.end


.HLL "perl6"

.namespace ["Test"]
.sub "_block565"  :anon :subid("96_1267386528.16994") :outer("95_1267386528.16994")
.annotate "line", 92
    $P567 = allocate_signature 3
    .local pmc signature_25
    set signature_25, $P567
    null $P0
    null $S0
    get_hll_global $P568, "Mu"
    set_signature_elem signature_25, 0, "$got", 128, $P568, $P0, $P0, $P0, $P0, $P0, $S0
    get_hll_global $P569, "Mu"
    set_signature_elem signature_25, 1, "$expected", 128, $P569, $P0, $P0, $P0, $P0, $P0, $S0
    get_hll_global $P570, "Any"
    set_signature_elem signature_25, 2, "$desc", 128, $P570, $P0, $P0, $P0, $P0, $P0, $S0
    .local pmc signature
    set signature, signature_25
    .return (signature)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "is_approx"  :anon :subid("97_1267386528.16994") :outer("65_1267386528.16994")
    .param pmc param_601 :call_sig
.annotate "line", 96
    .const 'Sub' $P606 = "98_1267386528.16994" 
    capture_lex $P606
    new $P593, 'ExceptionHandler'
    set_addr $P593, control_592
    $P593."handle_types"(58)
    push_eh $P593
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P594
    find_lex_skip_current $P595, "$_"
    $P596 = new ['Perl6Scalar'], $P595
    setprop $P596, "rw", true
    .lex "$_", $P596
    find_lex_skip_current $P597, "$/"
    $P598 = new ['Perl6Scalar'], $P597
    setprop $P598, "rw", true
    .lex "$/", $P598
    find_lex_skip_current $P599, "$!"
    $P600 = new ['Perl6Scalar'], $P599
    setprop $P600, "rw", true
    .lex "$!", $P600
    .lex "call_sig", param_601
    new $P602, "Perl6Scalar"
    .lex "$got", $P602
    new $P603, "Perl6Scalar"
    .lex "$expected", $P603
    find_lex $P604, "call_sig"
    bind_signature $P604
.annotate "line", 97
    find_lex $P610, "$got"
    find_lex $P611, "$expected"
    new $P612, "Perl6Str"
    assign $P612, ""
    $P613 = "&is_approx"($P610, $P611, $P612)
.annotate "line", 96
    .return ($P613)
  control_592:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P614, exception, "payload"
    .return ($P614)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "" :load :init :subid("post195") :outer("97_1267386528.16994")
.annotate "line", 96
    .const 'Sub' $P591 = "97_1267386528.16994" 
    .local pmc block
    set block, $P591
    get_hll_global $P615, "Sub"
    $P616 = $P615."new"(block, 0, "")
    .local pmc trait_subject
    set trait_subject, $P616
    get_hll_global $P617, ["Bool"], "True"
    "&trait_mod:<is>"(trait_subject, $P617 :named("export"))
.end


.HLL "perl6"

.namespace ["Test"]
.sub "_block605"  :anon :subid("98_1267386528.16994") :outer("97_1267386528.16994")
.annotate "line", 96
    $P607 = allocate_signature 2
    .local pmc signature_26
    set signature_26, $P607
    null $P0
    null $S0
    get_hll_global $P608, "Mu"
    set_signature_elem signature_26, 0, "$got", 128, $P608, $P0, $P0, $P0, $P0, $P0, $S0
    get_hll_global $P609, "Mu"
    set_signature_elem signature_26, 1, "$expected", 128, $P609, $P0, $P0, $P0, $P0, $P0, $S0
    .local pmc signature
    set signature, signature_26
    .return (signature)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "todo"  :anon :subid("99_1267386528.16994") :outer("65_1267386528.16994")
    .param pmc param_633 :call_sig
.annotate "line", 100
    .const 'Sub' $P638 = "100_1267386528.16994" 
    capture_lex $P638
    new $P625, 'ExceptionHandler'
    set_addr $P625, control_624
    $P625."handle_types"(58)
    push_eh $P625
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P626
    find_lex_skip_current $P627, "$_"
    $P628 = new ['Perl6Scalar'], $P627
    setprop $P628, "rw", true
    .lex "$_", $P628
    find_lex_skip_current $P629, "$/"
    $P630 = new ['Perl6Scalar'], $P629
    setprop $P630, "rw", true
    .lex "$/", $P630
    find_lex_skip_current $P631, "$!"
    $P632 = new ['Perl6Scalar'], $P631
    setprop $P632, "rw", true
    .lex "$!", $P632
    .lex "call_sig", param_633
    new $P634, "Perl6Scalar"
    .lex "$reason", $P634
    new $P635, "Perl6Scalar"
    .lex "$count", $P635
    find_lex $P636, "call_sig"
    bind_signature $P636
.annotate "line", 101
    find_lex $P642, "$todo_upto_test_num"
    find_lex $P643, "$num_of_tests_run"
    find_lex $P644, "$count"
    $P645 = "&infix:<+>"($P643, $P644)
    "&infix:<=>"($P642, $P645)
.annotate "line", 102
    find_lex $P646, "$todo_reason"
    new $P647, "Perl6Str"
    assign $P647, "# TODO "
    find_lex $P648, "$reason"
    $P649 = "&infix:<~>"($P647, $P648)
    $P650 = "&infix:<=>"($P646, $P649)
.annotate "line", 100
    .return ($P650)
  control_624:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P651, exception, "payload"
    .return ($P651)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "" :load :init :subid("post197") :outer("99_1267386528.16994")
.annotate "line", 100
    .const 'Sub' $P623 = "99_1267386528.16994" 
    .local pmc block
    set block, $P623
    get_hll_global $P652, "Sub"
    $P653 = $P652."new"(block, 0, "")
    .local pmc trait_subject
    set trait_subject, $P653
    get_hll_global $P654, ["Bool"], "True"
    "&trait_mod:<is>"(trait_subject, $P654 :named("export"))
.end


.HLL "perl6"

.namespace ["Test"]
.sub "_block637"  :anon :subid("100_1267386528.16994") :outer("99_1267386528.16994")
.annotate "line", 100
    $P639 = allocate_signature 2
    .local pmc signature_27
    set signature_27, $P639
    null $P0
    null $S0
    get_hll_global $P640, "Any"
    set_signature_elem signature_27, 0, "$reason", 128, $P640, $P0, $P0, $P0, $P0, $P0, $S0
    get_hll_global $P641, "Any"
    set_signature_elem signature_27, 1, "$count", 128, $P641, $P0, $P0, $P0, $P0, $P0, $S0
    .local pmc signature
    set signature, signature_27
    .return (signature)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "todo"  :anon :subid("101_1267386528.16994") :outer("65_1267386528.16994")
    .param pmc param_668 :call_sig
.annotate "line", 105
    .const 'Sub' $P672 = "102_1267386528.16994" 
    capture_lex $P672
    new $P660, 'ExceptionHandler'
    set_addr $P660, control_659
    $P660."handle_types"(58)
    push_eh $P660
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P661
    find_lex_skip_current $P662, "$_"
    $P663 = new ['Perl6Scalar'], $P662
    setprop $P663, "rw", true
    .lex "$_", $P663
    find_lex_skip_current $P664, "$/"
    $P665 = new ['Perl6Scalar'], $P664
    setprop $P665, "rw", true
    .lex "$/", $P665
    find_lex_skip_current $P666, "$!"
    $P667 = new ['Perl6Scalar'], $P666
    setprop $P667, "rw", true
    .lex "$!", $P667
    .lex "call_sig", param_668
    new $P669, "Perl6Scalar"
    .lex "$reason", $P669
    find_lex $P670, "call_sig"
    bind_signature $P670
.annotate "line", 106
    find_lex $P675, "$todo_upto_test_num"
    find_lex $P676, "$num_of_tests_run"
    $P677 = "&infix:<+>"($P676, 1)
    "&infix:<=>"($P675, $P677)
.annotate "line", 107
    find_lex $P678, "$todo_reason"
    new $P679, "Perl6Str"
    assign $P679, "# TODO "
    find_lex $P680, "$reason"
    $P681 = "&infix:<~>"($P679, $P680)
    $P682 = "&infix:<=>"($P678, $P681)
.annotate "line", 105
    .return ($P682)
  control_659:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P683, exception, "payload"
    .return ($P683)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "" :load :init :subid("post198") :outer("101_1267386528.16994")
.annotate "line", 105
    .const 'Sub' $P658 = "101_1267386528.16994" 
    .local pmc block
    set block, $P658
    get_hll_global $P684, "Sub"
    $P685 = $P684."new"(block, 0, "")
    .local pmc trait_subject
    set trait_subject, $P685
    get_hll_global $P686, ["Bool"], "True"
    "&trait_mod:<is>"(trait_subject, $P686 :named("export"))
.end


.HLL "perl6"

.namespace ["Test"]
.sub "_block671"  :anon :subid("102_1267386528.16994") :outer("101_1267386528.16994")
.annotate "line", 105
    $P673 = allocate_signature 1
    .local pmc signature_28
    set signature_28, $P673
    null $P0
    null $S0
    get_hll_global $P674, "Any"
    set_signature_elem signature_28, 0, "$reason", 128, $P674, $P0, $P0, $P0, $P0, $P0, $S0
    .local pmc signature
    set signature, signature_28
    .return (signature)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "skip"  :anon :subid("103_1267386528.16994") :outer("65_1267386528.16994")
    .param pmc param_702 :call_sig
.annotate "line", 110
    .const 'Sub' $P705 = "104_1267386528.16994" 
    capture_lex $P705
    new $P694, 'ExceptionHandler'
    set_addr $P694, control_693
    $P694."handle_types"(58)
    push_eh $P694
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P695
    find_lex_skip_current $P696, "$_"
    $P697 = new ['Perl6Scalar'], $P696
    setprop $P697, "rw", true
    .lex "$_", $P697
    find_lex_skip_current $P698, "$/"
    $P699 = new ['Perl6Scalar'], $P698
    setprop $P699, "rw", true
    .lex "$/", $P699
    find_lex_skip_current $P700, "$!"
    $P701 = new ['Perl6Scalar'], $P700
    setprop $P701, "rw", true
    .lex "$!", $P701
    .lex "call_sig", param_702
    find_lex $P703, "call_sig"
    bind_signature $P703
    new $P707, "Perl6Str"
    assign $P707, "# SKIP"
    $P708 = "&proclaim"(1, $P707)
    .return ($P708)
  control_693:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P709, exception, "payload"
    .return ($P709)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "" :load :init :subid("post200") :outer("103_1267386528.16994")
.annotate "line", 110
    .const 'Sub' $P692 = "103_1267386528.16994" 
    .local pmc block
    set block, $P692
    get_hll_global $P710, "Sub"
    $P711 = $P710."new"(block, 0, "")
    .local pmc trait_subject
    set trait_subject, $P711
    get_hll_global $P712, ["Bool"], "True"
    "&trait_mod:<is>"(trait_subject, $P712 :named("export"))
.end


.HLL "perl6"

.namespace ["Test"]
.sub "_block704"  :anon :subid("104_1267386528.16994") :outer("103_1267386528.16994")
.annotate "line", 110
    $P706 = allocate_signature 0
    .local pmc signature_29
    set signature_29, $P706
    null $P0
    null $S0
    .local pmc signature
    set signature, signature_29
    .return (signature)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "skip"  :anon :subid("105_1267386528.16994") :outer("65_1267386528.16994")
    .param pmc param_726 :call_sig
.annotate "line", 111
    .const 'Sub' $P730 = "106_1267386528.16994" 
    capture_lex $P730
    new $P718, 'ExceptionHandler'
    set_addr $P718, control_717
    $P718."handle_types"(58)
    push_eh $P718
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P719
    find_lex_skip_current $P720, "$_"
    $P721 = new ['Perl6Scalar'], $P720
    setprop $P721, "rw", true
    .lex "$_", $P721
    find_lex_skip_current $P722, "$/"
    $P723 = new ['Perl6Scalar'], $P722
    setprop $P723, "rw", true
    .lex "$/", $P723
    find_lex_skip_current $P724, "$!"
    $P725 = new ['Perl6Scalar'], $P724
    setprop $P725, "rw", true
    .lex "$!", $P725
    .lex "call_sig", param_726
    new $P727, "Perl6Scalar"
    .lex "$reason", $P727
    find_lex $P728, "call_sig"
    bind_signature $P728
    new $P733, "Perl6Str"
    assign $P733, "# SKIP "
    find_lex $P734, "$reason"
    $P735 = "&infix:<~>"($P733, $P734)
    $P736 = "&proclaim"(1, $P735)
    .return ($P736)
  control_717:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P737, exception, "payload"
    .return ($P737)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "" :load :init :subid("post201") :outer("105_1267386528.16994")
.annotate "line", 111
    .const 'Sub' $P716 = "105_1267386528.16994" 
    .local pmc block
    set block, $P716
    get_hll_global $P738, "Sub"
    $P739 = $P738."new"(block, 0, "")
    .local pmc trait_subject
    set trait_subject, $P739
    get_hll_global $P740, ["Bool"], "True"
    "&trait_mod:<is>"(trait_subject, $P740 :named("export"))
.end


.HLL "perl6"

.namespace ["Test"]
.sub "_block729"  :anon :subid("106_1267386528.16994") :outer("105_1267386528.16994")
.annotate "line", 111
    $P731 = allocate_signature 1
    .local pmc signature_30
    set signature_30, $P731
    null $P0
    null $S0
    get_hll_global $P732, "Any"
    set_signature_elem signature_30, 0, "$reason", 128, $P732, $P0, $P0, $P0, $P0, $P0, $S0
    .local pmc signature
    set signature, signature_30
    .return (signature)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "skip"  :anon :subid("107_1267386528.16994") :outer("65_1267386528.16994")
    .param pmc param_755 :call_sig
.annotate "line", 112
    .const 'Sub' $P769 = "109_1267386528.16994" 
    capture_lex $P769
    .const 'Sub' $P760 = "108_1267386528.16994" 
    capture_lex $P760
    new $P746, 'ExceptionHandler'
    set_addr $P746, control_745
    $P746."handle_types"(58)
    push_eh $P746
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P747
    find_lex_skip_current $P748, "$_"
    $P749 = new ['Perl6Scalar'], $P748
    setprop $P749, "rw", true
    .lex "$_", $P749
    find_lex_skip_current $P750, "$/"
    $P751 = new ['Perl6Scalar'], $P750
    setprop $P751, "rw", true
    .lex "$/", $P751
    find_lex_skip_current $P752, "$!"
    $P753 = new ['Perl6Scalar'], $P752
    setprop $P753, "rw", true
    .lex "$!", $P753
.annotate "line", 113
    new $P754, "Perl6Scalar"
    setprop $P754, "rw", true
    setprop $P754, "scalar", true
    .lex "$i", $P754
    .lex "call_sig", param_755
    new $P756, "Perl6Scalar"
    .lex "$count", $P756
    new $P757, "Perl6Scalar"
    .lex "$reason", $P757
    find_lex $P758, "call_sig"
    bind_signature $P758
    find_lex $P764, "$i"
    "&infix:<=>"($P764, 1)
.annotate "line", 114
    new $P788, 'ExceptionHandler'
    set_addr $P788, loop787_handler
    $P788."handle_types"(65, 67, 66)
    push_eh $P788
  loop787_test:
    find_lex $P766, "$i"
    find_lex $P767, "$count"
    $P765 = "&infix:<<=>"($P766, $P767)
  chain_end_203:
    unless $P765, loop787_done
  loop787_redo:
    .const 'Sub' $P769 = "109_1267386528.16994" 
    capture_lex $P769
    $P769()
  loop787_next:
    goto loop787_test
  loop787_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P789, exception, 'type'
    eq $P789, 65, loop787_next
    eq $P789, 67, loop787_redo
  loop787_done:
    pop_eh 
.annotate "line", 112
    .return ($P765)
  control_745:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P790, exception, "payload"
    .return ($P790)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "" :load :init :subid("post202") :outer("107_1267386528.16994")
.annotate "line", 112
    .const 'Sub' $P744 = "107_1267386528.16994" 
    .local pmc block
    set block, $P744
    get_hll_global $P791, "Sub"
    $P792 = $P791."new"(block, 0, "")
    .local pmc trait_subject
    set trait_subject, $P792
    get_hll_global $P793, ["Bool"], "True"
    "&trait_mod:<is>"(trait_subject, $P793 :named("export"))
.end


.HLL "perl6"

.namespace ["Test"]
.sub "_block759"  :anon :subid("108_1267386528.16994") :outer("107_1267386528.16994")
.annotate "line", 113
    $P761 = allocate_signature 2
    .local pmc signature_32
    set signature_32, $P761
    null $P0
    null $S0
    get_hll_global $P762, "Any"
    set_signature_elem signature_32, 0, "$count", 128, $P762, $P0, $P0, $P0, $P0, $P0, $S0
    get_hll_global $P763, "Any"
    set_signature_elem signature_32, 1, "$reason", 128, $P763, $P0, $P0, $P0, $P0, $P0, $S0
    .local pmc signature
    set signature, signature_32
    .return (signature)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "_block768"  :anon :subid("109_1267386528.16994") :outer("107_1267386528.16994")
    .param pmc param_777 :call_sig
.annotate "line", 114
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P770
    find_lex_skip_current $P771, "$_"
    $P772 = new ['Perl6Scalar'], $P771
    setprop $P772, "rw", true
    .lex "$_", $P772
    find_lex_skip_current $P773, "$/"
    $P774 = new ['Perl6Scalar'], $P773
    setprop $P774, "rw", true
    .lex "$/", $P774
    find_lex_skip_current $P775, "$!"
    $P776 = new ['Perl6Scalar'], $P775
    setprop $P776, "rw", true
    .lex "$!", $P776
    .lex "call_sig", param_777
    find_lex $P778, "call_sig"
    bind_signature $P778
    new $P779, "Perl6Str"
    assign $P779, "# SKIP "
    find_lex $P780, "$reason"
    $P781 = "&infix:<~>"($P779, $P780)
    "&proclaim"(1, $P781)
    find_lex $P782, "$i"
    find_lex $P783, "$i"
    $P784 = "&infix:<+>"($P783, 1)
    $P785 = "&infix:<=>"($P782, $P784)
    .return ($P785)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "" :load :init :subid("post204") :outer("109_1267386528.16994")
.annotate "line", 114
    .const 'Sub' $P769 = "109_1267386528.16994" 
    .local pmc block
    set block, $P769
    $P786 = allocate_signature 0
    .local pmc signature_31
    set signature_31, $P786
    null $P0
    null $S0
    .local pmc signature
    set signature, signature_31
    setprop block, "$!signature", signature
.end


.HLL "perl6"

.namespace ["Test"]
.sub "skip_rest"  :anon :subid("110_1267386528.16994") :outer("65_1267386528.16994")
    .param pmc param_809 :call_sig
.annotate "line", 117
    .const 'Sub' $P812 = "111_1267386528.16994" 
    capture_lex $P812
    new $P801, 'ExceptionHandler'
    set_addr $P801, control_800
    $P801."handle_types"(58)
    push_eh $P801
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P802
    find_lex_skip_current $P803, "$_"
    $P804 = new ['Perl6Scalar'], $P803
    setprop $P804, "rw", true
    .lex "$_", $P804
    find_lex_skip_current $P805, "$/"
    $P806 = new ['Perl6Scalar'], $P805
    setprop $P806, "rw", true
    .lex "$/", $P806
    find_lex_skip_current $P807, "$!"
    $P808 = new ['Perl6Scalar'], $P807
    setprop $P808, "rw", true
    .lex "$!", $P808
    .lex "call_sig", param_809
    find_lex $P810, "call_sig"
    bind_signature $P810
.annotate "line", 118
    find_lex $P814, "$num_of_tests_planned"
    find_lex $P815, "$num_of_tests_run"
    $P816 = "&infix:<->"($P814, $P815)
    new $P817, "Perl6Str"
    assign $P817, ""
    $P818 = "&skip"($P816, $P817)
.annotate "line", 117
    .return ($P818)
  control_800:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P819, exception, "payload"
    .return ($P819)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "" :load :init :subid("post206") :outer("110_1267386528.16994")
.annotate "line", 117
    .const 'Sub' $P799 = "110_1267386528.16994" 
    .local pmc block
    set block, $P799
    get_hll_global $P820, "Sub"
    $P821 = $P820."new"(block, 0, "")
    .local pmc trait_subject
    set trait_subject, $P821
    get_hll_global $P822, ["Bool"], "True"
    "&trait_mod:<is>"(trait_subject, $P822 :named("export"))
.end


.HLL "perl6"

.namespace ["Test"]
.sub "_block811"  :anon :subid("111_1267386528.16994") :outer("110_1267386528.16994")
.annotate "line", 117
    $P813 = allocate_signature 0
    .local pmc signature_33
    set signature_33, $P813
    null $P0
    null $S0
    .local pmc signature
    set signature, signature_33
    .return (signature)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "skip_rest"  :anon :subid("112_1267386528.16994") :outer("65_1267386528.16994")
    .param pmc param_836 :call_sig
.annotate "line", 121
    .const 'Sub' $P840 = "113_1267386528.16994" 
    capture_lex $P840
    new $P828, 'ExceptionHandler'
    set_addr $P828, control_827
    $P828."handle_types"(58)
    push_eh $P828
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P829
    find_lex_skip_current $P830, "$_"
    $P831 = new ['Perl6Scalar'], $P830
    setprop $P831, "rw", true
    .lex "$_", $P831
    find_lex_skip_current $P832, "$/"
    $P833 = new ['Perl6Scalar'], $P832
    setprop $P833, "rw", true
    .lex "$/", $P833
    find_lex_skip_current $P834, "$!"
    $P835 = new ['Perl6Scalar'], $P834
    setprop $P835, "rw", true
    .lex "$!", $P835
    .lex "call_sig", param_836
    new $P837, "Perl6Scalar"
    .lex "$reason", $P837
    find_lex $P838, "call_sig"
    bind_signature $P838
.annotate "line", 122
    find_lex $P843, "$num_of_tests_planned"
    find_lex $P844, "$num_of_tests_run"
    $P845 = "&infix:<->"($P843, $P844)
    find_lex $P846, "$reason"
    $P847 = "&skip"($P845, $P846)
.annotate "line", 121
    .return ($P847)
  control_827:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P848, exception, "payload"
    .return ($P848)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "" :load :init :subid("post207") :outer("112_1267386528.16994")
.annotate "line", 121
    .const 'Sub' $P826 = "112_1267386528.16994" 
    .local pmc block
    set block, $P826
    get_hll_global $P849, "Sub"
    $P850 = $P849."new"(block, 0, "")
    .local pmc trait_subject
    set trait_subject, $P850
    get_hll_global $P851, ["Bool"], "True"
    "&trait_mod:<is>"(trait_subject, $P851 :named("export"))
.end


.HLL "perl6"

.namespace ["Test"]
.sub "_block839"  :anon :subid("113_1267386528.16994") :outer("112_1267386528.16994")
.annotate "line", 121
    $P841 = allocate_signature 1
    .local pmc signature_34
    set signature_34, $P841
    null $P0
    null $S0
    get_hll_global $P842, "Any"
    set_signature_elem signature_34, 0, "$reason", 128, $P842, $P0, $P0, $P0, $P0, $P0, $S0
    .local pmc signature
    set signature, signature_34
    .return (signature)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "diag"  :anon :subid("114_1267386528.16994") :outer("65_1267386528.16994")
    .param pmc param_866 :call_sig
.annotate "line", 125
    .const 'Sub' $P870 = "115_1267386528.16994" 
    capture_lex $P870
    new $P858, 'ExceptionHandler'
    set_addr $P858, control_857
    $P858."handle_types"(58)
    push_eh $P858
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P859
    find_lex_skip_current $P860, "$_"
    $P861 = new ['Perl6Scalar'], $P860
    setprop $P861, "rw", true
    .lex "$_", $P861
    find_lex_skip_current $P862, "$/"
    $P863 = new ['Perl6Scalar'], $P862
    setprop $P863, "rw", true
    .lex "$/", $P863
    find_lex_skip_current $P864, "$!"
    $P865 = new ['Perl6Scalar'], $P864
    setprop $P865, "rw", true
    .lex "$!", $P865
    .lex "call_sig", param_866
    new $P867, "Perl6Scalar"
    .lex "$message", $P867
    find_lex $P868, "call_sig"
    bind_signature $P868
    new $P873, "Perl6Str"
    assign $P873, "# "
    find_lex $P874, "$message"
    $P875 = "&infix:<~>"($P873, $P874)
    $P876 = "&say"($P875)
    .return ($P876)
  control_857:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P877, exception, "payload"
    .return ($P877)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "" :load :init :subid("post208") :outer("114_1267386528.16994")
.annotate "line", 125
    .const 'Sub' $P856 = "114_1267386528.16994" 
    .local pmc block
    set block, $P856
    get_hll_global $P878, "Sub"
    $P879 = $P878."new"(block, 0, "")
    .local pmc trait_subject
    set trait_subject, $P879
    get_hll_global $P880, ["Bool"], "True"
    "&trait_mod:<is>"(trait_subject, $P880 :named("export"))
.end


.HLL "perl6"

.namespace ["Test"]
.sub "_block869"  :anon :subid("115_1267386528.16994") :outer("114_1267386528.16994")
.annotate "line", 125
    $P871 = allocate_signature 1
    .local pmc signature_35
    set signature_35, $P871
    null $P0
    null $S0
    get_hll_global $P872, "Any"
    set_signature_elem signature_35, 0, "$message", 128, $P872, $P0, $P0, $P0, $P0, $P0, $S0
    .local pmc signature
    set signature, signature_35
    .return (signature)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "flunk"  :anon :subid("116_1267386528.16994") :outer("65_1267386528.16994")
    .param pmc param_895 :call_sig
.annotate "line", 128
    .const 'Sub' $P899 = "117_1267386528.16994" 
    capture_lex $P899
    new $P887, 'ExceptionHandler'
    set_addr $P887, control_886
    $P887."handle_types"(58)
    push_eh $P887
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P888
    find_lex_skip_current $P889, "$_"
    $P890 = new ['Perl6Scalar'], $P889
    setprop $P890, "rw", true
    .lex "$_", $P890
    find_lex_skip_current $P891, "$/"
    $P892 = new ['Perl6Scalar'], $P891
    setprop $P892, "rw", true
    .lex "$/", $P892
    find_lex_skip_current $P893, "$!"
    $P894 = new ['Perl6Scalar'], $P893
    setprop $P894, "rw", true
    .lex "$!", $P894
    .lex "call_sig", param_895
    new $P896, "Perl6Scalar"
    .lex "$reason", $P896
    find_lex $P897, "call_sig"
    bind_signature $P897
    new $P902, "Perl6Str"
    assign $P902, "flunk "
    find_lex $P903, "$reason"
    concat $P904, $P902, $P903
    $P905 = "&proclaim"(0, $P904)
    .return ($P905)
  control_886:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P906, exception, "payload"
    .return ($P906)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "" :load :init :subid("post210") :outer("116_1267386528.16994")
.annotate "line", 128
    .const 'Sub' $P885 = "116_1267386528.16994" 
    .local pmc block
    set block, $P885
    get_hll_global $P907, "Sub"
    $P908 = $P907."new"(block, 0, "")
    .local pmc trait_subject
    set trait_subject, $P908
    get_hll_global $P909, ["Bool"], "True"
    "&trait_mod:<is>"(trait_subject, $P909 :named("export"))
.end


.HLL "perl6"

.namespace ["Test"]
.sub "_block898"  :anon :subid("117_1267386528.16994") :outer("116_1267386528.16994")
.annotate "line", 128
    $P900 = allocate_signature 1
    .local pmc signature_36
    set signature_36, $P900
    null $P0
    null $S0
    get_hll_global $P901, "Any"
    set_signature_elem signature_36, 0, "$reason", 128, $P901, $P0, $P0, $P0, $P0, $P0, $S0
    .local pmc signature
    set signature, signature_36
    .return (signature)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "isa_ok"  :anon :subid("118_1267386528.16994") :outer("65_1267386528.16994")
    .param pmc param_925 :call_sig
.annotate "line", 131
    .const 'Sub' $P930 = "119_1267386528.16994" 
    capture_lex $P930
    new $P917, 'ExceptionHandler'
    set_addr $P917, control_916
    $P917."handle_types"(58)
    push_eh $P917
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P918
    find_lex_skip_current $P919, "$_"
    $P920 = new ['Perl6Scalar'], $P919
    setprop $P920, "rw", true
    .lex "$_", $P920
    find_lex_skip_current $P921, "$/"
    $P922 = new ['Perl6Scalar'], $P921
    setprop $P922, "rw", true
    .lex "$/", $P922
    find_lex_skip_current $P923, "$!"
    $P924 = new ['Perl6Scalar'], $P923
    setprop $P924, "rw", true
    .lex "$!", $P924
    .lex "call_sig", param_925
    new $P926, "Perl6Scalar"
    .lex "$var", $P926
    new $P927, "Perl6Scalar"
    .lex "$type", $P927
    find_lex $P928, "call_sig"
    bind_signature $P928
.annotate "line", 132
    find_lex $P934, "$var"
    descalarref $P935, $P934
    find_lex $P936, "$type"
    $P937 = $P935."isa"($P936)
    new $P938, "Perl6Str"
    assign $P938, "The object is-a '"
    find_lex $P939, "$type"
    concat $P940, $P938, $P939
    new $P941, "Perl6Str"
    assign $P941, "'"
    concat $P942, $P940, $P941
    $P943 = "&ok"($P937, $P942)
.annotate "line", 131
    .return ($P943)
  control_916:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P944, exception, "payload"
    .return ($P944)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "" :load :init :subid("post212") :outer("118_1267386528.16994")
.annotate "line", 131
    .const 'Sub' $P915 = "118_1267386528.16994" 
    .local pmc block
    set block, $P915
    get_hll_global $P945, "Sub"
    $P946 = $P945."new"(block, 0, "")
    .local pmc trait_subject
    set trait_subject, $P946
    get_hll_global $P947, ["Bool"], "True"
    "&trait_mod:<is>"(trait_subject, $P947 :named("export"))
.end


.HLL "perl6"

.namespace ["Test"]
.sub "_block929"  :anon :subid("119_1267386528.16994") :outer("118_1267386528.16994")
.annotate "line", 131
    $P931 = allocate_signature 2
    .local pmc signature_37
    set signature_37, $P931
    null $P0
    null $S0
    get_hll_global $P932, "Mu"
    set_signature_elem signature_37, 0, "$var", 128, $P932, $P0, $P0, $P0, $P0, $P0, $S0
    get_hll_global $P933, "Any"
    set_signature_elem signature_37, 1, "$type", 128, $P933, $P0, $P0, $P0, $P0, $P0, $S0
    .local pmc signature
    set signature, signature_37
    .return (signature)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "isa_ok"  :anon :subid("120_1267386528.16994") :outer("65_1267386528.16994")
    .param pmc param_961 :call_sig
.annotate "line", 134
    .const 'Sub' $P967 = "121_1267386528.16994" 
    capture_lex $P967
    new $P953, 'ExceptionHandler'
    set_addr $P953, control_952
    $P953."handle_types"(58)
    push_eh $P953
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P954
    find_lex_skip_current $P955, "$_"
    $P956 = new ['Perl6Scalar'], $P955
    setprop $P956, "rw", true
    .lex "$_", $P956
    find_lex_skip_current $P957, "$/"
    $P958 = new ['Perl6Scalar'], $P957
    setprop $P958, "rw", true
    .lex "$/", $P958
    find_lex_skip_current $P959, "$!"
    $P960 = new ['Perl6Scalar'], $P959
    setprop $P960, "rw", true
    .lex "$!", $P960
    .lex "call_sig", param_961
    new $P962, "Perl6Scalar"
    .lex "$var", $P962
    new $P963, "Perl6Scalar"
    .lex "$type", $P963
    new $P964, "Perl6Scalar"
    .lex "$msg", $P964
    find_lex $P965, "call_sig"
    bind_signature $P965
    find_lex $P972, "$var"
    descalarref $P973, $P972
    find_lex $P974, "$type"
    $P975 = $P973."isa"($P974)
    find_lex $P976, "$msg"
    $P977 = "&ok"($P975, $P976)
    .return ($P977)
  control_952:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P978, exception, "payload"
    .return ($P978)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "" :load :init :subid("post213") :outer("120_1267386528.16994")
.annotate "line", 134
    .const 'Sub' $P951 = "120_1267386528.16994" 
    .local pmc block
    set block, $P951
    get_hll_global $P979, "Sub"
    $P980 = $P979."new"(block, 0, "")
    .local pmc trait_subject
    set trait_subject, $P980
    get_hll_global $P981, ["Bool"], "True"
    "&trait_mod:<is>"(trait_subject, $P981 :named("export"))
.end


.HLL "perl6"

.namespace ["Test"]
.sub "_block966"  :anon :subid("121_1267386528.16994") :outer("120_1267386528.16994")
.annotate "line", 134
    $P968 = allocate_signature 3
    .local pmc signature_38
    set signature_38, $P968
    null $P0
    null $S0
    get_hll_global $P969, "Mu"
    set_signature_elem signature_38, 0, "$var", 128, $P969, $P0, $P0, $P0, $P0, $P0, $S0
    get_hll_global $P970, "Any"
    set_signature_elem signature_38, 1, "$type", 128, $P970, $P0, $P0, $P0, $P0, $P0, $S0
    get_hll_global $P971, "Any"
    set_signature_elem signature_38, 2, "$msg", 128, $P971, $P0, $P0, $P0, $P0, $P0, $S0
    .local pmc signature
    set signature, signature_38
    .return (signature)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "dies_ok"  :anon :subid("122_1267386528.16994") :outer("65_1267386528.16994")
    .param pmc param_997 :call_sig
.annotate "line", 136
    .const 'Sub' $P1008 = "124_1267386528.16994" 
    capture_lex $P1008
    .const 'Sub' $P1002 = "123_1267386528.16994" 
    capture_lex $P1002
    new $P989, 'ExceptionHandler'
    set_addr $P989, control_988
    $P989."handle_types"(58)
    push_eh $P989
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P990
    find_lex_skip_current $P991, "$_"
    $P992 = new ['Perl6Scalar'], $P991
    setprop $P992, "rw", true
    .lex "$_", $P992
    find_lex_skip_current $P993, "$/"
    $P994 = new ['Perl6Scalar'], $P993
    setprop $P994, "rw", true
    .lex "$/", $P994
    find_lex_skip_current $P995, "$!"
    $P996 = new ['Perl6Scalar'], $P995
    setprop $P996, "rw", true
    .lex "$!", $P996
    .lex "call_sig", param_997
    new $P998, "Perl6Scalar"
    .lex "$closure", $P998
    new $P999, "Perl6Scalar"
    .lex "$reason", $P999
    find_lex $P1000, "call_sig"
    bind_signature $P1000
    push_eh catch_1006
.annotate "line", 137
    .const 'Sub' $P1008 = "124_1267386528.16994" 
    capture_lex $P1008
    $P1008()
    pop_eh 
    $P1018 = "!FAIL"()
    store_lex "$!", $P1018
    goto catch_1006_end
  catch_1006:
    .get_results ($P1019)
    $P0 = new ["Perl6Exception"]
    setattribute $P0, "$!exception", $P1019
    store_lex "$!", $P0
    pop_eh 
  catch_1006_end:
.annotate "line", 143
    find_lex $P1020, "$!"
    $P1021 = "&prefix:<defined>"($P1020)
    find_lex $P1022, "$reason"
    $P1023 = "&proclaim"($P1021, $P1022)
.annotate "line", 136
    .return ($P1023)
  control_988:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1024, exception, "payload"
    .return ($P1024)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "" :load :init :subid("post215") :outer("122_1267386528.16994")
.annotate "line", 136
    .const 'Sub' $P987 = "122_1267386528.16994" 
    .local pmc block
    set block, $P987
    get_hll_global $P1025, "Sub"
    $P1026 = $P1025."new"(block, 0, "")
    .local pmc trait_subject
    set trait_subject, $P1026
    get_hll_global $P1027, ["Bool"], "True"
    "&trait_mod:<is>"(trait_subject, $P1027 :named("export"))
.end


.HLL "perl6"

.namespace ["Test"]
.sub "_block1001"  :anon :subid("123_1267386528.16994") :outer("122_1267386528.16994")
.annotate "line", 136
    $P1003 = allocate_signature 2
    .local pmc signature_39
    set signature_39, $P1003
    null $P0
    null $S0
    get_hll_global $P1004, "Any"
    set_signature_elem signature_39, 0, "$closure", 128, $P1004, $P0, $P0, $P0, $P0, $P0, $S0
    get_hll_global $P1005, "Any"
    set_signature_elem signature_39, 1, "$reason", 128, $P1005, $P0, $P0, $P0, $P0, $P0, $S0
    .local pmc signature
    set signature, signature_39
    .return (signature)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "_block1007"  :anon :subid("124_1267386528.16994") :outer("122_1267386528.16994")
.annotate "line", 137
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P1009
    find_lex_skip_current $P1010, "$_"
    $P1011 = new ['Perl6Scalar'], $P1010
    setprop $P1011, "rw", true
    .lex "$_", $P1011
    find_lex_skip_current $P1012, "$/"
    $P1013 = new ['Perl6Scalar'], $P1012
    setprop $P1013, "rw", true
    .lex "$/", $P1013
    find_lex_skip_current $P1014, "$!"
    $P1015 = new ['Perl6Scalar'], $P1014
    setprop $P1015, "rw", true
    .lex "$!", $P1015
.annotate "line", 138
    find_lex $P1016, "$closure"
    $P1017 = $P1016()
.annotate "line", 137
    .return ($P1017)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "dies_ok"  :anon :subid("125_1267386528.16994") :outer("65_1267386528.16994")
    .param pmc param_1041 :call_sig
.annotate "line", 146
    .const 'Sub' $P1045 = "126_1267386528.16994" 
    capture_lex $P1045
    new $P1033, 'ExceptionHandler'
    set_addr $P1033, control_1032
    $P1033."handle_types"(58)
    push_eh $P1033
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P1034
    find_lex_skip_current $P1035, "$_"
    $P1036 = new ['Perl6Scalar'], $P1035
    setprop $P1036, "rw", true
    .lex "$_", $P1036
    find_lex_skip_current $P1037, "$/"
    $P1038 = new ['Perl6Scalar'], $P1037
    setprop $P1038, "rw", true
    .lex "$/", $P1038
    find_lex_skip_current $P1039, "$!"
    $P1040 = new ['Perl6Scalar'], $P1039
    setprop $P1040, "rw", true
    .lex "$!", $P1040
    .lex "call_sig", param_1041
    new $P1042, "Perl6Scalar"
    .lex "$closure", $P1042
    find_lex $P1043, "call_sig"
    bind_signature $P1043
.annotate "line", 147
    find_lex $P1048, "$closure"
    new $P1049, "Perl6Str"
    assign $P1049, ""
    $P1050 = "&dies_ok"($P1048, $P1049)
.annotate "line", 146
    .return ($P1050)
  control_1032:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1051, exception, "payload"
    .return ($P1051)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "" :load :init :subid("post216") :outer("125_1267386528.16994")
.annotate "line", 146
    .const 'Sub' $P1031 = "125_1267386528.16994" 
    .local pmc block
    set block, $P1031
    get_hll_global $P1052, "Sub"
    $P1053 = $P1052."new"(block, 0, "")
    .local pmc trait_subject
    set trait_subject, $P1053
    get_hll_global $P1054, ["Bool"], "True"
    "&trait_mod:<is>"(trait_subject, $P1054 :named("export"))
.end


.HLL "perl6"

.namespace ["Test"]
.sub "_block1044"  :anon :subid("126_1267386528.16994") :outer("125_1267386528.16994")
.annotate "line", 146
    $P1046 = allocate_signature 1
    .local pmc signature_40
    set signature_40, $P1046
    null $P0
    null $S0
    get_hll_global $P1047, "Any"
    set_signature_elem signature_40, 0, "$closure", 128, $P1047, $P0, $P0, $P0, $P0, $P0, $S0
    .local pmc signature
    set signature, signature_40
    .return (signature)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "lives_ok"  :anon :subid("127_1267386528.16994") :outer("65_1267386528.16994")
    .param pmc param_1070 :call_sig
.annotate "line", 150
    .const 'Sub' $P1081 = "129_1267386528.16994" 
    capture_lex $P1081
    .const 'Sub' $P1075 = "128_1267386528.16994" 
    capture_lex $P1075
    new $P1062, 'ExceptionHandler'
    set_addr $P1062, control_1061
    $P1062."handle_types"(58)
    push_eh $P1062
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P1063
    find_lex_skip_current $P1064, "$_"
    $P1065 = new ['Perl6Scalar'], $P1064
    setprop $P1065, "rw", true
    .lex "$_", $P1065
    find_lex_skip_current $P1066, "$/"
    $P1067 = new ['Perl6Scalar'], $P1066
    setprop $P1067, "rw", true
    .lex "$/", $P1067
    find_lex_skip_current $P1068, "$!"
    $P1069 = new ['Perl6Scalar'], $P1068
    setprop $P1069, "rw", true
    .lex "$!", $P1069
    .lex "call_sig", param_1070
    new $P1071, "Perl6Scalar"
    .lex "$closure", $P1071
    new $P1072, "Perl6Scalar"
    .lex "$reason", $P1072
    find_lex $P1073, "call_sig"
    bind_signature $P1073
    push_eh catch_1079
.annotate "line", 151
    .const 'Sub' $P1081 = "129_1267386528.16994" 
    capture_lex $P1081
    $P1081()
    pop_eh 
    $P1091 = "!FAIL"()
    store_lex "$!", $P1091
    goto catch_1079_end
  catch_1079:
    .get_results ($P1092)
    $P0 = new ["Perl6Exception"]
    setattribute $P0, "$!exception", $P1092
    store_lex "$!", $P0
    pop_eh 
  catch_1079_end:
.annotate "line", 154
    find_lex $P1093, "$!"
    $P1094 = "&prefix:<defined>"($P1093)
    $P1095 = "&prefix:<not>"($P1094)
    find_lex $P1096, "$reason"
    $P1097 = "&proclaim"($P1095, $P1096)
.annotate "line", 150
    .return ($P1097)
  control_1061:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1098, exception, "payload"
    .return ($P1098)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "" :load :init :subid("post218") :outer("127_1267386528.16994")
.annotate "line", 150
    .const 'Sub' $P1060 = "127_1267386528.16994" 
    .local pmc block
    set block, $P1060
    get_hll_global $P1099, "Sub"
    $P1100 = $P1099."new"(block, 0, "")
    .local pmc trait_subject
    set trait_subject, $P1100
    get_hll_global $P1101, ["Bool"], "True"
    "&trait_mod:<is>"(trait_subject, $P1101 :named("export"))
.end


.HLL "perl6"

.namespace ["Test"]
.sub "_block1074"  :anon :subid("128_1267386528.16994") :outer("127_1267386528.16994")
.annotate "line", 150
    $P1076 = allocate_signature 2
    .local pmc signature_41
    set signature_41, $P1076
    null $P0
    null $S0
    get_hll_global $P1077, "Any"
    set_signature_elem signature_41, 0, "$closure", 128, $P1077, $P0, $P0, $P0, $P0, $P0, $S0
    get_hll_global $P1078, "Any"
    set_signature_elem signature_41, 1, "$reason", 128, $P1078, $P0, $P0, $P0, $P0, $P0, $S0
    .local pmc signature
    set signature, signature_41
    .return (signature)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "_block1080"  :anon :subid("129_1267386528.16994") :outer("127_1267386528.16994")
.annotate "line", 151
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P1082
    find_lex_skip_current $P1083, "$_"
    $P1084 = new ['Perl6Scalar'], $P1083
    setprop $P1084, "rw", true
    .lex "$_", $P1084
    find_lex_skip_current $P1085, "$/"
    $P1086 = new ['Perl6Scalar'], $P1085
    setprop $P1086, "rw", true
    .lex "$/", $P1086
    find_lex_skip_current $P1087, "$!"
    $P1088 = new ['Perl6Scalar'], $P1087
    setprop $P1088, "rw", true
    .lex "$!", $P1088
.annotate "line", 152
    find_lex $P1089, "$closure"
    $P1090 = $P1089()
.annotate "line", 151
    .return ($P1090)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "lives_ok"  :anon :subid("130_1267386528.16994") :outer("65_1267386528.16994")
    .param pmc param_1115 :call_sig
.annotate "line", 156
    .const 'Sub' $P1119 = "131_1267386528.16994" 
    capture_lex $P1119
    new $P1107, 'ExceptionHandler'
    set_addr $P1107, control_1106
    $P1107."handle_types"(58)
    push_eh $P1107
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P1108
    find_lex_skip_current $P1109, "$_"
    $P1110 = new ['Perl6Scalar'], $P1109
    setprop $P1110, "rw", true
    .lex "$_", $P1110
    find_lex_skip_current $P1111, "$/"
    $P1112 = new ['Perl6Scalar'], $P1111
    setprop $P1112, "rw", true
    .lex "$/", $P1112
    find_lex_skip_current $P1113, "$!"
    $P1114 = new ['Perl6Scalar'], $P1113
    setprop $P1114, "rw", true
    .lex "$!", $P1114
    .lex "call_sig", param_1115
    new $P1116, "Perl6Scalar"
    .lex "$closure", $P1116
    find_lex $P1117, "call_sig"
    bind_signature $P1117
.annotate "line", 157
    find_lex $P1122, "$closure"
    new $P1123, "Perl6Str"
    assign $P1123, ""
    $P1124 = "&lives_ok"($P1122, $P1123)
.annotate "line", 156
    .return ($P1124)
  control_1106:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1125, exception, "payload"
    .return ($P1125)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "" :load :init :subid("post219") :outer("130_1267386528.16994")
.annotate "line", 156
    .const 'Sub' $P1105 = "130_1267386528.16994" 
    .local pmc block
    set block, $P1105
    get_hll_global $P1126, "Sub"
    $P1127 = $P1126."new"(block, 0, "")
    .local pmc trait_subject
    set trait_subject, $P1127
    get_hll_global $P1128, ["Bool"], "True"
    "&trait_mod:<is>"(trait_subject, $P1128 :named("export"))
.end


.HLL "perl6"

.namespace ["Test"]
.sub "_block1118"  :anon :subid("131_1267386528.16994") :outer("130_1267386528.16994")
.annotate "line", 156
    $P1120 = allocate_signature 1
    .local pmc signature_42
    set signature_42, $P1120
    null $P0
    null $S0
    get_hll_global $P1121, "Any"
    set_signature_elem signature_42, 0, "$closure", 128, $P1121, $P0, $P0, $P0, $P0, $P0, $S0
    .local pmc signature
    set signature, signature_42
    .return (signature)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "eval_dies_ok"  :anon :subid("132_1267386528.16994") :outer("65_1267386528.16994")
    .param pmc param_1145 :call_sig
.annotate "line", 160
    .const 'Sub' $P1150 = "133_1267386528.16994" 
    capture_lex $P1150
    new $P1136, 'ExceptionHandler'
    set_addr $P1136, control_1135
    $P1136."handle_types"(58)
    push_eh $P1136
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P1137
    find_lex_skip_current $P1138, "$_"
    $P1139 = new ['Perl6Scalar'], $P1138
    setprop $P1139, "rw", true
    .lex "$_", $P1139
    find_lex_skip_current $P1140, "$/"
    $P1141 = new ['Perl6Scalar'], $P1140
    setprop $P1141, "rw", true
    .lex "$/", $P1141
    find_lex_skip_current $P1142, "$!"
    $P1143 = new ['Perl6Scalar'], $P1142
    setprop $P1143, "rw", true
    .lex "$!", $P1143
.annotate "line", 161
    new $P1144, "Perl6Scalar"
    setprop $P1144, "rw", true
    setprop $P1144, "scalar", true
    .lex "$ee", $P1144
    .lex "call_sig", param_1145
    new $P1146, "Perl6Scalar"
    .lex "$code", $P1146
    new $P1147, "Perl6Scalar"
    .lex "$reason", $P1147
    find_lex $P1148, "call_sig"
    bind_signature $P1148
    find_lex $P1154, "$ee"
    find_lex $P1155, "$code"
    $P1156 = "&eval_exception"($P1155)
    "&infix:<=>"($P1154, $P1156)
.annotate "line", 165
    find_lex $P1157, "$ee"
    $P1158 = "&prefix:<defined>"($P1157)
    find_lex $P1159, "$reason"
    $P1160 = "&proclaim"($P1158, $P1159)
.annotate "line", 160
    .return ($P1160)
  control_1135:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1161, exception, "payload"
    .return ($P1161)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "" :load :init :subid("post221") :outer("132_1267386528.16994")
.annotate "line", 160
    .const 'Sub' $P1134 = "132_1267386528.16994" 
    .local pmc block
    set block, $P1134
    get_hll_global $P1162, "Sub"
    $P1163 = $P1162."new"(block, 0, "")
    .local pmc trait_subject
    set trait_subject, $P1163
    get_hll_global $P1164, ["Bool"], "True"
    "&trait_mod:<is>"(trait_subject, $P1164 :named("export"))
.end


.HLL "perl6"

.namespace ["Test"]
.sub "_block1149"  :anon :subid("133_1267386528.16994") :outer("132_1267386528.16994")
.annotate "line", 161
    $P1151 = allocate_signature 2
    .local pmc signature_43
    set signature_43, $P1151
    null $P0
    null $S0
    get_hll_global $P1152, "Str"
    set_signature_elem signature_43, 0, "$code", 128, $P1152, $P0, $P0, $P0, $P0, $P0, $S0
    get_hll_global $P1153, "Any"
    set_signature_elem signature_43, 1, "$reason", 128, $P1153, $P0, $P0, $P0, $P0, $P0, $S0
    .local pmc signature
    set signature, signature_43
    .return (signature)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "eval_dies_ok"  :anon :subid("134_1267386528.16994") :outer("65_1267386528.16994")
    .param pmc param_1178 :call_sig
.annotate "line", 168
    .const 'Sub' $P1182 = "135_1267386528.16994" 
    capture_lex $P1182
    new $P1170, 'ExceptionHandler'
    set_addr $P1170, control_1169
    $P1170."handle_types"(58)
    push_eh $P1170
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P1171
    find_lex_skip_current $P1172, "$_"
    $P1173 = new ['Perl6Scalar'], $P1172
    setprop $P1173, "rw", true
    .lex "$_", $P1173
    find_lex_skip_current $P1174, "$/"
    $P1175 = new ['Perl6Scalar'], $P1174
    setprop $P1175, "rw", true
    .lex "$/", $P1175
    find_lex_skip_current $P1176, "$!"
    $P1177 = new ['Perl6Scalar'], $P1176
    setprop $P1177, "rw", true
    .lex "$!", $P1177
    .lex "call_sig", param_1178
    new $P1179, "Perl6Scalar"
    .lex "$code", $P1179
    find_lex $P1180, "call_sig"
    bind_signature $P1180
.annotate "line", 169
    find_lex $P1185, "$code"
    new $P1186, "Perl6Str"
    assign $P1186, ""
    $P1187 = "&eval_dies_ok"($P1185, $P1186)
.annotate "line", 168
    .return ($P1187)
  control_1169:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1188, exception, "payload"
    .return ($P1188)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "" :load :init :subid("post222") :outer("134_1267386528.16994")
.annotate "line", 168
    .const 'Sub' $P1168 = "134_1267386528.16994" 
    .local pmc block
    set block, $P1168
    get_hll_global $P1189, "Sub"
    $P1190 = $P1189."new"(block, 0, "")
    .local pmc trait_subject
    set trait_subject, $P1190
    get_hll_global $P1191, ["Bool"], "True"
    "&trait_mod:<is>"(trait_subject, $P1191 :named("export"))
.end


.HLL "perl6"

.namespace ["Test"]
.sub "_block1181"  :anon :subid("135_1267386528.16994") :outer("134_1267386528.16994")
.annotate "line", 168
    $P1183 = allocate_signature 1
    .local pmc signature_44
    set signature_44, $P1183
    null $P0
    null $S0
    get_hll_global $P1184, "Str"
    set_signature_elem signature_44, 0, "$code", 128, $P1184, $P0, $P0, $P0, $P0, $P0, $S0
    .local pmc signature
    set signature, signature_44
    .return (signature)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "eval_lives_ok"  :anon :subid("136_1267386528.16994") :outer("65_1267386528.16994")
    .param pmc param_1207 :call_sig
.annotate "line", 172
    .const 'Sub' $P1212 = "137_1267386528.16994" 
    capture_lex $P1212
    new $P1199, 'ExceptionHandler'
    set_addr $P1199, control_1198
    $P1199."handle_types"(58)
    push_eh $P1199
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P1200
    find_lex_skip_current $P1201, "$_"
    $P1202 = new ['Perl6Scalar'], $P1201
    setprop $P1202, "rw", true
    .lex "$_", $P1202
    find_lex_skip_current $P1203, "$/"
    $P1204 = new ['Perl6Scalar'], $P1203
    setprop $P1204, "rw", true
    .lex "$/", $P1204
    find_lex_skip_current $P1205, "$!"
    $P1206 = new ['Perl6Scalar'], $P1205
    setprop $P1206, "rw", true
    .lex "$!", $P1206
    .lex "call_sig", param_1207
    new $P1208, "Perl6Scalar"
    .lex "$code", $P1208
    new $P1209, "Perl6Scalar"
    .lex "$reason", $P1209
    find_lex $P1210, "call_sig"
    bind_signature $P1210
.annotate "line", 173
    find_lex $P1216, "$code"
    $P1217 = "&eval_exception"($P1216)
    $P1218 = "&prefix:<defined>"($P1217)
    $P1219 = "&prefix:<not>"($P1218)
    find_lex $P1220, "$reason"
    $P1221 = "&proclaim"($P1219, $P1220)
.annotate "line", 172
    .return ($P1221)
  control_1198:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1222, exception, "payload"
    .return ($P1222)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "" :load :init :subid("post224") :outer("136_1267386528.16994")
.annotate "line", 172
    .const 'Sub' $P1197 = "136_1267386528.16994" 
    .local pmc block
    set block, $P1197
    get_hll_global $P1223, "Sub"
    $P1224 = $P1223."new"(block, 0, "")
    .local pmc trait_subject
    set trait_subject, $P1224
    get_hll_global $P1225, ["Bool"], "True"
    "&trait_mod:<is>"(trait_subject, $P1225 :named("export"))
.end


.HLL "perl6"

.namespace ["Test"]
.sub "_block1211"  :anon :subid("137_1267386528.16994") :outer("136_1267386528.16994")
.annotate "line", 172
    $P1213 = allocate_signature 2
    .local pmc signature_45
    set signature_45, $P1213
    null $P0
    null $S0
    get_hll_global $P1214, "Str"
    set_signature_elem signature_45, 0, "$code", 128, $P1214, $P0, $P0, $P0, $P0, $P0, $S0
    get_hll_global $P1215, "Any"
    set_signature_elem signature_45, 1, "$reason", 128, $P1215, $P0, $P0, $P0, $P0, $P0, $S0
    .local pmc signature
    set signature, signature_45
    .return (signature)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "eval_lives_ok"  :anon :subid("138_1267386528.16994") :outer("65_1267386528.16994")
    .param pmc param_1239 :call_sig
.annotate "line", 175
    .const 'Sub' $P1243 = "139_1267386528.16994" 
    capture_lex $P1243
    new $P1231, 'ExceptionHandler'
    set_addr $P1231, control_1230
    $P1231."handle_types"(58)
    push_eh $P1231
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P1232
    find_lex_skip_current $P1233, "$_"
    $P1234 = new ['Perl6Scalar'], $P1233
    setprop $P1234, "rw", true
    .lex "$_", $P1234
    find_lex_skip_current $P1235, "$/"
    $P1236 = new ['Perl6Scalar'], $P1235
    setprop $P1236, "rw", true
    .lex "$/", $P1236
    find_lex_skip_current $P1237, "$!"
    $P1238 = new ['Perl6Scalar'], $P1237
    setprop $P1238, "rw", true
    .lex "$!", $P1238
    .lex "call_sig", param_1239
    new $P1240, "Perl6Scalar"
    .lex "$code", $P1240
    find_lex $P1241, "call_sig"
    bind_signature $P1241
.annotate "line", 176
    find_lex $P1246, "$code"
    new $P1247, "Perl6Str"
    assign $P1247, ""
    $P1248 = "&eval_lives_ok"($P1246, $P1247)
.annotate "line", 175
    .return ($P1248)
  control_1230:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1249, exception, "payload"
    .return ($P1249)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "" :load :init :subid("post225") :outer("138_1267386528.16994")
.annotate "line", 175
    .const 'Sub' $P1229 = "138_1267386528.16994" 
    .local pmc block
    set block, $P1229
    get_hll_global $P1250, "Sub"
    $P1251 = $P1250."new"(block, 0, "")
    .local pmc trait_subject
    set trait_subject, $P1251
    get_hll_global $P1252, ["Bool"], "True"
    "&trait_mod:<is>"(trait_subject, $P1252 :named("export"))
.end


.HLL "perl6"

.namespace ["Test"]
.sub "_block1242"  :anon :subid("139_1267386528.16994") :outer("138_1267386528.16994")
.annotate "line", 175
    $P1244 = allocate_signature 1
    .local pmc signature_46
    set signature_46, $P1244
    null $P0
    null $S0
    get_hll_global $P1245, "Str"
    set_signature_elem signature_46, 0, "$code", 128, $P1245, $P0, $P0, $P0, $P0, $P0, $S0
    .local pmc signature
    set signature, signature_46
    .return (signature)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "is_deeply"  :anon :subid("140_1267386528.16994") :outer("65_1267386528.16994")
    .param pmc param_1269 :call_sig
.annotate "line", 182
    .const 'Sub' $P1294 = "143_1267386528.16994" 
    capture_lex $P1294
    .const 'Sub' $P1275 = "141_1267386528.16994" 
    capture_lex $P1275
    new $P1260, 'ExceptionHandler'
    set_addr $P1260, control_1259
    $P1260."handle_types"(58)
    push_eh $P1260
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P1261
    find_lex_skip_current $P1262, "$_"
    $P1263 = new ['Perl6Scalar'], $P1262
    setprop $P1263, "rw", true
    .lex "$_", $P1263
    find_lex_skip_current $P1264, "$/"
    $P1265 = new ['Perl6Scalar'], $P1264
    setprop $P1265, "rw", true
    .lex "$/", $P1265
    find_lex_skip_current $P1266, "$!"
    $P1267 = new ['Perl6Scalar'], $P1266
    setprop $P1267, "rw", true
    .lex "$!", $P1267
.annotate "line", 183
    new $P1268, "Perl6Scalar"
    setprop $P1268, "rw", true
    setprop $P1268, "scalar", true
    .lex "$test", $P1268
    .lex "call_sig", param_1269
    new $P1270, "Perl6Scalar"
    .lex "$got", $P1270
    new $P1271, "Perl6Scalar"
    .lex "$expected", $P1271
    new $P1272, "Perl6Scalar"
    .lex "$reason", $P1272
    find_lex $P1273, "call_sig"
    bind_signature $P1273
    find_lex $P1283, "$test"
    find_lex $P1284, "$got"
    find_lex $P1285, "$expected"
    $P1286 = "&_is_deeply"($P1284, $P1285)
    "&infix:<=>"($P1283, $P1286)
.annotate "line", 184
    find_lex $P1287, "$test"
    find_lex $P1288, "$reason"
    "&proclaim"($P1287, $P1288)
.annotate "line", 185
    find_lex $P1291, "$test"
    $P1292 = "&prefix:<!>"($P1291)
    if $P1292, if_1290
    set $P1289, $P1292
    goto if_1290_end
  if_1290:
    .const 'Sub' $P1294 = "143_1267386528.16994" 
    capture_lex $P1294
    $P1371 = $P1294()
    set $P1289, $P1371
  if_1290_end:
.annotate "line", 182
    .return ($P1289)
  control_1259:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1372, exception, "payload"
    .return ($P1372)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "" :load :init :subid("post227") :outer("140_1267386528.16994")
.annotate "line", 182
    .const 'Sub' $P1258 = "140_1267386528.16994" 
    .local pmc block
    set block, $P1258
    get_hll_global $P1373, "Sub"
    $P1374 = $P1373."new"(block, 0, "")
    .local pmc trait_subject
    set trait_subject, $P1374
    get_hll_global $P1375, ["Bool"], "True"
    "&trait_mod:<is>"(trait_subject, $P1375 :named("export"))
.end


.HLL "perl6"

.namespace ["Test"]
.sub "_block1274"  :anon :subid("141_1267386528.16994") :outer("140_1267386528.16994")
.annotate "line", 183
    .const 'Sub' $P1281 = "142_1267386528.16994" 
    capture_lex $P1281
    $P1276 = allocate_signature 3
    .local pmc signature_49
    set signature_49, $P1276
    null $P0
    null $S0
    get_hll_global $P1277, "Mu"
    set_signature_elem signature_49, 0, "$got", 128, $P1277, $P0, $P0, $P0, $P0, $P0, $S0
    get_hll_global $P1278, "Mu"
    set_signature_elem signature_49, 1, "$expected", 128, $P1278, $P0, $P0, $P0, $P0, $P0, $S0
    get_hll_global $P1279, "Any"
    .const 'Sub' $P1281 = "142_1267386528.16994" 
    capture_lex $P1281
    set_signature_elem signature_49, 2, "$reason", 2176, $P1279, $P0, $P0, $P0, $P1281, $P0, $S0
    .local pmc signature
    set signature, signature_49
    .return (signature)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "_block1280"  :anon :subid("142_1267386528.16994") :outer("141_1267386528.16994")
.annotate "line", 183
    new $P1282, "Perl6Str"
    assign $P1282, ""
    .return ($P1282)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "_block1293"  :anon :subid("143_1267386528.16994") :outer("140_1267386528.16994")
    .param pmc param_1304 :call_sig
.annotate "line", 185
    .const 'Sub' $P1351 = "146_1267386528.16994" 
    capture_lex $P1351
    .const 'Sub' $P1326 = "145_1267386528.16994" 
    capture_lex $P1326
    .const 'Sub' $P1309 = "144_1267386528.16994" 
    capture_lex $P1309
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P1295
    find_lex_skip_current $P1296, "$_"
    $P1297 = new ['Perl6Scalar'], $P1296
    setprop $P1297, "rw", true
    .lex "$_", $P1297
    find_lex_skip_current $P1298, "$/"
    $P1299 = new ['Perl6Scalar'], $P1298
    setprop $P1299, "rw", true
    .lex "$/", $P1299
    find_lex_skip_current $P1300, "$!"
    $P1301 = new ['Perl6Scalar'], $P1300
    setprop $P1301, "rw", true
    .lex "$!", $P1301
.annotate "line", 186
    new $P1302, "Perl6Scalar"
    setprop $P1302, "rw", true
    setprop $P1302, "scalar", true
    .lex "$got_perl", $P1302
.annotate "line", 187
    new $P1303, "Perl6Scalar"
    setprop $P1303, "rw", true
    setprop $P1303, "scalar", true
    .lex "$expected_perl", $P1303
    .lex "call_sig", param_1304
    find_lex $P1305, "call_sig"
    bind_signature $P1305
.annotate "line", 186
    find_lex $P1306, "$got_perl"
    push_eh catch_1307
    .const 'Sub' $P1309 = "144_1267386528.16994" 
    capture_lex $P1309
    $P1320 = $P1309()
    pop_eh 
    $P1321 = "!FAIL"()
    store_lex "$!", $P1321
    goto catch_1307_end
  catch_1307:
    .get_results ($P1322)
    $P0 = new ["Perl6Exception"]
    setattribute $P0, "$!exception", $P1322
    store_lex "$!", $P0
    pop_eh 
  catch_1307_end:
    "&infix:<=>"($P1306, $P1320)
.annotate "line", 187
    find_lex $P1323, "$expected_perl"
    push_eh catch_1324
    .const 'Sub' $P1326 = "145_1267386528.16994" 
    capture_lex $P1326
    $P1337 = $P1326()
    pop_eh 
    $P1338 = "!FAIL"()
    store_lex "$!", $P1338
    goto catch_1324_end
  catch_1324:
    .get_results ($P1339)
    $P0 = new ["Perl6Exception"]
    setattribute $P0, "$!exception", $P1339
    store_lex "$!", $P0
    pop_eh 
  catch_1324_end:
    "&infix:<=>"($P1323, $P1337)
.annotate "line", 188
    find_lex $P1344, "$got_perl"
    descalarref $P1345, $P1344
    $P1346 = $P1345."defined"()
    if $P1346, if_1343
    set $P1342, $P1346
    goto if_1343_end
  if_1343:
    find_lex $P1347, "$expected_perl"
    descalarref $P1348, $P1347
    $P1349 = $P1348."defined"()
    set $P1342, $P1349
  if_1343_end:
    if $P1342, if_1341
    set $P1340, $P1342
    goto if_1341_end
  if_1341:
    .const 'Sub' $P1351 = "146_1267386528.16994" 
    capture_lex $P1351
    $P1369 = $P1351()
    set $P1340, $P1369
  if_1341_end:
.annotate "line", 185
    .return ($P1340)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "" :load :init :subid("post228") :outer("143_1267386528.16994")
.annotate "line", 185
    .const 'Sub' $P1294 = "143_1267386528.16994" 
    .local pmc block
    set block, $P1294
    $P1370 = allocate_signature 0
    .local pmc signature_48
    set signature_48, $P1370
    null $P0
    null $S0
    .local pmc signature
    set signature, signature_48
    setprop block, "$!signature", signature
.end


.HLL "perl6"

.namespace ["Test"]
.sub "_block1308"  :anon :subid("144_1267386528.16994") :outer("143_1267386528.16994")
.annotate "line", 186
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P1310
    find_lex_skip_current $P1311, "$_"
    $P1312 = new ['Perl6Scalar'], $P1311
    setprop $P1312, "rw", true
    .lex "$_", $P1312
    find_lex_skip_current $P1313, "$/"
    $P1314 = new ['Perl6Scalar'], $P1313
    setprop $P1314, "rw", true
    .lex "$/", $P1314
    find_lex_skip_current $P1315, "$!"
    $P1316 = new ['Perl6Scalar'], $P1315
    setprop $P1316, "rw", true
    .lex "$!", $P1316
    find_lex $P1317, "$got"
    descalarref $P1318, $P1317
    $P1319 = $P1318."perl"()
    .return ($P1319)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "_block1325"  :anon :subid("145_1267386528.16994") :outer("143_1267386528.16994")
.annotate "line", 187
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P1327
    find_lex_skip_current $P1328, "$_"
    $P1329 = new ['Perl6Scalar'], $P1328
    setprop $P1329, "rw", true
    .lex "$_", $P1329
    find_lex_skip_current $P1330, "$/"
    $P1331 = new ['Perl6Scalar'], $P1330
    setprop $P1331, "rw", true
    .lex "$/", $P1331
    find_lex_skip_current $P1332, "$!"
    $P1333 = new ['Perl6Scalar'], $P1332
    setprop $P1333, "rw", true
    .lex "$!", $P1333
    find_lex $P1334, "$expected"
    descalarref $P1335, $P1334
    $P1336 = $P1335."perl"()
    .return ($P1336)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "_block1350"  :anon :subid("146_1267386528.16994") :outer("143_1267386528.16994")
    .param pmc param_1359 :call_sig
.annotate "line", 188
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P1352
    find_lex_skip_current $P1353, "$_"
    $P1354 = new ['Perl6Scalar'], $P1353
    setprop $P1354, "rw", true
    .lex "$_", $P1354
    find_lex_skip_current $P1355, "$/"
    $P1356 = new ['Perl6Scalar'], $P1355
    setprop $P1356, "rw", true
    .lex "$/", $P1356
    find_lex_skip_current $P1357, "$!"
    $P1358 = new ['Perl6Scalar'], $P1357
    setprop $P1358, "rw", true
    .lex "$!", $P1358
    .lex "call_sig", param_1359
    find_lex $P1360, "call_sig"
    bind_signature $P1360
.annotate "line", 189
    new $P1361, "Perl6Str"
    assign $P1361, "     got: "
    find_lex $P1362, "$got_perl"
    concat $P1363, $P1361, $P1362
    "&diag"($P1363)
.annotate "line", 190
    new $P1364, "Perl6Str"
    assign $P1364, "expected: "
    find_lex $P1365, "$expected_perl"
    concat $P1366, $P1364, $P1365
    $P1367 = "&diag"($P1366)
.annotate "line", 188
    .return ($P1367)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "" :load :init :subid("post229") :outer("146_1267386528.16994")
.annotate "line", 188
    .const 'Sub' $P1351 = "146_1267386528.16994" 
    .local pmc block
    set block, $P1351
    $P1368 = allocate_signature 0
    .local pmc signature_47
    set signature_47, $P1368
    null $P0
    null $S0
    .local pmc signature
    set signature, signature_47
    setprop block, "$!signature", signature
.end


.HLL "perl6"

.namespace ["Test"]
.sub "_is_deeply"  :anon :subid("147_1267386528.16994") :outer("65_1267386528.16994")
    .param pmc param_1390 :call_sig
.annotate "line", 195
    .const 'Sub' $P1395 = "148_1267386528.16994" 
    capture_lex $P1395
    new $P1382, 'ExceptionHandler'
    set_addr $P1382, control_1381
    $P1382."handle_types"(58)
    push_eh $P1382
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P1383
    find_lex_skip_current $P1384, "$_"
    $P1385 = new ['Perl6Scalar'], $P1384
    setprop $P1385, "rw", true
    .lex "$_", $P1385
    find_lex_skip_current $P1386, "$/"
    $P1387 = new ['Perl6Scalar'], $P1386
    setprop $P1387, "rw", true
    .lex "$/", $P1387
    find_lex_skip_current $P1388, "$!"
    $P1389 = new ['Perl6Scalar'], $P1388
    setprop $P1389, "rw", true
    .lex "$!", $P1389
    .lex "call_sig", param_1390
    new $P1391, "Perl6Scalar"
    .lex "$got", $P1391
    new $P1392, "Perl6Scalar"
    .lex "$expected", $P1392
    find_lex $P1393, "call_sig"
    bind_signature $P1393
.annotate "line", 196
    find_lex $P1400, "$got"
    find_lex $P1401, "$expected"
    $P1399 = "&infix:<eqv>"($P1400, $P1401)
  chain_end_230:
.annotate "line", 195
    .return ($P1399)
  control_1381:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1402, exception, "payload"
    .return ($P1402)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "_block1394"  :anon :subid("148_1267386528.16994") :outer("147_1267386528.16994")
.annotate "line", 195
    $P1396 = allocate_signature 2
    .local pmc signature_50
    set signature_50, $P1396
    null $P0
    null $S0
    get_hll_global $P1397, "Mu"
    set_signature_elem signature_50, 0, "$got", 128, $P1397, $P0, $P0, $P0, $P0, $P0, $S0
    get_hll_global $P1398, "Mu"
    set_signature_elem signature_50, 1, "$expected", 128, $P1398, $P0, $P0, $P0, $P0, $P0, $S0
    .local pmc signature
    set signature, signature_50
    .return (signature)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "eval_exception"  :anon :subid("149_1267386528.16994") :outer("65_1267386528.16994")
    .param pmc param_1417 :call_sig
.annotate "line", 202
    .const 'Sub' $P1427 = "151_1267386528.16994" 
    capture_lex $P1427
    .const 'Sub' $P1421 = "150_1267386528.16994" 
    capture_lex $P1421
    new $P1408, 'ExceptionHandler'
    set_addr $P1408, control_1407
    $P1408."handle_types"(58)
    push_eh $P1408
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P1409
    find_lex_skip_current $P1410, "$_"
    $P1411 = new ['Perl6Scalar'], $P1410
    setprop $P1411, "rw", true
    .lex "$_", $P1411
    find_lex_skip_current $P1412, "$/"
    $P1413 = new ['Perl6Scalar'], $P1412
    setprop $P1413, "rw", true
    .lex "$/", $P1413
    find_lex_skip_current $P1414, "$!"
    $P1415 = new ['Perl6Scalar'], $P1414
    setprop $P1415, "rw", true
    .lex "$!", $P1415
.annotate "line", 203
    new $P1416, "Perl6Scalar"
    setprop $P1416, "rw", true
    setprop $P1416, "scalar", true
    .lex "$eval_exception", $P1416
    .lex "call_sig", param_1417
    new $P1418, "Perl6Scalar"
    .lex "$code", $P1418
    find_lex $P1419, "call_sig"
    bind_signature $P1419
.annotate "line", 202
    find_lex $P1424, "$eval_exception"
    push_eh catch_1425
.annotate "line", 204
    .const 'Sub' $P1427 = "151_1267386528.16994" 
    capture_lex $P1427
    $P1427()
    pop_eh 
    $P1439 = "!FAIL"()
    store_lex "$!", $P1439
    goto catch_1425_end
  catch_1425:
    .get_results ($P1440)
    $P0 = new ["Perl6Exception"]
    setattribute $P0, "$!exception", $P1440
    store_lex "$!", $P0
    pop_eh 
  catch_1425_end:
.annotate "line", 205
    find_lex $P1442, "$eval_exception"
    set $P1441, $P1442
    defined $I1444, $P1441
    if $I1444, default_1443
    find_lex $P1445, "$!"
    set $P1441, $P1445
  default_1443:
.annotate "line", 202
    .return ($P1441)
  control_1407:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1446, exception, "payload"
    .return ($P1446)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "_block1420"  :anon :subid("150_1267386528.16994") :outer("149_1267386528.16994")
.annotate "line", 203
    $P1422 = allocate_signature 1
    .local pmc signature_51
    set signature_51, $P1422
    null $P0
    null $S0
    get_hll_global $P1423, "Any"
    set_signature_elem signature_51, 0, "$code", 128, $P1423, $P0, $P0, $P0, $P0, $P0, $S0
    .local pmc signature
    set signature, signature_51
    .return (signature)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "_block1426"  :anon :subid("151_1267386528.16994") :outer("149_1267386528.16994")
.annotate "line", 204
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P1428
    find_lex_skip_current $P1429, "$_"
    $P1430 = new ['Perl6Scalar'], $P1429
    setprop $P1430, "rw", true
    .lex "$_", $P1430
    find_lex_skip_current $P1431, "$/"
    $P1432 = new ['Perl6Scalar'], $P1431
    setprop $P1432, "rw", true
    .lex "$/", $P1432
    find_lex_skip_current $P1433, "$!"
    $P1434 = new ['Perl6Scalar'], $P1433
    setprop $P1434, "rw", true
    .lex "$!", $P1434
    find_lex $P1435, "$code"
    "&eval"($P1435)
    find_lex $P1436, "$eval_exception"
    find_lex $P1437, "$!"
    $P1438 = "&infix:<=>"($P1436, $P1437)
    .return ($P1438)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "proclaim"  :anon :subid("152_1267386528.16994") :outer("65_1267386528.16994")
    .param pmc param_1460 :call_sig
.annotate "line", 208
    .const 'Sub' $P1564 = "158_1267386528.16994" 
    capture_lex $P1564
    .const 'Sub' $P1546 = "157_1267386528.16994" 
    capture_lex $P1546
    .const 'Sub' $P1521 = "156_1267386528.16994" 
    capture_lex $P1521
    .const 'Sub' $P1475 = "154_1267386528.16994" 
    capture_lex $P1475
    .const 'Sub' $P1465 = "153_1267386528.16994" 
    capture_lex $P1465
    new $P1452, 'ExceptionHandler'
    set_addr $P1452, control_1451
    $P1452."handle_types"(58)
    push_eh $P1452
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P1453
    find_lex_skip_current $P1454, "$_"
    $P1455 = new ['Perl6Scalar'], $P1454
    setprop $P1455, "rw", true
    .lex "$_", $P1455
    find_lex_skip_current $P1456, "$/"
    $P1457 = new ['Perl6Scalar'], $P1456
    setprop $P1457, "rw", true
    .lex "$/", $P1457
    find_lex_skip_current $P1458, "$!"
    $P1459 = new ['Perl6Scalar'], $P1458
    setprop $P1459, "rw", true
    .lex "$!", $P1459
    .lex "call_sig", param_1460
    new $P1461, "Perl6Scalar"
    .lex "$cond", $P1461
    new $P1462, "Perl6Scalar"
    .lex "$desc", $P1462
    find_lex $P1463, "call_sig"
    bind_signature $P1463
.annotate "line", 209
    find_lex $P1469, "$num_of_tests_run"
    find_lex $P1470, "$num_of_tests_run"
    $P1471 = "&infix:<+>"($P1470, 1)
    "&infix:<=>"($P1469, $P1471)
.annotate "line", 211
    find_lex $P1473, "$cond"
    if $P1473, unless_1472_end
    .const 'Sub' $P1475 = "154_1267386528.16994" 
    capture_lex $P1475
    $P1475()
  unless_1472_end:
.annotate "line", 217
    new $P1509, "Perl6Str"
    assign $P1509, "ok "
    find_lex $P1510, "$num_of_tests_run"
    new $P1511, "Perl6Str"
    assign $P1511, " - "
    find_lex $P1512, "$desc"
    "&print"($P1509, $P1510, $P1511, $P1512)
.annotate "line", 218
    find_lex $P1516, "$todo_reason"
    if $P1516, if_1515
    set $P1514, $P1516
    goto if_1515_end
  if_1515:
    find_lex $P1518, "$num_of_tests_run"
    find_lex $P1519, "$todo_upto_test_num"
    $P1517 = "&infix:<<=>"($P1518, $P1519)
  chain_end_234:
    set $P1514, $P1517
  if_1515_end:
    unless $P1514, if_1513_end
    .const 'Sub' $P1521 = "156_1267386528.16994" 
    capture_lex $P1521
    $P1521()
  if_1513_end:
.annotate "line", 221
    new $P1534, "Perl6Str"
    assign $P1534, "\n"
    "&print"($P1534)
.annotate "line", 224
    find_lex $P1540, "$cond"
    $P1541 = "&prefix:<!>"($P1540)
    if $P1541, if_1539
    set $P1538, $P1541
    goto if_1539_end
  if_1539:
    find_lex $P1542, "$die_on_fail"
    set $P1538, $P1542
  if_1539_end:
    if $P1538, if_1537
    set $P1536, $P1538
    goto if_1537_end
  if_1537:
    find_lex $P1543, "$todo_reason"
    $P1544 = "&prefix:<!>"($P1543)
    set $P1536, $P1544
  if_1537_end:
    unless $P1536, if_1535_end
    .const 'Sub' $P1546 = "157_1267386528.16994" 
    capture_lex $P1546
    $P1546()
  if_1535_end:
.annotate "line", 228
    find_lex $P1561, "$todo_upto_test_num"
    find_lex $P1562, "$num_of_tests_run"
    $P1560 = "&infix:<==>"($P1561, $P1562)
  chain_end_237:
    unless $P1560, if_1559_end
    .const 'Sub' $P1564 = "158_1267386528.16994" 
    capture_lex $P1564
    $P1564()
  if_1559_end:
    find_lex $P1578, "$cond"
.annotate "line", 208
    .return ($P1578)
  control_1451:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1579, exception, "payload"
    .return ($P1579)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "_block1464"  :anon :subid("153_1267386528.16994") :outer("152_1267386528.16994")
.annotate "line", 208
    $P1466 = allocate_signature 2
    .local pmc signature_57
    set signature_57, $P1466
    null $P0
    null $S0
    get_hll_global $P1467, "Any"
    set_signature_elem signature_57, 0, "$cond", 128, $P1467, $P0, $P0, $P0, $P0, $P0, $S0
    get_hll_global $P1468, "Any"
    set_signature_elem signature_57, 1, "$desc", 128, $P1468, $P0, $P0, $P0, $P0, $P0, $S0
    .local pmc signature
    set signature, signature_57
    .return (signature)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "_block1474"  :anon :subid("154_1267386528.16994") :outer("152_1267386528.16994")
    .param pmc param_1483 :call_sig
.annotate "line", 211
    .const 'Sub' $P1492 = "155_1267386528.16994" 
    capture_lex $P1492
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P1476
    find_lex_skip_current $P1477, "$_"
    $P1478 = new ['Perl6Scalar'], $P1477
    setprop $P1478, "rw", true
    .lex "$_", $P1478
    find_lex_skip_current $P1479, "$/"
    $P1480 = new ['Perl6Scalar'], $P1479
    setprop $P1480, "rw", true
    .lex "$/", $P1480
    find_lex_skip_current $P1481, "$!"
    $P1482 = new ['Perl6Scalar'], $P1481
    setprop $P1482, "rw", true
    .lex "$!", $P1482
    .lex "call_sig", param_1483
    find_lex $P1484, "call_sig"
    bind_signature $P1484
.annotate "line", 212
    new $P1485, "Perl6Str"
    assign $P1485, "not "
    "&print"($P1485)
.annotate "line", 213
    find_lex $P1489, "$num_of_tests_run"
    find_lex $P1490, "$todo_upto_test_num"
    $P1488 = "&infix:<<=>"($P1489, $P1490)
  chain_end_232:
    unless $P1488, unless_1487
    set $P1486, $P1488
    goto unless_1487_end
  unless_1487:
    .const 'Sub' $P1492 = "155_1267386528.16994" 
    capture_lex $P1492
    $P1507 = $P1492()
    set $P1486, $P1507
  unless_1487_end:
.annotate "line", 211
    .return ($P1486)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "" :load :init :subid("post231") :outer("154_1267386528.16994")
.annotate "line", 211
    .const 'Sub' $P1475 = "154_1267386528.16994" 
    .local pmc block
    set block, $P1475
    $P1508 = allocate_signature 0
    .local pmc signature_53
    set signature_53, $P1508
    null $P0
    null $S0
    .local pmc signature
    set signature, signature_53
    setprop block, "$!signature", signature
.end


.HLL "perl6"

.namespace ["Test"]
.sub "_block1491"  :anon :subid("155_1267386528.16994") :outer("154_1267386528.16994")
    .param pmc param_1500 :call_sig
.annotate "line", 213
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P1493
    find_lex_skip_current $P1494, "$_"
    $P1495 = new ['Perl6Scalar'], $P1494
    setprop $P1495, "rw", true
    .lex "$_", $P1495
    find_lex_skip_current $P1496, "$/"
    $P1497 = new ['Perl6Scalar'], $P1496
    setprop $P1497, "rw", true
    .lex "$/", $P1497
    find_lex_skip_current $P1498, "$!"
    $P1499 = new ['Perl6Scalar'], $P1498
    setprop $P1499, "rw", true
    .lex "$!", $P1499
    .lex "call_sig", param_1500
    find_lex $P1501, "call_sig"
    bind_signature $P1501
.annotate "line", 214
    find_lex $P1502, "$num_of_tests_failed"
    find_lex $P1503, "$num_of_tests_failed"
    $P1504 = "&infix:<+>"($P1503, 1)
    $P1505 = "&infix:<=>"($P1502, $P1504)
.annotate "line", 213
    .return ($P1505)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "" :load :init :subid("post233") :outer("155_1267386528.16994")
.annotate "line", 213
    .const 'Sub' $P1492 = "155_1267386528.16994" 
    .local pmc block
    set block, $P1492
    $P1506 = allocate_signature 0
    .local pmc signature_52
    set signature_52, $P1506
    null $P0
    null $S0
    .local pmc signature
    set signature, signature_52
    setprop block, "$!signature", signature
.end


.HLL "perl6"

.namespace ["Test"]
.sub "_block1520"  :anon :subid("156_1267386528.16994") :outer("152_1267386528.16994")
    .param pmc param_1529 :call_sig
.annotate "line", 218
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P1522
    find_lex_skip_current $P1523, "$_"
    $P1524 = new ['Perl6Scalar'], $P1523
    setprop $P1524, "rw", true
    .lex "$_", $P1524
    find_lex_skip_current $P1525, "$/"
    $P1526 = new ['Perl6Scalar'], $P1525
    setprop $P1526, "rw", true
    .lex "$/", $P1526
    find_lex_skip_current $P1527, "$!"
    $P1528 = new ['Perl6Scalar'], $P1527
    setprop $P1528, "rw", true
    .lex "$!", $P1528
    .lex "call_sig", param_1529
    find_lex $P1530, "call_sig"
    bind_signature $P1530
.annotate "line", 219
    find_lex $P1531, "$todo_reason"
    $P1532 = "&print"($P1531)
.annotate "line", 218
    .return ($P1532)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "" :load :init :subid("post235") :outer("156_1267386528.16994")
.annotate "line", 218
    .const 'Sub' $P1521 = "156_1267386528.16994" 
    .local pmc block
    set block, $P1521
    $P1533 = allocate_signature 0
    .local pmc signature_54
    set signature_54, $P1533
    null $P0
    null $S0
    .local pmc signature
    set signature, signature_54
    setprop block, "$!signature", signature
.end


.HLL "perl6"

.namespace ["Test"]
.sub "_block1545"  :anon :subid("157_1267386528.16994") :outer("152_1267386528.16994")
    .param pmc param_1554 :call_sig
.annotate "line", 224
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P1547
    find_lex_skip_current $P1548, "$_"
    $P1549 = new ['Perl6Scalar'], $P1548
    setprop $P1549, "rw", true
    .lex "$_", $P1549
    find_lex_skip_current $P1550, "$/"
    $P1551 = new ['Perl6Scalar'], $P1550
    setprop $P1551, "rw", true
    .lex "$/", $P1551
    find_lex_skip_current $P1552, "$!"
    $P1553 = new ['Perl6Scalar'], $P1552
    setprop $P1553, "rw", true
    .lex "$!", $P1553
    .lex "call_sig", param_1554
    find_lex $P1555, "call_sig"
    bind_signature $P1555
.annotate "line", 225
    new $P1556, "Perl6Str"
    assign $P1556, "Test failed.  Stopping test"
    $P1557 = "&die"($P1556)
.annotate "line", 224
    .return ($P1557)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "" :load :init :subid("post236") :outer("157_1267386528.16994")
.annotate "line", 224
    .const 'Sub' $P1546 = "157_1267386528.16994" 
    .local pmc block
    set block, $P1546
    $P1558 = allocate_signature 0
    .local pmc signature_55
    set signature_55, $P1558
    null $P0
    null $S0
    .local pmc signature
    set signature, signature_55
    setprop block, "$!signature", signature
.end


.HLL "perl6"

.namespace ["Test"]
.sub "_block1563"  :anon :subid("158_1267386528.16994") :outer("152_1267386528.16994")
    .param pmc param_1572 :call_sig
.annotate "line", 228
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P1565
    find_lex_skip_current $P1566, "$_"
    $P1567 = new ['Perl6Scalar'], $P1566
    setprop $P1567, "rw", true
    .lex "$_", $P1567
    find_lex_skip_current $P1568, "$/"
    $P1569 = new ['Perl6Scalar'], $P1568
    setprop $P1569, "rw", true
    .lex "$/", $P1569
    find_lex_skip_current $P1570, "$!"
    $P1571 = new ['Perl6Scalar'], $P1570
    setprop $P1571, "rw", true
    .lex "$!", $P1571
    .lex "call_sig", param_1572
    find_lex $P1573, "call_sig"
    bind_signature $P1573
    find_lex $P1574, "$todo_reason"
    new $P1575, "Perl6Str"
    assign $P1575, ""
    $P1576 = "&infix:<=>"($P1574, $P1575)
    .return ($P1576)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "" :load :init :subid("post238") :outer("158_1267386528.16994")
.annotate "line", 228
    .const 'Sub' $P1564 = "158_1267386528.16994" 
    .local pmc block
    set block, $P1564
    $P1577 = allocate_signature 0
    .local pmc signature_56
    set signature_56, $P1577
    null $P0
    null $S0
    .local pmc signature
    set signature, signature_56
    setprop block, "$!signature", signature
.end


.HLL "perl6"

.namespace ["Test"]
.sub "done_testing"  :anon :subid("159_1267386528.16994") :outer("65_1267386528.16994")
    .param pmc param_1594 :call_sig
.annotate "line", 232
    .const 'Sub' $P1649 = "163_1267386528.16994" 
    capture_lex $P1649
    .const 'Sub' $P1626 = "162_1267386528.16994" 
    capture_lex $P1626
    .const 'Sub' $P1604 = "161_1267386528.16994" 
    capture_lex $P1604
    .const 'Sub' $P1597 = "160_1267386528.16994" 
    capture_lex $P1597
    new $P1585, 'ExceptionHandler'
    set_addr $P1585, control_1584
    $P1585."handle_types"(58)
    push_eh $P1585
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P1586
    find_lex_skip_current $P1587, "$_"
    $P1588 = new ['Perl6Scalar'], $P1587
    setprop $P1588, "rw", true
    .lex "$_", $P1588
    find_lex_skip_current $P1589, "$/"
    $P1590 = new ['Perl6Scalar'], $P1589
    setprop $P1590, "rw", true
    .lex "$/", $P1590
    find_lex_skip_current $P1591, "$!"
    $P1592 = new ['Perl6Scalar'], $P1591
    setprop $P1592, "rw", true
    .lex "$!", $P1592
.annotate "line", 233
    get_global $P1593, "$done_testing_has_been_run"
    unless_null $P1593, vivify_240
    new $P1593, "Perl6Scalar"
    setprop $P1593, "rw", true
    setprop $P1593, "scalar", true
    set_global "$done_testing_has_been_run", $P1593
  vivify_240:
    .lex "$done_testing_has_been_run", $P1593
    .lex "call_sig", param_1594
    find_lex $P1595, "call_sig"
    bind_signature $P1595
.annotate "line", 232
    find_lex $P1599, "$done_testing_has_been_run"
.annotate "line", 235
    find_lex $P1600, "$done_testing_has_been_run"
    "&infix:<=>"($P1600, 1)
.annotate "line", 237
    find_lex $P1602, "$no_plan"
    unless $P1602, if_1601_end
    .const 'Sub' $P1604 = "161_1267386528.16994" 
    capture_lex $P1604
    $P1604()
  if_1601_end:
.annotate "line", 242
    find_lex $P1623, "$num_of_tests_planned"
    find_lex $P1624, "$num_of_tests_run"
    $P1622 = "&infix:<!=>"($P1623, $P1624)
  chain_end_242:
    unless $P1622, if_1621_end
    .const 'Sub' $P1626 = "162_1267386528.16994" 
    capture_lex $P1626
    $P1626()
  if_1621_end:
.annotate "line", 245
    find_lex $P1647, "$num_of_tests_failed"
    if $P1647, if_1646
    set $P1645, $P1647
    goto if_1646_end
  if_1646:
    .const 'Sub' $P1649 = "163_1267386528.16994" 
    capture_lex $P1649
    $P1668 = $P1649()
    set $P1645, $P1668
  if_1646_end:
.annotate "line", 232
    .return ($P1645)
  control_1584:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1669, exception, "payload"
    .return ($P1669)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "" :load :init :subid("post239") :outer("159_1267386528.16994")
.annotate "line", 232
    .const 'Sub' $P1583 = "159_1267386528.16994" 
    .local pmc block
    set block, $P1583
    get_hll_global $P1670, "Sub"
    $P1671 = $P1670."new"(block, 0, "")
    .local pmc trait_subject
    set trait_subject, $P1671
    get_hll_global $P1672, ["Bool"], "True"
    "&trait_mod:<is>"(trait_subject, $P1672 :named("export"))
.end


.HLL "perl6"

.namespace ["Test"]
.sub "_block1596"  :anon :subid("160_1267386528.16994") :outer("159_1267386528.16994")
.annotate "line", 233
    $P1598 = allocate_signature 0
    .local pmc signature_61
    set signature_61, $P1598
    null $P0
    null $S0
    .local pmc signature
    set signature, signature_61
    .return (signature)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "_block1603"  :anon :subid("161_1267386528.16994") :outer("159_1267386528.16994")
    .param pmc param_1612 :call_sig
.annotate "line", 237
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P1605
    find_lex_skip_current $P1606, "$_"
    $P1607 = new ['Perl6Scalar'], $P1606
    setprop $P1607, "rw", true
    .lex "$_", $P1607
    find_lex_skip_current $P1608, "$/"
    $P1609 = new ['Perl6Scalar'], $P1608
    setprop $P1609, "rw", true
    .lex "$/", $P1609
    find_lex_skip_current $P1610, "$!"
    $P1611 = new ['Perl6Scalar'], $P1610
    setprop $P1611, "rw", true
    .lex "$!", $P1611
    .lex "call_sig", param_1612
    find_lex $P1613, "call_sig"
    bind_signature $P1613
.annotate "line", 238
    find_lex $P1614, "$num_of_tests_planned"
    find_lex $P1615, "$num_of_tests_run"
    "&infix:<=>"($P1614, $P1615)
.annotate "line", 239
    new $P1616, "Perl6Str"
    assign $P1616, "1.."
    find_lex $P1617, "$num_of_tests_planned"
    concat $P1618, $P1616, $P1617
    $P1619 = "&say"($P1618)
.annotate "line", 237
    .return ($P1619)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "" :load :init :subid("post241") :outer("161_1267386528.16994")
.annotate "line", 237
    .const 'Sub' $P1604 = "161_1267386528.16994" 
    .local pmc block
    set block, $P1604
    $P1620 = allocate_signature 0
    .local pmc signature_58
    set signature_58, $P1620
    null $P0
    null $S0
    .local pmc signature
    set signature, signature_58
    setprop block, "$!signature", signature
.end


.HLL "perl6"

.namespace ["Test"]
.sub "_block1625"  :anon :subid("162_1267386528.16994") :outer("159_1267386528.16994")
    .param pmc param_1634 :call_sig
.annotate "line", 242
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P1627
    find_lex_skip_current $P1628, "$_"
    $P1629 = new ['Perl6Scalar'], $P1628
    setprop $P1629, "rw", true
    .lex "$_", $P1629
    find_lex_skip_current $P1630, "$/"
    $P1631 = new ['Perl6Scalar'], $P1630
    setprop $P1631, "rw", true
    .lex "$/", $P1631
    find_lex_skip_current $P1632, "$!"
    $P1633 = new ['Perl6Scalar'], $P1632
    setprop $P1633, "rw", true
    .lex "$!", $P1633
    .lex "call_sig", param_1634
    find_lex $P1635, "call_sig"
    bind_signature $P1635
.annotate "line", 243
    new $P1636, "Perl6Str"
    assign $P1636, "Looks like you planned "
    find_lex $P1637, "$num_of_tests_planned"
    concat $P1638, $P1636, $P1637
    new $P1639, "Perl6Str"
    assign $P1639, " tests, but ran "
    concat $P1640, $P1638, $P1639
    find_lex $P1641, "$num_of_tests_run"
    concat $P1642, $P1640, $P1641
    $P1643 = "&diag"($P1642)
.annotate "line", 242
    .return ($P1643)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "" :load :init :subid("post243") :outer("162_1267386528.16994")
.annotate "line", 242
    .const 'Sub' $P1626 = "162_1267386528.16994" 
    .local pmc block
    set block, $P1626
    $P1644 = allocate_signature 0
    .local pmc signature_59
    set signature_59, $P1644
    null $P0
    null $S0
    .local pmc signature
    set signature, signature_59
    setprop block, "$!signature", signature
.end


.HLL "perl6"

.namespace ["Test"]
.sub "_block1648"  :anon :subid("163_1267386528.16994") :outer("159_1267386528.16994")
    .param pmc param_1657 :call_sig
.annotate "line", 245
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P1650
    find_lex_skip_current $P1651, "$_"
    $P1652 = new ['Perl6Scalar'], $P1651
    setprop $P1652, "rw", true
    .lex "$_", $P1652
    find_lex_skip_current $P1653, "$/"
    $P1654 = new ['Perl6Scalar'], $P1653
    setprop $P1654, "rw", true
    .lex "$/", $P1654
    find_lex_skip_current $P1655, "$!"
    $P1656 = new ['Perl6Scalar'], $P1655
    setprop $P1656, "rw", true
    .lex "$!", $P1656
    .lex "call_sig", param_1657
    find_lex $P1658, "call_sig"
    bind_signature $P1658
.annotate "line", 246
    new $P1659, "Perl6Str"
    assign $P1659, "Looks like you failed "
    find_lex $P1660, "$num_of_tests_failed"
    concat $P1661, $P1659, $P1660
    new $P1662, "Perl6Str"
    assign $P1662, " tests of "
    concat $P1663, $P1661, $P1662
    find_lex $P1664, "$num_of_tests_run"
    concat $P1665, $P1663, $P1664
    $P1666 = "&diag"($P1665)
.annotate "line", 245
    .return ($P1666)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "" :load :init :subid("post244") :outer("163_1267386528.16994")
.annotate "line", 245
    .const 'Sub' $P1649 = "163_1267386528.16994" 
    .local pmc block
    set block, $P1649
    $P1667 = allocate_signature 0
    .local pmc signature_60
    set signature_60, $P1667
    null $P0
    null $S0
    .local pmc signature
    set signature, signature_60
    setprop block, "$!signature", signature
.end


.HLL "perl6"

.namespace ["Test"]
.sub "_block1675"  :anon :subid("164_1267386528.16994") :outer("65_1267386528.16994")
.annotate "line", 250
    .const 'Sub' $P1697 = "165_1267386528.16994" 
    capture_lex $P1697
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P1677
    find_lex_skip_current $P1678, "$_"
    $P1679 = new ['Perl6Scalar'], $P1678
    setprop $P1679, "rw", true
    .lex "$_", $P1679
    find_lex_skip_current $P1680, "$/"
    $P1681 = new ['Perl6Scalar'], $P1680
    setprop $P1681, "rw", true
    .lex "$/", $P1681
    find_lex_skip_current $P1682, "$!"
    $P1683 = new ['Perl6Scalar'], $P1682
    setprop $P1683, "rw", true
    .lex "$!", $P1683
.annotate "line", 251
    get_global $P1684, "$done_testing_has_been_run"
    unless_null $P1684, vivify_245
    new $P1684, "Perl6Scalar"
    setprop $P1684, "rw", true
    setprop $P1684, "scalar", true
    set_global "$done_testing_has_been_run", $P1684
  vivify_245:
    .lex "$done_testing_has_been_run", $P1684
.annotate "line", 252
    get_global $P1685, "$no_plan"
    unless_null $P1685, vivify_246
    new $P1685, "Perl6Scalar"
    setprop $P1685, "rw", true
    setprop $P1685, "scalar", true
    set_global "$no_plan", $P1685
  vivify_246:
    .lex "$no_plan", $P1685
.annotate "line", 250
    find_lex $P1686, "$done_testing_has_been_run"
    find_lex $P1687, "$no_plan"
.annotate "line", 256
    find_lex $P1692, "$done_testing_has_been_run"
    $P1693 = "&prefix:<!>"($P1692)
    if $P1693, if_1691
    set $P1690, $P1693
    goto if_1691_end
  if_1691:
    find_lex $P1694, "$no_plan"
    $P1695 = "&prefix:<!>"($P1694)
    set $P1690, $P1695
  if_1691_end:
    if $P1690, if_1689
    set $P1688, $P1690
    goto if_1689_end
  if_1689:
    .const 'Sub' $P1697 = "165_1267386528.16994" 
    capture_lex $P1697
    $P1709 = $P1697()
    set $P1688, $P1709
  if_1689_end:
.annotate "line", 250
    .return ($P1688)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "_block1696"  :anon :subid("165_1267386528.16994") :outer("164_1267386528.16994")
    .param pmc param_1705 :call_sig
.annotate "line", 256
    .local pmc true
    true = get_hll_global 'True'
    .lex "__CANDIDATE_LIST__", $P1698
    find_lex_skip_current $P1699, "$_"
    $P1700 = new ['Perl6Scalar'], $P1699
    setprop $P1700, "rw", true
    .lex "$_", $P1700
    find_lex_skip_current $P1701, "$/"
    $P1702 = new ['Perl6Scalar'], $P1701
    setprop $P1702, "rw", true
    .lex "$/", $P1702
    find_lex_skip_current $P1703, "$!"
    $P1704 = new ['Perl6Scalar'], $P1703
    setprop $P1704, "rw", true
    .lex "$!", $P1704
    .lex "call_sig", param_1705
    find_lex $P1706, "call_sig"
    bind_signature $P1706
.annotate "line", 257
    $P1707 = "&done_testing"()
.annotate "line", 256
    .return ($P1707)
.end


.HLL "perl6"

.namespace ["Test"]
.sub "" :load :init :subid("post247") :outer("165_1267386528.16994")
.annotate "line", 256
    .const 'Sub' $P1697 = "165_1267386528.16994" 
    .local pmc block
    set block, $P1697
    $P1708 = allocate_signature 0
    .local pmc signature_62
    set signature_62, $P1708
    null $P0
    null $S0
    .local pmc signature
    set signature, signature_62
    setprop block, "$!signature", signature
.end


.HLL "perl6"

.namespace []
.sub "_block1712" :load :init :anon :subid("166_1267386528.16994")
.annotate "line", 1
    $P1714 = "!fire_phasers"("CHECK")
    .return ($P1714)
.end


.HLL "perl6"

.namespace []
.sub "_block1715" :load :anon :subid("167_1267386528.16994")
.annotate "line", 1
    .const 'Sub' $P1717 = "63_1267386528.16994" 
    $P1718 = "!UNIT_START"($P1717)
    .return ($P1718)
.end

