execute if data entity @s Item.components."minecraft:custom_data".aw_plate if block ~ ~ ~ minecraft:grindstone run return run function angel_wings:armor/separate
execute if data entity @s Item.components."minecraft:custom_data".aw_plate run return 0
execute unless block ~ ~ ~ #minecraft:anvil run return 0
execute unless entity @e[type=item,distance=..1.2,nbt={OnGround:1b},predicate=angel_wings:station_plate] run return 0
tag @s add aw.station_wing
execute align xyz summon minecraft:marker run function angel_wings:armor/find_plate
tag @s remove aw.station_wing
