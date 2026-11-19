execute unless predicate angel_wings:jump run scoreboard players set @s aw.wind 0
execute unless predicate angel_wings:jump run return 0
execute if score @s aw.wind matches 20.. run return 0
scoreboard players add @s aw.wind 1
scoreboard players set @s aw.idle 0
execute if score @s aw.wind matches 1 anchored eyes positioned ^ ^-0.55 ^0.15 run function angel_wings:dash/ring_1
execute if score @s aw.wind matches 5 anchored eyes positioned ^ ^-0.55 ^0.15 run function angel_wings:dash/ring_5
execute if score @s aw.wind matches 9 anchored eyes positioned ^ ^-0.55 ^0.15 run function angel_wings:dash/ring_9
execute if score @s aw.wind matches 13 anchored eyes positioned ^ ^-0.55 ^0.15 run function angel_wings:dash/ring_13
execute if score @s aw.wind matches 17 anchored eyes positioned ^ ^-0.55 ^0.15 run function angel_wings:dash/ring_17
execute if score @s aw.wind matches 1 run playsound angel_wings:draw player @a[distance=..18] ~ ~ ~ .5 .85
execute if score @s aw.wind matches 11 run playsound angel_wings:draw player @a[distance=..18] ~ ~ ~ .65 1.3
execute if score @s aw.wind matches 20 run function angel_wings:dash/release
