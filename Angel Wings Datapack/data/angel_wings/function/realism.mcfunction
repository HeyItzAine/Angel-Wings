scoreboard players add @s aw.real 0
scoreboard players add @s aw.real 1
execute if score @s aw.real matches 2.. run scoreboard players set @s aw.real 0
execute if score @s aw.real matches 0 run title @s actionbar {"text":"Idle bobbing off","color":"gray"}
execute if score @s aw.real matches 1 run title @s actionbar {"text":"Idle bobbing on","color":"aqua"}
scoreboard players set @s aw_realism 0
