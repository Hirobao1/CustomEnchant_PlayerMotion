#> p_motion:system/direction
# 実行時の向きの前方向の単位ベクトルを $strength 倍し、ワールドの軸の値にする
# 実行者は 0,0,0 に召喚した marker（向きは呼び出し元のまま）

tp @s ^ ^ ^1
data modify storage hb:motion direction set from entity @s Pos
kill @s

execute store result storage hb:motion world[0] double 1 run compute default float {type:"round",input:{type:"mul",inputs:[{type:"storage",storage:"hb:motion",path:"direction[0]"},{type:"storage",storage:"hb:motion",path:"strength"}]}}
execute store result storage hb:motion world[1] double 1 run compute default float {type:"round",input:{type:"mul",inputs:[{type:"storage",storage:"hb:motion",path:"direction[1]"},{type:"storage",storage:"hb:motion",path:"strength"}]}}
execute store result storage hb:motion world[2] double 1 run compute default float {type:"round",input:{type:"mul",inputs:[{type:"storage",storage:"hb:motion",path:"direction[2]"},{type:"storage",storage:"hb:motion",path:"strength"}]}}
