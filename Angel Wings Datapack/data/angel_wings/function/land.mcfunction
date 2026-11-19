scoreboard players set @s aw.wind 0
attribute @s minecraft:movement_speed modifier remove angel_wings:cruise
attribute @s minecraft:gravity modifier remove angel_wings:flight
attribute @s minecraft:jump_strength modifier remove angel_wings:flight
attribute @s minecraft:fall_damage_multiplier modifier remove angel_wings:flight
execute if items entity @s armor.chest minecraft:elytra[minecraft:custom_data~{angel_wings:1b}] unless items entity @s armor.chest *[damage~{durability:{max:1}}] at @s run function angel_wings:poses/resting
execute if items entity @s armor.chest minecraft:elytra[minecraft:custom_data~{angel_wings:1b}] run function angel_wings:apply_beat {slot:"armor.chest",modifiers:'[{"type":"minecraft:set_enchantments","enchantments":{"angel_wings:wingbeat":0}},"angel_wings:unfold"]'}
tag @s remove aw.fly
scoreboard players set @s aw.mode 0
scoreboard players set @s aw.launch 0
scoreboard players set @s aw.charge 0
scoreboard players set @s aw.pulse 0
tag @s remove aw.glide
