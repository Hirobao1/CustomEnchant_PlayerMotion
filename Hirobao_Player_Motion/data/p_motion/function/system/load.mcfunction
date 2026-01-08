#> p_motion:system/load
# 一度だけ実行

# 使用するスコアボード
scoreboard objectives add hb.Motion dummy
scoreboard players set #-1 hb.Motion -1
scoreboard players set #100 hb.Motion 100
scoreboard players set #10000 hb.Motion 10000
scoreboard players set #2048 hb.Motion 2048
scoreboard objectives add hb.Queue_x dummy
scoreboard objectives add hb.Queue_y dummy
scoreboard objectives add hb.Queue_z dummy
scoreboard players reset * hb.Queue_x
scoreboard players reset * hb.Queue_y
scoreboard players reset * hb.Queue_z

# 使用するストレージ
data merge storage hb:motion {macro:{f1:0,f2:0,f3:0,u1:0,u2:0,u3:0,l1:0,l2:0,l3:0,signf:"+forward",signu:"+up",signl:"+left"},Pos:[]}

# 使用するチャンク
execute in minecraft:overworld run forceload add 0 0