execute unless data storage angel_wings:world {ready:1b} run return 0
execute if entity @a unless data storage angel_wings:world installed run function angel_wings:first_load
scoreboard players enable @a aw_realism
execute as @a[scores={aw_realism=1..}] run function angel_wings:realism
execute as @a[scores={aw_realism=..-1}] run scoreboard players set @s aw_realism 0
execute as @a[tag=aw.worn] unless items entity @s armor.chest minecraft:elytra[minecraft:custom_data~{angel_wings:1b}] run function angel_wings:unequip
execute as @a[tag=aw.worn,gamemode=spectator] run function angel_wings:unequip
execute as @a[gamemode=!spectator] at @s if items entity @s armor.chest minecraft:elytra[minecraft:custom_data~{angel_wings:1b}] run function angel_wings:wearer
execute at @a run kill @e[type=item_display,tag=aw.visual,distance=..128]
execute as @a if items entity @s inventory.* *[enchantments~[{enchantments:"#angel_wings:wingbeat"}]] run function angel_wings:clean_inventory
execute as @a if items entity @s hotbar.* *[enchantments~[{enchantments:"#angel_wings:wingbeat"}]] run function angel_wings:clean_inventory
execute as @a if items entity @s weapon.offhand *[enchantments~[{enchantments:"#angel_wings:wingbeat"}]] run function angel_wings:clean_inventory
