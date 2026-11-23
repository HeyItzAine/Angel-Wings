data modify storage angel_wings:station result set from entity @s Item
data modify storage angel_wings:station plate set from entity @e[type=item,tag=aw.station_plate,distance=..1.5,limit=1] Item
execute unless data storage angel_wings:station plate{count:1} run return run function angel_wings:armor/clear
execute unless data storage angel_wings:station result{count:1} run return run function angel_wings:armor/clear
data modify storage angel_wings:station result.components."minecraft:custom_data".aw_plate.stack set from storage angel_wings:station plate
data modify storage angel_wings:station result.components."minecraft:custom_data".aw_plate.original_enchantments set from storage angel_wings:station result.components."minecraft:enchantments"
data modify storage angel_wings:station result.components."minecraft:custom_data".aw_plate.attributes set from storage angel_wings:station result.components."minecraft:attribute_modifiers"
data modify storage angel_wings:station result.components."minecraft:custom_data".aw_plate.resistance set from storage angel_wings:station result.components."minecraft:damage_resistant"
function angel_wings:armor/default_attributes
data modify storage angel_wings:station result.components."minecraft:attribute_modifiers" set from storage angel_wings:station plate.components."minecraft:attribute_modifiers"
data modify storage angel_wings:station result.components."minecraft:equippable".damage_on_hurt set value 1b
execute if data storage angel_wings:station plate{id:"minecraft:netherite_chestplate"} run data modify storage angel_wings:station result.components."minecraft:damage_resistant" set value {types:"#minecraft:is_fire"}
data modify storage angel_wings:station result.components."minecraft:damage_resistant" set from storage angel_wings:station plate.components."minecraft:damage_resistant"
data modify storage angel_wings:station action set value "combine"
data modify storage angel_wings:station pending set from storage angel_wings:station plate.components."minecraft:enchantments"
function angel_wings:armor/process_enchantments
execute store result score #keys aw.clock run data get storage angel_wings:station pending
execute if score #keys aw.clock matches 1.. run return run function angel_wings:armor/clear
execute store success score #written aw.clock run data modify entity @s Item set from storage angel_wings:station result
execute if score #written aw.clock matches 1 if data entity @s Item.components."minecraft:custom_data".aw_plate.stack run kill @e[type=item,tag=aw.station_plate,distance=..1.5,limit=1]
execute if score #written aw.clock matches 1 run playsound minecraft:block.anvil.use block @a[distance=..16] ~ ~ ~ 0.55 1.15
function angel_wings:armor/clear
