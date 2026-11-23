scoreboard players set #station aw.clock 0
execute at @a as @e[type=item,distance=..12,nbt={OnGround:1b,Item:{id:"minecraft:elytra"}}] at @s if data entity @s Item.components."minecraft:custom_data"{angel_wings:1b} positioned ~ ~-0.05 ~ run function angel_wings:armor/station
