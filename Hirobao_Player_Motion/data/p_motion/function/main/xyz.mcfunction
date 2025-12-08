#> hb_util:main/xyz
# 実行者にxyzでMotionを付与する
#
# scoreboard players set $x hb.Motion 0 (-500000~500000)
# scoreboard players set $y hb.Motion 0 (-500000~500000)
# scoreboard players set $z hb.Motion 0 (-500000~500000)

# 値の修正
execute if score $x hb.Motion matches 500001.. run scoreboard players set $x hb.Motion 500000
execute if score $x hb.Motion matches ..-500001 run scoreboard players set $x hb.Motion -500000
execute if score $y hb.Motion matches 500001.. run scoreboard players set $y hb.Motion 500000
execute if score $y hb.Motion matches ..-500001 run scoreboard players set $y hb.Motion -500000
execute if score $z hb.Motion matches 500001.. run scoreboard players set $z hb.Motion 500000
execute if score $z hb.Motion matches ..-500001 run scoreboard players set $z hb.Motion -500000
execute unless score $x hb.Motion = $x hb.Motion run scoreboard players set $x hb.Motion 0
execute unless score $y hb.Motion = $y hb.Motion run scoreboard players set $y hb.Motion 0
execute unless score $z hb.Motion = $z hb.Motion run scoreboard players set $z hb.Motion 0
scoreboard players set #rotate_xyz hb.Motion 0

# 値を取得 ( x1:1/10000, x2:1/100, x3:1, level:1~99,100~199,200~250)
data merge storage hb:motion {macro:{x1:0,x2:0,x3:0,y1:0,y2:0,y3:0,z1:0,z2:0,z3:0,signx:"+x",signy:"+y",signz:"+z",UUID:[]}}

execute if score $x hb.Motion matches ..-1 run data modify storage hb:motion macro.signx set value "-x"
execute if data storage hb:motion macro{signx:"-x"} run scoreboard players operation $x hb.Motion *= #-1 hb.Motion
scoreboard players operation $x_ hb.Motion = $x hb.Motion
execute store result storage hb:motion macro.x3 int 0.0001 run scoreboard players add $x_ hb.Motion 2000000
scoreboard players operation $x_ hb.Motion %= #10000 hb.Motion
execute store result storage hb:motion macro.x2 int 0.01 run scoreboard players add $x_ hb.Motion 10000
execute store result storage hb:motion macro.x1 int 1 run scoreboard players operation $x_ hb.Motion %= #100 hb.Motion
execute if data storage hb:motion macro{x1:0} run data modify storage hb:motion macro.x1 set value 251
execute if data storage hb:motion macro{signx:"-x"} run scoreboard players operation $x hb.Motion *= #-1 hb.Motion

execute if score $y hb.Motion matches ..-1 run data modify storage hb:motion macro.signy set value "-y"
execute if data storage hb:motion macro{signy:"-y"} run scoreboard players operation $y hb.Motion *= #-1 hb.Motion
scoreboard players operation $y_ hb.Motion = $y hb.Motion
execute store result storage hb:motion macro.y3 int 0.0001 run scoreboard players add $y_ hb.Motion 2000000
scoreboard players operation $y_ hb.Motion %= #10000 hb.Motion
execute store result storage hb:motion macro.y2 int 0.01 run scoreboard players add $y_ hb.Motion 10000
execute store result storage hb:motion macro.y1 int 1 run scoreboard players operation $y_ hb.Motion %= #100 hb.Motion
execute if data storage hb:motion macro{y1:0} run data modify storage hb:motion macro.y1 set value 251
execute if data storage hb:motion macro{signy:"-y"} run scoreboard players operation $y hb.Motion *= #-1 hb.Motion

execute if score $z hb.Motion matches ..-1 run data modify storage hb:motion macro.signz set value "-z"
execute if data storage hb:motion macro{signz:"-z"} run scoreboard players operation $z hb.Motion *= #-1 hb.Motion
scoreboard players operation $z_ hb.Motion = $z hb.Motion
execute store result storage hb:motion macro.z3 int 0.0001 run scoreboard players add $z_ hb.Motion 2000000
scoreboard players operation $z_ hb.Motion %= #10000 hb.Motion
execute store result storage hb:motion macro.z2 int 0.01 run scoreboard players add $z_ hb.Motion 10000
execute store result storage hb:motion macro.z1 int 1 run scoreboard players operation $z_ hb.Motion %= #100 hb.Motion
execute if data storage hb:motion macro{z1:0} run data modify storage hb:motion macro.z1 set value 251
execute if data storage hb:motion macro{signz:"-z"} run scoreboard players operation $z hb.Motion *= #-1 hb.Motion

# 不要スコア消去
scoreboard players reset $x_ hb.Motion
scoreboard players reset $y_ hb.Motion
scoreboard players reset $z_ hb.Motion

# UUID取得
data modify storage hb:motion macro.UUID set from entity @s UUID

# エンティティ召喚
function p_motion:system/summon with storage hb:motion macro