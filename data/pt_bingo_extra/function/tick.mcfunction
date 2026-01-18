execute as @a run scoreboard players set @s pt.bingo.on_bedrock 0
execute as @a at @s \
    if block ~ ~-0.1 ~ minecraft:bedrock \
    run scoreboard players set @s pt.bingo.on_bedrock 1
