scoreboard players set @s aw.travel 0
execute store result score @s aw.mx run data get entity @s Pos[0] 64
scoreboard players operation #current aw.travel = @s aw.mx
scoreboard players operation @s aw.mx -= @s aw.lx
scoreboard players operation @s aw.lx = #current aw.travel
execute unless score @s aw.mx matches -1000..1000 run scoreboard players set @s aw.mx 1000
scoreboard players operation @s aw.mx *= @s aw.mx
scoreboard players operation @s aw.travel += @s aw.mx
execute store result score @s aw.my run data get entity @s Pos[1] 64
scoreboard players operation #current aw.travel = @s aw.my
scoreboard players operation @s aw.my -= @s aw.ly
scoreboard players operation @s aw.ly = #current aw.travel
execute unless score @s aw.my matches -1000..1000 run scoreboard players set @s aw.my 1000
scoreboard players operation @s aw.my *= @s aw.my
scoreboard players operation @s aw.travel += @s aw.my
execute store result score @s aw.mz run data get entity @s Pos[2] 64
scoreboard players operation #current aw.travel = @s aw.mz
scoreboard players operation @s aw.mz -= @s aw.lz
scoreboard players operation @s aw.lz = #current aw.travel
execute unless score @s aw.mz matches -1000..1000 run scoreboard players set @s aw.mz 1000
scoreboard players operation @s aw.mz *= @s aw.mz
scoreboard players operation @s aw.travel += @s aw.mz
execute unless score @s aw.dir matches 0 unless score @s aw.slope matches 1 if score @s aw.travel < @s aw.limit run scoreboard players set @s aw.pulse 1
