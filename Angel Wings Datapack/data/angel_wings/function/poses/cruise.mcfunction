execute if score @s aw.pose matches 2 run return 0
execute if score @s aw.pose matches 0 run playsound angel_wings:opening player @a[distance=..16] ~ ~ ~ .65 1
item modify entity @s armor.chest angel_wings:poses/cruise
scoreboard players set @s aw.pose 2
