tag @s add aw.station_origin
execute as @e[type=item,distance=..2,nbt={OnGround:1b},sort=nearest,predicate=angel_wings:station_plate] at @s positioned ~ ~-0.05 ~ align xyz if entity @e[type=marker,tag=aw.station_origin,distance=..0.01] unless entity @e[type=item,tag=aw.station_plate,distance=..2] run tag @s add aw.station_plate
execute as @e[type=item,tag=aw.station_wing,distance=..2,limit=1] at @s if entity @e[type=item,tag=aw.station_plate,distance=..1.5] run function angel_wings:armor/combine
tag @e[type=item,tag=aw.station_plate,distance=..2] remove aw.station_plate
kill @s
