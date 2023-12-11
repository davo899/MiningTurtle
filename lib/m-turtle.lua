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

function M.mine(move)
    local nonAir, _ = turtle.inspect()
    if nonAir then
        turtle.dig()
    end
    if move then
        while not turtle.forward() do
            turtle.dig()
        end
    end
end

function M.mineUp(move)
    local nonAir, _ = turtle.inspectUp()
    if nonAir then
        turtle.digUp()
    end
    if move then
        while not turtle.up() do
            turtle.digUp()
        end
    end
end

function M.mineDown(move)
    local nonAir, _ = turtle.inspectDown()
    if nonAir then
        turtle.digDown()
    end
    if move then
        while not turtle.down() do
            turtle.digDown()
        end
    end
end

return M