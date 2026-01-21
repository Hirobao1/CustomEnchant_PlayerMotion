
# エンチャントがない場合、キューからエンチャントセット
execute as @a[tag=hb.pm_queue] unless items entity @s armor.body *[enchantments~[{enchantments:"p_motion:forward_1",levels:{min:1}}]] run function p_motion:main/queue

# エンチャントがある場合、再度schedule
execute if entity @a[tag=hb.pm_queue] run schedule clear p_motion:system/queue_apply
execute if entity @a[tag=hb.pm_queue] run schedule function p_motion:system/queue_apply 1t
