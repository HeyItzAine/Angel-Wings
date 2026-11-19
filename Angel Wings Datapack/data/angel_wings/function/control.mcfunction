scoreboard players set @s aw.dash 0
function angel_wings:input
scoreboard players set @s aw.pulse 0
execute unless entity @s[tag=aw.fly] if score @s aw.charge matches 60 if entity @s[x_rotation=-90..-55] if predicate angel_wings:sneak if predicate angel_wings:jump if score @s aw.held matches 0 run function angel_wings:burst
execute unless entity @s[tag=aw.fly] unless entity @s[nbt={OnGround:1b}] if predicate angel_wings:gliding run function angel_wings:spread
execute unless entity @s[tag=aw.fly] run function angel_wings:ground
execute if entity @s[tag=aw.fly] run function angel_wings:air
scoreboard players set @s aw.held 0
execute if predicate angel_wings:jump run scoreboard players set @s aw.held 1
