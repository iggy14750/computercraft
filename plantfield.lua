
-- farm <NumColumns> <NumRows>
--
-- Model: the "farm" is a 2-dimensional area of the map,
-- said area being equal to the product of the provided NumColumns & NumRows arguments.
-- Each block within this area shall be planted with the crop.
-- the ground level of all such blocks are at the same Y value.
-- Said area is organized into "columns" and "rows".
-- This turtle is initially placed just outside the one of the
-- corners of the farm area, facing in the direction of the farm.
-- The turtle is initially placed looking down the length of
-- one of the columns of the farm, looking across all rows.
-- From this initial position, the turtle will move right, but never left.
-- Therefore, turtle initial position is the left-most row.
--
--
-- This model is visualized below:
--
-- <- Columns ->
--   +=======+ ^
--   |       | |
--   |       | Rows
--   |       | |
--   +=======+ v
--   ^
-- Turtle Initial Position
--
-- The turtle shall first be placed on the ground level of the farm,
-- for ease of use. The turtle shall then move up and forward.
-- Each block of the farm shall be dealt from above.
--
-- NOTE: Script assumes that sufficient fuel is available in turtle.


-- At each block of the farm, the following steps are performed.
-- * break the potential crop in the forward direction of the turtle
-- * harvest said crop into the turtle's inventory
-- * till the ground on which said crop previously existed.
-- * plant crop seeds in this tilled soil (seeds in inventory slot 1).
--
-- Following this, the turtle moves to the next valid block of the farm.
function farmBlockBelowTurtle()
    turtle.digDown() -- break crop
    turtle.suckDown() -- pick up the crops and place into inventory
    turtle.digDown() -- till the soil of said block
    turtle.select(1)
    turtle.placeDown() -- plant seeds into tilled soil
end


-- Command-line parameters
NumColumns = arg[1]
NumRows = arg[2]

-- Move to initial position
turtle.up()
turtle.forward()

-- I shall begin by moving in only 1 dimension
for row=1,NumRows do
    farmBlockBelowTurtle()
    turtle.forward()
end

-- Then let's turn around to start again
turtle.turnLeft()
turtle.turnLeft()
turtle.down()

