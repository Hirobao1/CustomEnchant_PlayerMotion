scoreboard players add #rotate_xyz hb.Motion 1

execute if score #rotate_xyz hb.Motion matches 1 rotated as @s run rotate 21a7163d-5fc5-411b-a466-6800627c9da0 ~ ~
execute if score #rotate_xyz hb.Motion matches 1 run rotate @s -90 0
execute if score #rotate_xyz hb.Motion matches 5 run rotate @s -90 -90
execute if score #rotate_xyz hb.Motion matches 9 run rotate @s 0 0

execute if score #rotate_xyz hb.Motion matches 12 rotated as 21a7163d-5fc5-411b-a466-6800627c9da0 run rotate @s ~ ~
execute if score #rotate_xyz hb.Motion matches 12 run scoreboard players reset #rotate_xyz hb.Motion
