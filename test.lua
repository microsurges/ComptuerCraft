function Test()
    local length = 5;

    turtle.refuel();
    local turtlefuel = turtle.getFuelLevel();
    if turtlefuel >= 0 then
        print("Enough fuel for turtle");
    else
        print("Not enough fuel for turtle");
    end

    while length > 0 do
        turtle.digDown();
        turtle.down();
        turtle.dig();
        turtle.forward();
    end
end

Test();