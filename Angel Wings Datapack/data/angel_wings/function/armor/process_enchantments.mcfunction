execute unless data storage angel_wings:station pending run return 0
execute store result score #keys aw.clock run data get storage angel_wings:station pending
execute if score #keys aw.clock matches 1.. run function angel_wings:armor/read_key with storage angel_wings:station
