function getOrientation()
    local location1 = vector.new(gps.locate(2, false))
    if not turtle.forward() then
        for j = 1, 6 do
            if not turtle.forward() then
                turtle.dig()
            else 
                break 
            end
        end
    end
    local location2 = vector.new(gps.locate(2, false))
    heading = location2 - location1
    -- -x = 1
    -- -z = 2
    -- +x = 3
    -- +z = 4
    return ((heading.x + math.abs(heading.x) * 2) + (heading.z + math.abs(heading.z) * 3))
end


