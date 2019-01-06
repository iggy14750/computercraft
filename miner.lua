---------------------------------------
-- ASSUMPTIONS:
-- 1) This is a mining turtle
-- 2) This turtle has sufficient fuel
--    to complete the task
-- 3) The turtle is currently inside of
--    the volume to mine out.
-- dig()s the volume specified by the
-- coordiate parameters.
-- The turtle's position at the start of
-- the function is taken to be (0,0,0).
-- Parameters:
-- 1) x : the dimension of the volume
--    which is left/right relative to
--    turtle. Left is negative.
-- 2) y : dimension up/down relative to turtle.
--    Down is negative.
-- 3) z : forward(+)/back(-)
---------------------------------------
function mineVolume(x, y, z)
    -- start with all positive
    comingback = false

    --for ypos = 1, y do
        for xpos = 1, x-1 do
            print("Entering top loop xpos: "..xpos)
            for zpos = 1, z-1 do
                print("Entering small loop zpos: "..zpos)
                turtle.dig()
                turtle.forward()
            end
            if xpos < x then
                if comingback then
                    print("In coming back path xpos: "..xpos)
                    turtle.turnLeft()
                    turtle.dig()
                    turtle.forward()
                    turtle.turnLeft()
                else
                    print("In not coming back path xpos: "..xpos)
                    turtle.turnRight()
                    turtle.dig()
                    turtle.forward()
                    turtle.turnRight()
                end
                comingback = not comingback
            end
        end
        -- Need to refactor.
    --     if ypos == y then break end
    --     -- reset to back-left corner
    --     if z % 2 == 1 then
    --         turtle.turnLeft()
    --     else
    --         turtle.turnRight()
    --     end
    --     for i=1,z-1 do turtle.forward() end
    --     if z % 2 == 1 then
    --         turtle.turnLeft()
    --         for i=1,x-1 do turtle.forward() end
    --         turtle.turnRight()
    --     end
    --     turtle.turnRight()
    --     turtle.digUp()
    --     turtle.up()
    -- end
end

args = {...}
x = tonumber(args[1])
y = tonumber(args[2])
z = tonumber(args[3])
mineVolume(x, y, z)
