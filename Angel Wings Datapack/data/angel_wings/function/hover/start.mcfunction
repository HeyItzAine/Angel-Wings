scoreboard players set @s aw.wind 0
scoreboard players set @s aw.mode 2
item modify entity @s armor.chest angel_wings:fold
attribute @s minecraft:gravity modifier remove angel_wings:flight
attribute @s minecraft:gravity modifier add angel_wings:flight -1 add_multiplied_total
execute store result score @s aw.anchor run data get entity @s Pos[1] 1000
data modify storage angel_wings:motion x set from entity @s Pos[0]
data modify storage angel_wings:motion y set from entity @s Pos[1]
data modify storage angel_wings:motion z set from entity @s Pos[2]
function angel_wings:hover/brake with storage angel_wings:motion
scoreboard players set @s aw.bob 0
function angel_wings:poses/hover
