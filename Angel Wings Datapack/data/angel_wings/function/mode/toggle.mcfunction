scoreboard players set @s aw_mode 0
execute if entity @s[tag=aw.elytra] run return run function angel_wings:mode/angel
tag @s add aw.elytra
execute if entity @s[tag=aw.fly] run function angel_wings:land
scoreboard players set @s aw.charge 0
scoreboard players set @s aw.dash 0
title @s actionbar {"text":"Elytra mode","color":"aqua"}
