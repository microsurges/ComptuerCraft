X = tonumber(arg[1]);
SLOT_COUNT = 16;
NON_ESSENTIALS = {
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
    for i = 1, #NON_ESSENTIALS, 1 do
        for j = 1, SLOT_COUNT, 1 do
            local itemIndex = turtle.getItemDetail(j, true);
            if itemIndex ~= nil then
                if itemIndex.name == NON_ESSENTIALS[i] then
                    turtle.select(j);
                    turtle.drop();
                    turtle.select(1);
                end
            end
        end
    end
end

function CheckFuel()
    while turtle.getFuelLevel() < X * X do
        local fuelIndex = ItemIndex("minecraft:coal");
        if fuelIndex == nil then
            print("You have no Fuel");
        else 
            turtle.select(fuelIndex);
            turtle.refuel();
        end
    end
end

function StripMine()
    turtle.dig();
    turtle.forward();
    turtle.digDown();
    turtle.digUp();
end

function BoxMine()
    for i = 1, X / 2, 1 do
        for j = 1, X, 1 do
            StripMine();
        end
        turtle.turnLeft();
        StripMine();
        turtle.turnLeft();
        for j = 1, X, 1 do
            StripMine();
        end
        turtle.turnRight();
        StripMine();
        turtle.turnRight();
        PurgeNonEssentials();  
    end
end


function Main()
    CheckFuel();
    BoxMine();
end

Main();