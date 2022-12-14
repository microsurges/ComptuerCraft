function getOrientation()
    location1 = vector.new(gps.locate(2, false))
    while not turtle.forward() do
        turtle.dig()
    end
    location2 = vector.new(gps.locate(2, false))
    heading = location2 - location1
    headingX = location2.x - location1.x
    headingZ = location2.z - location1.z
    -- -x = 1
    -- -z = 2
    -- +x = 3
    -- +z = 4
    return ((headingX + math.abs(headingX) * 2) + (headingZ + math.abs(headingZ) * 3))
end

print(getOrientation())
gps.locate()