#> p_motion:main/looking
# 実行時の向きにMotionを付与する
#
# scoreboard players set $strength hb.Motion 0 (-250000~250000)

# スペクテイター・騎乗中・飛行中は何もしない
execute if entity @s[gamemode=spectator] run return fail
execute if predicate p_motion:skip run return fail

# 値の修正（範囲外は端に寄せ、未設定は 0）
execute store result score $strength hb.Motion run compute default integer {type:"max",inputs:[-250000,{type:"min",inputs:[250000,{type:"score",target:{type:"fixed",name:"$strength"},score:"hb.Motion"}]}]}
execute if score $strength hb.Motion matches 0 run return fail

# 実行時の向きの前方向 × $strength を、ワールドの軸の値にする
data modify storage hb:motion world set value [0.0d, 0.0d, 0.0d]
execute store result storage hb:motion strength int 1 run scoreboard players get $strength hb.Motion
execute in overworld positioned 0.0 0.0 0.0 summon marker run function p_motion:system/direction

# 実行者に付与
function p_motion:system/apply
