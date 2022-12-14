local tArgs = {...}
local Size = tonumber(tArgs[1])
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

function Forward(steps)
    for i = 1, steps do
        turtle.digUp()
        turtle.digDown()

        while not turtle.forward() do
            turtle.dig()
        end
    end
end

function Right()
    turtle.turnRight()
    Forward(1)
    turtle.turnRight()
end

function Left()
    turtle.turnLeft()
    Forward(1)
    turtle.turnLeft()
end

function PurgeNonEssentials()
    for nonEssentialIndex = 1, #NON_ESSENTIALS, 1 do
        for slotId = 1, SLOT_COUNT, 1 do
            local itemIndex = turtle.getItemDetail(slotId, true)
            if itemIndex ~= nil then
                if itemIndex.name == NON_ESSENTIALS[nonEssentialIndex] then
                    turtle.select(slotId)
                    turtle.drop()
                    turtle.select(1)
                end
            end
        end
    end
end

function CheckFuel(leftToGo)
    while turtle.getFuelLevel() < leftToGo do
        local fuelIndex = ItemIndex("minecraft:coal")
        if fuelIndex == nil then
            print("You have no Fuel")
        else 
            turtle.select(fuelIndex)
            turtle.refuel()
        end
    end
end

function Main()
    
end

Main()