tag @s add aw.fly
attribute @s minecraft:fall_damage_multiplier modifier add angel_wings:flight -1 add_multiplied_total
scoreboard players set @s aw.idle 0
scoreboard players set @s aw.clock 0
scoreboard players set @s aw.speed 1
execute if items entity @s armor.chest *[enchantments~[{enchantments:"#angel_wings:agility",levels:1}]] run scoreboard players set @s aw.speed 2
execute if items entity @s armor.chest *[enchantments~[{enchantments:"#angel_wings:agility",levels:2}]] run scoreboard players set @s aw.speed 3
execute if items entity @s armor.chest *[enchantments~[{enchantments:"#angel_wings:agility",levels:3}]] run scoreboard players set @s aw.speed 4
execute if score @s aw.speed matches 1 run function angel_wings:apply_beat {slot:"armor.chest",modifiers:'[{"type":"minecraft:set_enchantments","enchantments":{"angel_wings:wingbeat":1}}]'}
execute if score @s aw.speed matches 2 run function angel_wings:apply_beat {slot:"armor.chest",modifiers:'[{"type":"minecraft:set_enchantments","enchantments":{"angel_wings:wingbeat":2}}]'}
execute if score @s aw.speed matches 3 run function angel_wings:apply_beat {slot:"armor.chest",modifiers:'[{"type":"minecraft:set_enchantments","enchantments":{"angel_wings:wingbeat":3}}]'}
execute if score @s aw.speed matches 4 run function angel_wings:apply_beat {slot:"armor.chest",modifiers:'[{"type":"minecraft:set_enchantments","enchantments":{"angel_wings:wingbeat":4}}]'}
execute if score @s aw.speed matches 1 run scoreboard players set @s aw.limit 15099
execute if score @s aw.speed matches 2 run scoreboard players set @s aw.limit 24186
execute if score @s aw.speed matches 3 run scoreboard players set @s aw.limit 35404
execute if score @s aw.speed matches 4 run scoreboard players set @s aw.limit 49604
