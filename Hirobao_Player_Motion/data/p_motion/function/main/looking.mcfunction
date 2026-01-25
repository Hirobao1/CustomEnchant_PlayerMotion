#> p_motion:main/looking
# 実行時の向きにMotionを付与する
#
# scoreboard players set $strength hb.Motion 0 (-250000~250000)

# 値の修正
execute if score $strength hb.Motion matches 250001.. run scoreboard players set $strength hb.Motion 250000
execute if score $strength hb.Motion matches ..-250001 run scoreboard players set $strength hb.Motion -250000
execute unless score $strength hb.Motion = $strength hb.Motion run scoreboard players set $strength hb.Motion 0

# 値を取得 ( f1:1/10000, f2:1/100, f3:1, level:1~99,100~199,200~250 )
data merge storage hb:motion {macro:{f1:0,f2:0,f3:0,u1:0,u2:0,u3:0,l1:0,l2:0,l3:0,signf:"+forward",signu:"+up",signl:"+left",UUID:[]}}
execute positioned 0.0 0.0 0.0 summon marker run function p_motion:system/vector_set

# 既にエンチャントがある場合キューに入れる
execute if items entity @s armor.body *[enchantments~[{enchantments:"p_motion:forward_1",levels:{min:1}}]] run return run function p_motion:system/queue_set

# 絶対座標ベクトル変換
execute at @s positioned 0.0 0.0 0.0 summon marker run function p_motion:system/local_to_world

# forward
execute if score #local_fx hb.Motion matches ..-1 run data modify storage hb:motion macro.signf set value "-forward"
execute if data storage hb:motion macro{signf:"-forward"} run scoreboard players operation #local_fx hb.Motion *= #-1 hb.Motion
execute store result storage hb:motion macro.f3 int 0.0001 run scoreboard players operation #local_fx_ hb.Motion = #local_fx hb.Motion
execute store result storage hb:motion macro.f2 int 0.01 run scoreboard players operation #local_fx_ hb.Motion %= #10000 hb.Motion
execute store result storage hb:motion macro.f1 int 1 run scoreboard players operation #local_fx_ hb.Motion %= #100 hb.Motion
execute if data storage hb:motion macro{f1:0} run data modify storage hb:motion macro.f1 set value 251
# up
execute if score #local_ux hb.Motion matches ..-1 run data modify storage hb:motion macro.signu set value "-up"
execute if data storage hb:motion macro{signu:"-up"} run scoreboard players operation #local_ux hb.Motion *= #-1 hb.Motion
execute store result storage hb:motion macro.u3 int 0.0001 run scoreboard players operation #local_ux_ hb.Motion = #local_ux hb.Motion
execute store result storage hb:motion macro.u2 int 0.01 run scoreboard players operation #local_ux_ hb.Motion %= #10000 hb.Motion
execute store result storage hb:motion macro.u1 int 1 run scoreboard players operation #local_ux_ hb.Motion %= #100 hb.Motion
# left
execute if score #local_lx hb.Motion matches ..-1 run data modify storage hb:motion macro.signl set value "-left"
execute if data storage hb:motion macro{signl:"-left"} run scoreboard players operation #local_lx hb.Motion *= #-1 hb.Motion
execute store result storage hb:motion macro.l3 int 0.0001 run scoreboard players operation #local_lx_ hb.Motion = #local_lx hb.Motion
execute store result storage hb:motion macro.l2 int 0.01 run scoreboard players operation #local_lx_ hb.Motion %= #10000 hb.Motion
execute store result storage hb:motion macro.l1 int 1 run scoreboard players operation #local_lx_ hb.Motion %= #100 hb.Motion

# 不要スコア消去
scoreboard players reset #x_ hb.Motion
scoreboard players reset #y_ hb.Motion
scoreboard players reset #z_ hb.Motion
scoreboard players reset #local_fx_ hb.Motion
scoreboard players reset #local_ux_ hb.Motion
scoreboard players reset #local_lx_ hb.Motion

# エンチャントセット
function p_motion:system/enchant_set with storage hb:motion macro
