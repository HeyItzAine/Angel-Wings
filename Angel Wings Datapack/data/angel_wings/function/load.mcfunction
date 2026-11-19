scoreboard objectives add aw.charge dummy
scoreboard objectives add aw.launch dummy
scoreboard objectives add aw.wear dummy
scoreboard objectives add aw.roll dummy
scoreboard objectives add aw.bob dummy
scoreboard objectives add aw.real dummy
scoreboard objectives add aw.held dummy
scoreboard objectives add aw.move dummy
scoreboard objectives add aw.mode dummy
scoreboard objectives add aw.idle dummy
scoreboard objectives add aw.clock dummy
scoreboard objectives add aw.pulse dummy
scoreboard objectives add aw.anchor dummy
scoreboard objectives add aw.height dummy
scoreboard objectives add aw.speed dummy
scoreboard objectives add aw_realism trigger
scoreboard objectives add aw.lx dummy
scoreboard objectives add aw.ly dummy
scoreboard objectives add aw.lz dummy
scoreboard objectives add aw.mx dummy
scoreboard objectives add aw.my dummy
scoreboard objectives add aw.mz dummy
scoreboard objectives add aw.travel dummy
scoreboard objectives add aw.limit dummy
scoreboard objectives add aw.pose dummy
scoreboard objectives add aw.dir dummy
scoreboard objectives add aw.side dummy
scoreboard objectives add aw.ahead dummy
scoreboard objectives add aw.slope dummy
scoreboard objectives add aw.lastY dummy
scoreboard objectives add aw.nowY dummy
scoreboard objectives add aw.aim dummy
scoreboard objectives add aw.dive dummy
scoreboard objectives add aw.wind dummy
scoreboard objectives add aw.dash dummy
execute store success storage angel_wings:world ready byte 1 run function angel_wings:registry_probe {agility:"angel_wings:agility",wingbeat:"angel_wings:wingbeat"}
execute unless data storage angel_wings:world {ready:1b} run tellraw @a {"text":"Angel Wings needs a world or server restart to register its enchantments.","color":"gold"}
execute if data storage angel_wings:world {ready:1b} run execute if entity @a unless data storage angel_wings:world installed run function angel_wings:first_load
