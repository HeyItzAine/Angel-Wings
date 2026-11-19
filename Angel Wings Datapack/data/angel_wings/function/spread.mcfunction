scoreboard players set @s aw.wind 0
execute unless entity @s[tag=aw.fly] run function angel_wings:start
scoreboard players set @s aw.mode 1
scoreboard players set @s aw.idle 0
scoreboard players set @s aw.clock 0
attribute @s minecraft:gravity modifier remove angel_wings:flight
item modify entity @s armor.chest angel_wings:unfold
function angel_wings:poses/cruise
tag @s remove aw.glide
attribute @s minecraft:gravity modifier add angel_wings:flight -1 add_multiplied_total
execute store result score @s aw.lx run data get entity @s Pos[0] 64
execute store result score @s aw.ly run data get entity @s Pos[1] 64
execute store result score @s aw.lz run data get entity @s Pos[2] 64
execute store result score @s aw.lastY run data get entity @s Pos[1] 1000
scoreboard players set @s aw.slope 0
