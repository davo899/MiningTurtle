local mTurtle = require("lib/m-turtle")

local WIDTH = 16
local LENGTH = 200

local DISCARD = {
    "minecraft:dirt",
    "minecraft:stone",
    "minecraft:gravel"
}

--- Initially placed on the lower level facing the bottom-left most block
mTurtle.mine("up", true)
for i = 1, LENGTH do
    --- Mine into first x,z of next row
    mTurtle.mine("forward", true)
    mTurtle.mine("down", false)

    --- Turn to face row
    if i % 2 == 1 then
        turtle.turnRight()
    else
        turtle.turnLeft()
    end

    --- Mine row
    for j = 1, WIDTH - 1 do
        mTurtle.mine("forward", true)
        mTurtle.mine("down", false)

        --- Place a torch every 4th row and column
        if i % 4 == 0 and j % 4 == 0 then
            mTurtle.placeTorchBelow()
        end
    end

    --- Turn to face next row
    if i % 2 == 1 then
        turtle.turnRight()
    else
        turtle.turnLeft()
    end

    --- Discard waste items
    mTurtle.dropAll(DISCARD)

    --- Refuel if needed
    if turtle.getFuelLevel() < 1000 then
        mTurtle.useAllFuel()
    end
end
