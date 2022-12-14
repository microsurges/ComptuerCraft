function getOrientation()
    location1 = vector.new(gps.locate(2, false))
    while not turtle.forward() do
        turtle.dig()
    end
    location2 = vector.new(gps.locate(2, false))
    heading = location2 - location1
    t= ((heading.x + math.abs(heading.x) * 2) + (heading.z + math.abs(heading.z) * 3))
    direction = {}
    if t % 2 == 0 then
        if t > 2 then
            direction.z = true
        else
            direction.z = false
        end
    else
        if t > 1 then
            direction.x = true
        else
            direction.x = false
        end
    end
    return direction
    -- -x = 1
    -- -z = 2
    -- +x = 3
    -- +z = 4
end

print(getOrientation())
gps.locate()