execute if entity @s[tag=aw.fly] run function angel_wings:land
execute unless items entity @s armor.chest *[custom_data~{aw_snapped:1b}] run playsound angel_wings:snap player @a[distance=..20] ~ ~ ~ 0.85 1
item modify entity @s armor.chest angel_wings:snapped
scoreboard players set @s aw.pose 6
