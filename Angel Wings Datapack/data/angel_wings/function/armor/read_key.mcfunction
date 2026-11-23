# Serialized enchantment IDs are quoted resource locations. Read the first key.
$data modify storage angel_wings:station text set value '$(pending)'
scoreboard players set #end aw.clock 2
function angel_wings:armor/scan_char
