scoreboard players set @s aw.wind 0
scoreboard players set @s aw.mode 3
item modify entity @s armor.chest angel_wings:fold
attribute @s minecraft:gravity modifier remove angel_wings:flight
attribute @s minecraft:gravity modifier add angel_wings:flight -0.91 add_multiplied_total
data modify storage angel_wings:motion y set from entity @s Pos[1]
function angel_wings:stop_motion with storage angel_wings:motion
function angel_wings:poses/canopy
