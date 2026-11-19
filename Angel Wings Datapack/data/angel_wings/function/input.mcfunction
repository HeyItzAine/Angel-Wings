scoreboard players set @s aw.side 0
scoreboard players set @s aw.ahead 0
execute if predicate angel_wings:left run scoreboard players add @s aw.side 1
execute if predicate angel_wings:right run scoreboard players remove @s aw.side 1
execute if predicate angel_wings:forward run scoreboard players add @s aw.ahead 3
execute if predicate angel_wings:backward run scoreboard players remove @s aw.ahead 3
scoreboard players operation @s aw.dir = @s aw.ahead
scoreboard players operation @s aw.dir += @s aw.side
