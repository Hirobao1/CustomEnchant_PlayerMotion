#> p_motion:enchant/enchant_del
# 押し終わったら、エンチャントとまだ押していない分を消す（forward_1 の tick 効果から、付けている本人が実行する）

item modify entity @s armor.body {type:"set_enchantments",enchantments:{"p_motion:forward_1":0,"p_motion:forward_2":0,"p_motion:forward_3":0,"p_motion:up_1":0,"p_motion:up_2":0,"p_motion:up_3":0,"p_motion:left_1":0,"p_motion:left_2":0,"p_motion:left_3":0}}
scoreboard players reset @s hb.Motion_forward
scoreboard players reset @s hb.Motion_up
scoreboard players reset @s hb.Motion_left
