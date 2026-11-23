execute if entity @s[tag=aw.v2] unless items entity @s armor.chest *[custom_data~{angel_wings_v7:1b}] run function angel_wings:unequip
execute unless entity @s[tag=aw.v2] run function angel_wings:equip
execute if items entity @s armor.chest *[damage~{durability:{max:1}}] unless score @s aw.pose matches 6 run function angel_wings:break
execute if items entity @s armor.chest *[damage~{durability:{max:1}}] run return 0
execute if items entity @s armor.chest *[custom_data~{aw_snapped:1b}] run function angel_wings:repair
execute if score @s aw.pose matches 6 run function angel_wings:equip
execute if entity @s[tag=aw.elytra] run return run function angel_wings:mode/elytra
execute unless entity @s[nbt={Health:0.0f}] run function angel_wings:control
