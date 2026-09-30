#> p_motion:system/to_local
# ワールドの軸の値（world）を、対象の向き基準の 前・上・左 の値にする
# 実行者は 0,0,0 に召喚した marker（向きは対象に合わせてある）

# 前・上・左 の単位ベクトルとの内積
tp @s ^ ^ ^1
data modify storage hb:motion basis set from entity @s Pos
execute store result score #local_f hb.Motion run compute default float p_motion:dot
tp @s ^ ^1 ^
data modify storage hb:motion basis set from entity @s Pos
execute store result score #local_u hb.Motion run compute default float p_motion:dot
tp @s ^1 ^ ^
data modify storage hb:motion basis set from entity @s Pos
execute store result score #local_l hb.Motion run compute default float p_motion:dot

kill @s
