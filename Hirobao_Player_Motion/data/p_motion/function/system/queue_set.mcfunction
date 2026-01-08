
tag @s add hb.pm_queue

# 分解ベクトル加算
scoreboard players operation @s hb.Queue_x += #x_ hb.Motion
scoreboard players operation @s hb.Queue_y += #y_ hb.Motion
scoreboard players operation @s hb.Queue_z += #z_ hb.Motion

# 値の修正
execute if score @s hb.Queue_x matches 250001.. run scoreboard players set @s hb.Queue_x 250000
execute if score @s hb.Queue_x matches ..-250001 run scoreboard players set @s hb.Queue_x -250000
execute if score @s hb.Queue_y matches 250001.. run scoreboard players set @s hb.Queue_y 250000
execute if score @s hb.Queue_y matches ..-250001 run scoreboard players set @s hb.Queue_y -250000
execute if score @s hb.Queue_z matches 250001.. run scoreboard players set @s hb.Queue_z 250000
execute if score @s hb.Queue_z matches ..-250001 run scoreboard players set @s hb.Queue_z -250000

# スケジュール実行
schedule clear p_motion:system/queue_apply
schedule function p_motion:system/queue_apply 1t
