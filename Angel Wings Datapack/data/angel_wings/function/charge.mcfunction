scoreboard players add @s aw.charge 1
execute if score @s aw.charge matches 1 run title @s actionbar {"text": "Charging wings\u2026", "color": "gold", "italic": false}
execute if score @s aw.charge matches 20 run title @s actionbar {"text": "Charging 1 / 3", "color": "gold", "italic": false}
execute if score @s aw.charge matches 40 run title @s actionbar {"text": "Charging 2 / 3", "color": "gold", "italic": false}
execute if score @s aw.charge matches 60 run title @s actionbar {"text": "Wings ready \u00b7 Jump while crouching", "color": "gold", "italic": false}
execute if score @s aw.charge matches 1 run function angel_wings:charge/frame_01
execute if score @s aw.charge matches 4 run function angel_wings:charge/frame_04
execute if score @s aw.charge matches 7 run function angel_wings:charge/frame_07
execute if score @s aw.charge matches 10 run function angel_wings:charge/frame_10
execute if score @s aw.charge matches 13 run function angel_wings:charge/frame_13
execute if score @s aw.charge matches 16 run function angel_wings:charge/frame_16
execute if score @s aw.charge matches 19 run function angel_wings:charge/frame_19
execute if score @s aw.charge matches 22 run function angel_wings:charge/frame_22
execute if score @s aw.charge matches 25 run function angel_wings:charge/frame_25
execute if score @s aw.charge matches 28 run function angel_wings:charge/frame_28
execute if score @s aw.charge matches 31 run function angel_wings:charge/frame_31
execute if score @s aw.charge matches 34 run function angel_wings:charge/frame_34
execute if score @s aw.charge matches 37 run function angel_wings:charge/frame_37
execute if score @s aw.charge matches 40 run function angel_wings:charge/frame_40
execute if score @s aw.charge matches 43 run function angel_wings:charge/frame_43
execute if score @s aw.charge matches 46 run function angel_wings:charge/frame_46
execute if score @s aw.charge matches 49 run function angel_wings:charge/frame_49
execute if score @s aw.charge matches 52 run function angel_wings:charge/frame_52
execute if score @s aw.charge matches 55 run function angel_wings:charge/frame_55
execute if score @s aw.charge matches 58 run function angel_wings:charge/frame_58
execute if score @s aw.charge matches 1 run playsound angel_wings:draw player @a[distance=..18] ~ ~ ~ 0.32 0.68
execute if score @s aw.charge matches 14 run playsound angel_wings:draw player @a[distance=..18] ~ ~ ~ 0.38 0.78
execute if score @s aw.charge matches 26 run playsound angel_wings:draw player @a[distance=..18] ~ ~ ~ 0.42 0.88
execute if score @s aw.charge matches 36 run playsound angel_wings:draw player @a[distance=..18] ~ ~ ~ 0.46 1.0
execute if score @s aw.charge matches 45 run playsound angel_wings:draw player @a[distance=..18] ~ ~ ~ 0.50 1.14
execute if score @s aw.charge matches 53 run playsound angel_wings:draw player @a[distance=..18] ~ ~ ~ 0.53 1.26
execute if score @s aw.charge matches 60 run playsound angel_wings:crest player @a[distance=..18] ~ ~ ~ 0.67 1
