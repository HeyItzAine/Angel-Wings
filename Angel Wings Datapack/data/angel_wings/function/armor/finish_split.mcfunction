execute store success score #written aw.clock run data modify entity @s Item set from storage angel_wings:station result
execute unless score #written aw.clock matches 1 run return run kill @e[type=item,tag=aw.return_plate,distance=..1,limit=1]
tag @e[type=item,tag=aw.return_plate,distance=..1,limit=1] remove aw.return_plate
playsound minecraft:block.grindstone.use block @a[distance=..16] ~ ~ ~ 0.8 1
