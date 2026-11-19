scoreboard players set @s aw.wear 0
scoreboard players set @s aw.roll 1
execute if items entity @s armor.chest *[enchantments~[{enchantments:"minecraft:unbreaking",levels:1}]] store result score @s aw.roll run random value 1..2
execute if items entity @s armor.chest *[enchantments~[{enchantments:"minecraft:unbreaking",levels:2}]] store result score @s aw.roll run random value 1..3
execute if items entity @s armor.chest *[enchantments~[{enchantments:"minecraft:unbreaking",levels:3}]] store result score @s aw.roll run random value 1..4
execute if score @s aw.roll matches 1 run item modify entity @s armor.chest angel_wings:wear
