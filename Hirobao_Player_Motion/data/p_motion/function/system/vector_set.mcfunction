#> p_motion:system/vector_set
# 視線先の分解ベクトル

# 単位ベクトル値取得
tp @s ^ ^ ^1 ~ ~
data modify storage hb:motion Pos set from entity @s Pos
execute store result score $x_ hb.Motion run data get storage hb:motion Pos[0] 2048
execute store result score $y_ hb.Motion run data get storage hb:motion Pos[1] 2048
execute store result score $z_ hb.Motion run data get storage hb:motion Pos[2] 2048

# xyzの値計算
scoreboard players operation $x_ hb.Motion *= $strength hb.Motion
scoreboard players operation $y_ hb.Motion *= $strength hb.Motion
scoreboard players operation $z_ hb.Motion *= $strength hb.Motion
scoreboard players operation $x_ hb.Motion /= #2048 hb.Motion
scoreboard players operation $y_ hb.Motion /= #2048 hb.Motion
scoreboard players operation $z_ hb.Motion /= #2048 hb.Motion

# マーカー消去
kill @s
