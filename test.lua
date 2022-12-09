SLOT_COUNT = 16;
NonEssentials = {
    "minecraft:granite",
    "minecraft:diorite",
    "minecraft:andesite",
    "minecraft:grass_block",
    "minecraft:dirt",
    "minecraft:cobblestone",
    "minecraft:sand",
    "minecraft:gravel",
    "minecraft:sandstone",
    "minecraft:mossy_cobblestone",
    "minecraft:stone_bricks",
    "minecraft:mossy_stone_bricks",
    "minecraft:cracked_stone_bricks",
    };


-- Example ItemIndex("minecraft:hardened_clay")
function ItemIndex(ItemString)
    for i = 1, SLOT_COUNT, 1 do
        local information = turtle.getItemDetail(i, true);
        if information ~= nil then
            if information.name == ItemString then
                return i;
            end
        end
    end
end

function PurgeNonEssentials()
    for i = 1, #NonEssentials, 1 do
        for j = 1, SLOT_COUNT, 1 do
            local itemIndex = turtle.getItemDetail(j, true);
            if itemIndex ~= nil then
                if itemIndex.name == NonEssentials[i] then
                    turtle.select(j);
                    turtle.drop();
                end
            end
        end
    end
end

function Test()
    local length = 5;
    PurgeNonEssentials();

    -- turtle.refuel();
    -- local turtlefuel = turtle.getFuelLevel();
    -- if turtlefuel >= 0 then
    --     print("Enough fuel for turtle");
    -- else
    --     print("Not enough fuel for turtle");
    -- end

    -- while length > 0 do
    --     turtle.digDown();
    --     turtle.down();
    --     turtle.dig();
    --     turtle.forward();
    --     length = length - 1;
    -- end
end

Test();

-- TODO: 
-- have the turtle check for availible fuel going through all slots
-- have the turtle then loop through and dig down to y = 11
-- have the turtle start strip mining in all x directions 
-- checking if the block is not stone, dirt, gravel, coble stone, andiasite, diarite, granite and mine it if it is some type of ore and follow the vein
-- on each loop check the fuel level and see if it needs to be refueled if it needs refueled then loop through all the slots and refuel
-- check to make sure that the turtle can make it back to the area where it was started
-- check where the turtle was started and move to that area when it is running low on fuel
