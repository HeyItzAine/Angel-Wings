function angel_wings:start
function angel_wings:hover/start
scoreboard players set @s aw.launch 30
scoreboard players set @s aw.charge 0
playsound angel_wings:release player @a[distance=..28] ~ ~ ~ 0.85 1
particle minecraft:cloud ~0.520 ~0.13 ~0.000 1.000 0.15 0.000 0.18 0 normal @a[distance=..36]
particle minecraft:cloud ~0.489 ~0.13 ~0.178 0.940 0.15 0.342 0.18 0 normal @a[distance=..36]
particle minecraft:cloud ~0.398 ~0.13 ~0.334 0.766 0.15 0.643 0.18 0 normal @a[distance=..36]
particle minecraft:cloud ~0.260 ~0.13 ~0.450 0.500 0.15 0.866 0.18 0 normal @a[distance=..36]
particle minecraft:cloud ~0.090 ~0.13 ~0.512 0.174 0.15 0.985 0.18 0 normal @a[distance=..36]
particle minecraft:cloud ~-0.090 ~0.13 ~0.512 -0.174 0.15 0.985 0.18 0 normal @a[distance=..36]
particle minecraft:cloud ~-0.260 ~0.13 ~0.450 -0.500 0.15 0.866 0.18 0 normal @a[distance=..36]
particle minecraft:cloud ~-0.398 ~0.13 ~0.334 -0.766 0.15 0.643 0.18 0 normal @a[distance=..36]
particle minecraft:cloud ~-0.489 ~0.13 ~0.178 -0.940 0.15 0.342 0.18 0 normal @a[distance=..36]
particle minecraft:cloud ~-0.520 ~0.13 ~0.000 -1.000 0.15 0.000 0.18 0 normal @a[distance=..36]
particle minecraft:cloud ~-0.489 ~0.13 ~-0.178 -0.940 0.15 -0.342 0.18 0 normal @a[distance=..36]
particle minecraft:cloud ~-0.398 ~0.13 ~-0.334 -0.766 0.15 -0.643 0.18 0 normal @a[distance=..36]
particle minecraft:cloud ~-0.260 ~0.13 ~-0.450 -0.500 0.15 -0.866 0.18 0 normal @a[distance=..36]
particle minecraft:cloud ~-0.090 ~0.13 ~-0.512 -0.174 0.15 -0.985 0.18 0 normal @a[distance=..36]
particle minecraft:cloud ~0.090 ~0.13 ~-0.512 0.174 0.15 -0.985 0.18 0 normal @a[distance=..36]
particle minecraft:cloud ~0.260 ~0.13 ~-0.450 0.500 0.15 -0.866 0.18 0 normal @a[distance=..36]
particle minecraft:cloud ~0.398 ~0.13 ~-0.334 0.766 0.15 -0.643 0.18 0 normal @a[distance=..36]
particle minecraft:cloud ~0.489 ~0.13 ~-0.178 0.940 0.15 -0.342 0.18 0 normal @a[distance=..36]
