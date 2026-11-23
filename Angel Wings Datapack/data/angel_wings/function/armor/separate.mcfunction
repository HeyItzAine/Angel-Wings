data modify storage angel_wings:station result set from entity @s Item
data modify storage angel_wings:station plate set from storage angel_wings:station result.components."minecraft:custom_data".aw_plate.stack
execute unless data storage angel_wings:station plate.id run return 0
data remove storage angel_wings:station result.components."minecraft:attribute_modifiers"
data modify storage angel_wings:station result.components."minecraft:attribute_modifiers" set from storage angel_wings:station result.components."minecraft:custom_data".aw_plate.attributes
data remove storage angel_wings:station result.components."minecraft:damage_resistant"
data modify storage angel_wings:station result.components."minecraft:damage_resistant" set from storage angel_wings:station result.components."minecraft:custom_data".aw_plate.resistance
data modify storage angel_wings:station result.components."minecraft:equippable".damage_on_hurt set value 0b
data modify storage angel_wings:station action set value "separate"
data modify storage angel_wings:station pending set from storage angel_wings:station plate.components."minecraft:enchantments"
function angel_wings:armor/process_enchantments
execute store result score #keys aw.clock run data get storage angel_wings:station pending
execute if score #keys aw.clock matches 1.. run return run function angel_wings:armor/clear
data modify storage angel_wings:station action set value "combine"
data modify storage angel_wings:station pending set from storage angel_wings:station result.components."minecraft:custom_data".aw_plate.original_enchantments
function angel_wings:armor/process_enchantments
execute store result score #keys aw.clock run data get storage angel_wings:station pending
execute if score #keys aw.clock matches 1.. run return run function angel_wings:armor/clear
data remove storage angel_wings:station result.components."minecraft:custom_data".aw_plate
execute at @s run function angel_wings:armor/return_plate with storage angel_wings:station
execute if entity @e[type=item,tag=aw.return_plate,distance=..1,limit=1] run function angel_wings:armor/finish_split
function angel_wings:armor/clear
