
# 単位ベクトル値取得
tp @s ^ ^ ^1 ~ ~
data modify storage hb:motion Pos set from entity @s Pos
execute store result score $x_look hb.Motion run data get storage hb:motion Pos[0] 2048
execute store result score $y_look hb.Motion run data get storage hb:motion Pos[1] 2048
execute store result score $z_look hb.Motion run data get storage hb:motion Pos[2] 2048

# xyzの値計算
scoreboard players operation $x_look hb.Motion *= $strength hb.Motion
scoreboard players operation $y_look hb.Motion *= $strength hb.Motion
scoreboard players operation $z_look hb.Motion *= $strength hb.Motion
scoreboard players operation $x_look hb.Motion /= #2048 hb.Motion
scoreboard players operation $y_look hb.Motion /= #2048 hb.Motion
scoreboard players operation $z_look hb.Motion /= #2048 hb.Motion

# マーカー消去
kill @s
