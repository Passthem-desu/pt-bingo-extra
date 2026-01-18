# 基岩判定逻辑
execute as @a run scoreboard players set @s pt.bingo.on_bedrock 0
execute as @a at @s \
    if block ~ ~-0.1 ~ minecraft:bedrock \
    run scoreboard players set @s pt.bingo.on_bedrock 1

# 草羊判定逻辑
execute as @a \
    if items entity @s weapon.mainhand lightning_rod \
    if score @s pt.bingo.killed.sheep > @s pt.bingo.last.killed.sheep \
    run scoreboard players add @s pt.bingo.rod_kill_sheep 1
execute as @a run scoreboard players operation @s pt.bingo.last.killed.sheep = @s pt.bingo.killed.sheep

# 无沙砾判定逻辑
execute as @a \
    unless score @s pt.bingo.unlucky_gravel.status matches -2147483648..2147483647 \
    run scoreboard players set @s pt.bingo.unlucky_gravel.status 1
execute as @a \
    if score @s pt.bingo.unlucky_gravel.status matches 0.. \
    if items entity @s container.* minecraft:flint \
    run scoreboard players set @s pt.bingo.unlucky_gravel.status -1
execute as @a \
    if score @s pt.bingo.unlucky_gravel.status matches 0.. \
    if items entity @s weapon.* minecraft:flint \
    run scoreboard players set @s pt.bingo.unlucky_gravel.status -1
execute as @a \
    if score @s pt.bingo.unlucky_gravel.status matches 0.. \
    run scoreboard players operation @s pt.bingo.unlucky_gravel.status = @s pt.bingo.break.gravel
execute as @a \
    if score @s pt.bingo.unlucky_gravel.status matches 0.. \
    run scoreboard players add @s pt.bingo.unlucky_gravel.status 1
