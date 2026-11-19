execute store result score @s aw.aim run data get entity @s Rotation[1]
execute if score @s aw.aim matches ..14 run scoreboard players set @s aw.aim 14
execute unless entity @s[tag=aw.glide] run scoreboard players set @s aw.dive -1
execute unless score @s aw.dive = @s aw.aim run function angel_wings:dive/update
function angel_wings:poses/glide
scoreboard players set @s aw.idle 0
scoreboard players set @s aw.clock 0
