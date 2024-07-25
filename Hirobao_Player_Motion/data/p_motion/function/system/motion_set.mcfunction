#> p_motion:system/motion_set
# Motion付与処理

# タグ付与
tag @s add hb.motion

# 影響範囲内に他エンティティがいるとき
#execute at @s if entity @e[distance=..0.0003,tag=!hb.motion] as @e[distance=..0.0003,tag=!hb.motion] store success score #temp.flag hb.Motion run function p_motion:system/tp_temp

# エンチャントエンティティ召喚
execute if score #xyz.flag hb.Motion matches 1 run function p_motion:system/summon_xyz with storage hb:motion macro
execute if score #looking.flag hb.Motion matches 1 run function p_motion:system/summon_looking with storage hb:motion macro

# 他エンティティを戻す（エンチャント内で実行）
# タグ消去（エンチャント内で実行）
