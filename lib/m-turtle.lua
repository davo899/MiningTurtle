M = {}

--- Attempts to use all items in inventory as fuel
function M.useAllFuel()
    for i = 1, 16 do
        turtle.select(i)
        turtle.refuel()
    end
end

--- Places a torch below the turtle if there is space and the turtle has a torch
function M.placeTorchBelow()
    for i = 1, 16 do
        local item = turtle.getItemDetail(i)
        if item and item.name == "minecraft:torch" then
            turtle.select(i)
            turtle.placeDown()
        end
    end
end

local function inspect(direction)
    if     direction == "up"   then return turtle.inspectUp()
    elseif direction == "down" then return turtle.inspectDown()
    else                            return turtle.inspect()
    end
end

local function dig(direction)
    if     direction == "up"   then return turtle.digUp()
    elseif direction == "down" then return turtle.digDown()
    else                            return turtle.dig()
    end
end

local function move(direction)
    if     direction == "up"   then return turtle.up()
    elseif direction == "down" then return turtle.down()
    elseif direction == "back" then return turtle.back()
    else                            return turtle.forward()
    end
end

--- Digs in the given direction, and optionally moves in that direction
function M.mine(direction, shouldMove)
    local nonAir, _ = inspect(direction)
    if nonAir then
        dig(direction)
    end
    if shouldMove then
        while not move(direction) do
            dig(direction)
        end
    end
end

--- Returns whether the given element is in the given table
local function contains(table_, element)
    for i = 1, #table_ do
        if table_[i] == element then
            return true
        end
    end
    return false
end

--- Drop all items in inventory that are in the discard table
function M.dropAll(discard)
    for i = 1, 16 do
        local item = turtle.getItemDetail(i)
        if item and contains(discard, item.name) then
            turtle.select(i)
            turtle.drop()
        end
    end
end

return M