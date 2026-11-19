execute unless score @s aw.dir matches 0 run return run function angel_wings:resume
execute if predicate angel_wings:jump run return run function angel_wings:hover/rise
function angel_wings:poses/hover
execute if score @s aw.real matches 0 if score @s aw.bob matches 0 run return 0
execute unless predicate angel_wings:idle if score @s aw.bob matches 0 run return 0
scoreboard players operation @s aw.height = @s aw.anchor
execute if score @s aw.real matches 1 if predicate angel_wings:idle run function angel_wings:hover/wave
execute unless predicate angel_wings:idle run scoreboard players set @s aw.bob 0
execute if score @s aw.real matches 0 run scoreboard players set @s aw.bob 0
execute store result storage angel_wings:motion y double 0.001 run scoreboard players get @s aw.height
function angel_wings:hover/position with storage angel_wings:motion
