
os.loadAPI("move3dspace.lua")

function dig(digUp)
    -- TODO: I guess we only want to suck
    -- if it's a useful ore.
    if digUp then
        turtle.digUp()
        turtle.suckUp()
    else
        turtle.dig()
        turtle.suck()
    end
end

move3dspace.move(arg[1], arg[2], arg[3], dig)

