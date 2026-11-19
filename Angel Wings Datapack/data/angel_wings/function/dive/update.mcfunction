tag @s add aw.glide
scoreboard players operation @s aw.dive = @s aw.aim
attribute @s minecraft:gravity modifier remove angel_wings:flight
execute if score @s aw.aim matches 90.. run return 0
scoreboard players operation #reduction aw.aim = @s aw.aim
scoreboard players remove #reduction aw.aim 90
execute store result storage angel_wings:motion dive_modifier double 0.01118421 run scoreboard players get #reduction aw.aim
function angel_wings:dive/apply with storage angel_wings:motion
