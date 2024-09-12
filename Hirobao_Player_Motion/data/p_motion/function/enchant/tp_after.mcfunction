execute positioned ~ ~0.0006 ~ as @e[distance=..0.0003,tag=hb.tp] at @s run tp @s ~ ~-0.0006 ~
execute positioned ~ ~ ~ as @e[distance=..0.0003,tag=hb.tp] run tag @s remove hb.tp
execute positioned ~ ~ ~ as @p[distance=..0.0003,tag=hb.executor] run tag @s remove hb.executor