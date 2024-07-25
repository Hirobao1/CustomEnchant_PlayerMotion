
kill @s
execute if score #temp.flag hb.Motion matches 1 as @e[tag=hb.temp] run schedule function p_motion:system/tp 1t
tag @a[tag=hb.motion] remove hb.motion
