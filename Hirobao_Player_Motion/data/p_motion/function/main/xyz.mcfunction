#> p_motion:main/xyz
# 実行者にxyzでMotionを付与する
#
# scoreboard players set $x hb.Motion 0 (-250000~250000)
# scoreboard players set $y hb.Motion 0 (-250000~250000)
# scoreboard players set $z hb.Motion 0 (-250000~250000)

# スペクテイター・騎乗中・飛行中は何もしない
execute if entity @s[gamemode=spectator] run return fail
execute if predicate p_motion:skip run return fail

# 値の修正（範囲外は端に寄せ、未設定は 0）
execute store result score $x hb.Motion run compute default integer {type:"max",inputs:[-250000,{type:"min",inputs:[250000,{type:"score",target:{type:"fixed",name:"$x"},score:"hb.Motion"}]}]}
execute store result score $y hb.Motion run compute default integer {type:"max",inputs:[-250000,{type:"min",inputs:[250000,{type:"score",target:{type:"fixed",name:"$y"},score:"hb.Motion"}]}]}
execute store result score $z hb.Motion run compute default integer {type:"max",inputs:[-250000,{type:"min",inputs:[250000,{type:"score",target:{type:"fixed",name:"$z"},score:"hb.Motion"}]}]}
execute if score $x hb.Motion matches 0 if score $y hb.Motion matches 0 if score $z hb.Motion matches 0 run return fail

# ワールドの軸の値
data modify storage hb:motion world set value [0.0d, 0.0d, 0.0d]
execute store result storage hb:motion world[0] double 1 run scoreboard players get $x hb.Motion
execute store result storage hb:motion world[1] double 1 run scoreboard players get $y hb.Motion
execute store result storage hb:motion world[2] double 1 run scoreboard players get $z hb.Motion

# 実行者に付与
function p_motion:system/apply
