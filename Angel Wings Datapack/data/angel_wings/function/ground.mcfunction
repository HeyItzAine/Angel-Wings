execute unless predicate angel_wings:sneak run scoreboard players set @s aw.charge 0
execute unless entity @s[x_rotation=-90..-55,nbt={OnGround:1b}] run scoreboard players set @s aw.charge 0
execute if predicate angel_wings:sneak if entity @s[x_rotation=-90..-55,nbt={OnGround:1b}] unless score @s aw.charge matches 60 run function angel_wings:charge
