#> p_motion:main/queue
# queueの値でMotionを付与する

tag @s remove hb.pm_queue

# 値を取得
execute store result score #x_ hb.Motion run scoreboard players get @s hb.Queue_x
execute store result score #y_ hb.Motion run scoreboard players get @s hb.Queue_y
execute store result score #z_ hb.Motion run scoreboard players get @s hb.Queue_z

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
scoreboard players reset @s hb.Queue_x
scoreboard players reset @s hb.Queue_y
scoreboard players reset @s hb.Queue_z

# エンチャントセット
function p_motion:system/enchant_set with storage hb:motion macro