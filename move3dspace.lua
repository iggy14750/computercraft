
--[[
Hopefully reusable code which will cause a turtle to 
completely explore a 3-dimensional space.
TODO: Accept a function as an argument,
specifying what the turtle perform at each block position.

The 3D space will be described with (X,Y,Z) coordinates.
NOTE, X and Z dimensions do NOT necessarily correspond to the
Minecraft world's X and Z dimensions.
Y does still correspond with that of the Minecraft world.
The X and Z dimensions are defined by the orientation of the turtle
when the application is first started.

* X is forward (+) and back (-).
* Y is up (+) and down (-).
* z is left (+) and right (-).

TODO: Implement negative bounds.

--]]

function moveX(X, perblock)
    for x=1,X do
        if perblock then
            perblock(false)
        end
        if x == X then
            break
        end
        turtle.forward()
    end
    -- After the positive movement,
    -- we move back.
    for x=1,X-1 do
        turtle.back()
    end
end

function moveXZ(X, Z, perblock)
    for z=1,Z do
        moveX(X, perblock)
        if z == Z then
            break
        end
        turtle.turnLeft()
        if perblock then
            perblock(false)
        end
        turtle.forward()
        turtle.turnRight()
    end
    -- Then return back to init pos
    turtle.turnRight()
    for z=1,Z-1 do
        turtle.forward()
    end
    turtle.turnLeft()
end

function moveXYZ(X, Y, Z, perblock)
    for y=1,Y do
        moveXZ(X, Z, perblock)
        if y == Y then
            break
        end
        if perblock then
            -- Hmm, most of time, I want
            -- perblock to break the block in front
            -- of the turtle, but this time,
            -- I want it to break the block above
            -- (or below)
            perblock(true)
        end
        turtle.up()
    end
    -- Then return back to (0,0,0)
    for y=1,Y-1 do
        turtle.down()
    end
end

function move(X, Y, Z, perblock)
    if not X then
        print("ERROR: Invalid X value: "..X)
        return
    end
    if not Y then
        print("ERROR: Invalid Y value: "..Y)
        return
    end
    if not Z then
        print("ERROR: Invalid Z value: "..Z)
        return
    end
    X = tonumber(X)
    Y = tonumber(Y)
    Z = tonumber(Z)
    -- TODO: These bounds will change.
    if X<0 or Y<0 or Z<0 then
        print("X, Y, and Z must be non-negative")
        return
    end
    moveXYZ(X, Y, Z, perblock)
end



