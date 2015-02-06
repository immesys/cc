
local mod = {}

mod.x = 0
mod.y = 0
mod.z = 0
mod.stack = {}
mod.goto = function(x, y, z)
    --do z first
    if z > mod.z then
        for i=mod.z+1, z do
            while not turtle.up() do
                turtle.digUp()
            end
            mod.z = i
        end
    elseif z < mod.z then
        for i=mod.z-1, z, -1 do
            while not turtle.down() do
                turtle.digDown()
            end
            mod.z = i
        end
    end

    --then do x
    if x > mod.x then
        turtle.turnRight()
        for i=mod.x + 1, x do
            while not turtle.forward() do
                turtle.dig()
            end
            mod.x = i
        end
        turtle.turnLeft()
    elseif x < mod.x then
        turtle.turnLeft()
        for i=mod.x -1, x, -1 do
            while not turtle.forward() do
                turtle.dig()
            end
            mod.x = i
        end
        turtle.turnRight()
    end

    --then do y
    if y > mod.y then
        for i=mod.y + 1, y do
            while not turtle.forward() do
                turtle.dig()
            end
            mod.y = i
        end
    elseif y < mod.y then
        turtle.turnLeft()
        turtle.turnLeft()
        for i=mod.y -1, y, -1 do
            while not turtle.forward() do
                turtle.dig()
            end
            mod.y = i
        end
        turtle.turnRight()
        turtle.turnRight()
    end
end

mod.try_down = function()
    local s = turtle.down()
    if not s then
        s = turtle.digDown()
        if not s then
            return false
        end
        s = turtle.down()
        if s then
            mod.z = mod.z - 1
            return true
        else
            return false
        end
    end
    mod.z = mod.z - 1
    return true
end

mod.push = function()
    table.insert(mod.stack, {mod.x, mod.y, mod.z} )
    mod.x = 0
    mod.y = 0
    mod.z = 0
end

mod.pop = function()
   mod.x, mod.y, mod.z = unpack(table.remove(mod.stack))
end

return mod