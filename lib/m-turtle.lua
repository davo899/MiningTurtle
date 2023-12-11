M = {}

function M.useAllFuel()
    for i = 1, 16 do
        turtle.select(i)
        turtle.refuel()
    end
end

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

function M.dropAll(discard)

end

return M