#> p_motion:system/local_to_world
#絶対座標ベクトルに対するローカル座標ベクトルの割合計算

# モーション代入(*10000)
 execute store result score #world_fx hb.Motion store result score #world_ux hb.Motion store result score #world_lx hb.Motion run scoreboard players get #x_ hb.Motion
 execute store result score #world_fy hb.Motion store result score #world_uy hb.Motion store result score #world_ly hb.Motion run scoreboard players get #y_ hb.Motion
 execute store result score #world_fz hb.Motion store result score #world_uz hb.Motion store result score #world_lz hb.Motion run scoreboard players get #z_ hb.Motion
 
# forward 単位ベクトル分解(*10000)
 execute positioned 0.0 0.0 0.0 run tp @s ^ ^ ^1
 data modify storage hb:motion Pos set from entity @s Pos
 execute store result score #local_fx hb.Motion run data get storage hb:motion Pos[0] 10000
 execute store result score #local_fy hb.Motion run data get storage hb:motion Pos[1] 10000
 execute store result score #local_fz hb.Motion run data get storage hb:motion Pos[2] 10000
 execute store result score #local_flag_1 hb.Motion store result score #local_flag_2 hb.Motion run scoreboard players set #local_flag_0 hb.Motion 0
 execute store success score #local_flag_0 hb.Motion if score #local_fx hb.Motion matches ..-1 store result score #local_fx hb.Motion run data get storage hb:motion Pos[0] -10000
 execute store success score #local_flag_1 hb.Motion if score #local_fy hb.Motion matches ..-1 store result score #local_fy hb.Motion run data get storage hb:motion Pos[1] -10000
 execute store success score #local_flag_2 hb.Motion if score #local_fz hb.Motion matches ..-1 store result score #local_fz hb.Motion run data get storage hb:motion Pos[2] -10000
 execute if score #local_flag_0 hb.Motion matches 1 run scoreboard players operation #local_fx hb.Motion *= #-1 hb.Motion
 execute if score #local_flag_1 hb.Motion matches 1 run scoreboard players operation #local_fy hb.Motion *= #-1 hb.Motion
 execute if score #local_flag_2 hb.Motion matches 1 run scoreboard players operation #local_fz hb.Motion *= #-1 hb.Motion
# up 単位ベクトル分解(*10000)
 execute positioned 0.0 0.0 0.0 run tp @s ^ ^1 ^
 data modify storage hb:motion Pos set from entity @s Pos
 execute store result score #local_ux hb.Motion run data get storage hb:motion Pos[0] 10000
 execute store result score #local_uy hb.Motion run data get storage hb:motion Pos[1] 10000
 execute store result score #local_uz hb.Motion run data get storage hb:motion Pos[2] 10000
 execute store result score #local_flag_1 hb.Motion store result score #local_flag_2 hb.Motion run scoreboard players set #local_flag_0 hb.Motion 0
 execute store success score #local_flag_0 hb.Motion if score #local_ux hb.Motion matches ..-1 store result score #local_ux hb.Motion run data get storage hb:motion Pos[0] -10000
 execute store success score #local_flag_1 hb.Motion if score #local_uy hb.Motion matches ..-1 store result score #local_uy hb.Motion run data get storage hb:motion Pos[1] -10000
 execute store success score #local_flag_2 hb.Motion if score #local_uz hb.Motion matches ..-1 store result score #local_uz hb.Motion run data get storage hb:motion Pos[2] -10000
 execute if score #local_flag_0 hb.Motion matches 1 run scoreboard players operation #local_ux hb.Motion *= #-1 hb.Motion
 execute if score #local_flag_1 hb.Motion matches 1 run scoreboard players operation #local_uy hb.Motion *= #-1 hb.Motion
 execute if score #local_flag_2 hb.Motion matches 1 run scoreboard players operation #local_uz hb.Motion *= #-1 hb.Motion
# left 単位ベクトル分解(*10000)
 execute positioned 0.0 0.0 0.0 run tp @s ^1 ^ ^
 data modify storage hb:motion Pos set from entity @s Pos
 execute store result score #local_lx hb.Motion run data get storage hb:motion Pos[0] 10000
 execute store result score #local_ly hb.Motion run data get storage hb:motion Pos[1] 10000
 execute store result score #local_lz hb.Motion run data get storage hb:motion Pos[2] 10000
 execute store result score #local_flag_1 hb.Motion store result score #local_flag_2 hb.Motion run scoreboard players set #local_flag_0 hb.Motion 0
 execute store success score #local_flag_0 hb.Motion if score #local_lx hb.Motion matches ..-1 store result score #local_lx hb.Motion run data get storage hb:motion Pos[0] -10000
 execute store success score #local_flag_1 hb.Motion if score #local_ly hb.Motion matches ..-1 store result score #local_ly hb.Motion run data get storage hb:motion Pos[1] -10000
 execute store success score #local_flag_2 hb.Motion if score #local_lz hb.Motion matches ..-1 store result score #local_lz hb.Motion run data get storage hb:motion Pos[2] -10000
 execute if score #local_flag_0 hb.Motion matches 1 store result score #local_lx hb.Motion run data get storage hb:motion Pos[0] 10000
 execute if score #local_flag_1 hb.Motion matches 1 store result score #local_ly hb.Motion run data get storage hb:motion Pos[1] 10000
 execute if score #local_flag_2 hb.Motion matches 1 store result score #local_lz hb.Motion run data get storage hb:motion Pos[2] 10000

# 内積計算(*10000)
 # forward
  scoreboard players operation #local_fx hb.Motion *= #world_fx hb.Motion
  scoreboard players operation #local_fy hb.Motion *= #world_fy hb.Motion
  scoreboard players operation #local_fz hb.Motion *= #world_fz hb.Motion
  scoreboard players operation #local_fx hb.Motion /= #10000 hb.Motion
  scoreboard players operation #local_fy hb.Motion /= #10000 hb.Motion
  scoreboard players operation #local_fz hb.Motion /= #10000 hb.Motion
  scoreboard players operation #local_fx hb.Motion += #local_fy hb.Motion
  scoreboard players operation #local_fx hb.Motion += #local_fz hb.Motion
 # up
  scoreboard players operation #local_ux hb.Motion *= #world_ux hb.Motion
  scoreboard players operation #local_uy hb.Motion *= #world_uy hb.Motion
  scoreboard players operation #local_uz hb.Motion *= #world_uz hb.Motion
  scoreboard players operation #local_ux hb.Motion /= #10000 hb.Motion
  scoreboard players operation #local_uy hb.Motion /= #10000 hb.Motion
  scoreboard players operation #local_uz hb.Motion /= #10000 hb.Motion
  scoreboard players operation #local_ux hb.Motion += #local_uy hb.Motion
  scoreboard players operation #local_ux hb.Motion += #local_uz hb.Motion
 # left
  scoreboard players operation #local_lx hb.Motion *= #world_lx hb.Motion
  scoreboard players operation #local_ly hb.Motion *= #world_ly hb.Motion
  scoreboard players operation #local_lz hb.Motion *= #world_lz hb.Motion
  scoreboard players operation #local_lx hb.Motion /= #10000 hb.Motion
  scoreboard players operation #local_ly hb.Motion /= #10000 hb.Motion
  scoreboard players operation #local_lz hb.Motion /= #10000 hb.Motion
  scoreboard players operation #local_lx hb.Motion += #local_ly hb.Motion
  scoreboard players operation #local_lx hb.Motion += #local_lz hb.Motion

kill @s
