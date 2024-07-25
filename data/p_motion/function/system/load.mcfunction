#> p_motion:system/load
# 一度だけ実行

# 使用するスコアボード
scoreboard objectives add hb.Motion dummy
scoreboard players set #xyz.flag hb.Motion 0
scoreboard players set #looking.flag hb.Motion 0
scoreboard players set #-1 hb.Motion -1
scoreboard players set #100 hb.Motion 100
scoreboard players set #10000 hb.Motion 10000
scoreboard players set #1000000 hb.Motion 1000000
scoreboard players set #2048 hb.Motion 2048

# 使用するストレージ
data merge storage hb:motion {macro:{x1:0,x2:0,x3:0,y1:0,y2:0,y3:0,z1:0,z2:0,z3:0},Pos:[0,0,0]}

# 計算用チャンク
execute in minecraft:overworld run forceload add 0 0
