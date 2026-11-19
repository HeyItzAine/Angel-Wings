function angel_wings:poses/lift
execute positioned ~ ~0.16 ~ run function angel_wings:step
execute store result score @s aw.anchor run data get entity @s Pos[1] 1000
scoreboard players set @s aw.bob 0
