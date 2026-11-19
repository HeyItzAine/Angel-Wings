scoreboard players set @s aw.wind 0
attribute @s minecraft:movement_speed modifier remove angel_wings:cruise
execute if entity @s[tag=aw.fly] run function angel_wings:land
item modify entity @s armor.chest angel_wings:refit
tag @s add aw.worn
tag @s add aw.v2
scoreboard players set @s aw.mode 0
scoreboard players set @s aw.held 0
scoreboard players set @s aw.charge 0
scoreboard players set @s aw.launch 0
scoreboard players set @s aw.pulse 0
scoreboard players add @s aw.real 0
scoreboard players set @s aw.pose 0
