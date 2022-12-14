function getOrientation()
    location1 = vector.new(gps.locate(2, false))
    while not turtle.forward() do
        turtle.dig()
    end
    location2 = vector.new(gps.locate(2, false))
    heading = location2 - location1
    t = ((heading.x + math.abs(heading.x) * 2) + (heading.z + math.abs(heading.z) * 3))
    direction = {
        [1] = "W",
        [2] = "N",
        [3] = "E",
        [4] = "S"
    }

    return direction[t]
    -- -x = 1
    -- -z = 2
    -- +x = 3
    -- +z = 4
end

print(getOrientation())
gps.locate()