scoreboard players remove @s aw.launch 1
execute positioned ~ ~0.5 ~ store result score @s aw.move run function angel_wings:step
execute if score @s aw.move matches 0 run scoreboard players set @s aw.launch 0
execute if score @s aw.launch matches 0 at @s run function angel_wings:hover/start
