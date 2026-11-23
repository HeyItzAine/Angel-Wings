$data modify storage angel_wings:station character set string storage angel_wings:station text $(end) $(next)
execute if data storage angel_wings:station {character:'"'} run return run function angel_wings:armor/key_found with storage angel_wings:station
execute store result score #length aw.clock run data get storage angel_wings:station text
execute if score #end aw.clock < #length aw.clock run function angel_wings:armor/scan_char
