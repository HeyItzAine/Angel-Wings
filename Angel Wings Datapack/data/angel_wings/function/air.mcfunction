execute unless entity @s[gamemode=creative] unless predicate angel_wings:gliding run scoreboard players add @s aw.wear 1
execute if score @s aw.wear matches 20.. run function angel_wings:wear
execute if items entity @s armor.chest *[damage~{durability:{max:1}}] run return run function angel_wings:break
execute if score @s aw.launch matches 1.. run return run function angel_wings:launch_tick
execute if predicate angel_wings:sneak unless score @s aw.mode matches 3 run return run function angel_wings:descend
execute if score @s aw.mode matches 3 if entity @s[nbt={OnGround:1b}] unless block ~ ~-0.08 ~ #angel_wings:passable run return run function angel_wings:land
execute if score @s aw.mode matches 3 unless predicate angel_wings:sneak run return run function angel_wings:hover/start
execute if score @s aw.mode matches 3 run return 0
execute if score @s aw.mode matches 2 if entity @s[nbt={OnGround:1b}] unless predicate angel_wings:jump unless block ~ ~-0.025 ~ #angel_wings:passable run return run function angel_wings:land
execute if score @s aw.mode matches 2 run return run function angel_wings:hover/tick
execute if entity @s[nbt={OnGround:1b}] unless block ~ ~-0.08 ~ #angel_wings:passable unless predicate angel_wings:gliding run return run function angel_wings:land
function angel_wings:dash/input
function angel_wings:classify_glide
execute if score @s aw.slope matches 1 run return run function angel_wings:down_glide
execute if entity @s[tag=aw.glide] if predicate angel_wings:gliding if score @s aw.dive matches 14.. run function angel_wings:glide_gravity
function angel_wings:poses/cruise
execute unless score @s aw.dir matches 0 run scoreboard players set @s aw.idle 0
execute if score @s aw.dir matches 0 run scoreboard players add @s aw.idle 1
execute unless predicate angel_wings:jump if score @s aw.idle matches 30.. run return run function angel_wings:hover/start
execute if predicate angel_wings:gliding unless entity @s[tag=aw.glide] run function angel_wings:glide_gravity
execute unless predicate angel_wings:gliding if entity @s[tag=aw.glide] run function angel_wings:powered_gravity
function angel_wings:stroke
