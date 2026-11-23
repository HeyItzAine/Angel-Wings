# Keep vanilla flight physics and durability. A pair swapped in mid-flight may still carry Wingbeat.
execute if items entity @s armor.chest *[enchantments~[{enchantments:"#angel_wings:wingbeat"}]] run function angel_wings:apply_beat {slot:"armor.chest",modifiers:'[{"type":"minecraft:set_enchantments","enchantments":{"angel_wings:wingbeat":0}}]'}
execute unless items entity @s armor.chest *[minecraft:glider] run item modify entity @s armor.chest angel_wings:unfold
execute if predicate angel_wings:gliding run return run function angel_wings:poses/glide
function angel_wings:poses/resting
