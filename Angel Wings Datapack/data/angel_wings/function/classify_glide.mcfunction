scoreboard players set @s aw.slope 0
execute store result score @s aw.nowY run data get entity @s Pos[1] 1000
scoreboard players operation @s aw.nowY -= @s aw.lastY
execute if entity @s[x_rotation=14..90] run scoreboard players set @s aw.slope 1
execute if entity @s[x_rotation=-3..90] if score @s aw.nowY matches ..-50 run scoreboard players set @s aw.slope 1
execute store result score @s aw.lastY run data get entity @s Pos[1] 1000
