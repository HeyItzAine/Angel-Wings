execute if items entity @s armor.chest minecraft:elytra[minecraft:custom_data~{angel_wings:1b},minecraft:equippable={"slot":"chest","equip_sound":{"sound_id":"angel_wings:rustle"},"damage_on_hurt":false,"asset_id":"angel_wings:seraph"}] at @s run playsound angel_wings:folding player @a[distance=..16] ~ ~ ~ 0.65 1
item modify entity @s armor.chest angel_wings:rest
