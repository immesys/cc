
u = require "cc/lib/util.lua"

function interesting(name)
    if name == "minecraft:stone" then return false end
    if name == "minecraft:dirt" then return false end
    return true
end

function shaft(maxdepth)
    u.push()
    for d=1,maxdepth do
        local s = u.try_down()
        if not s then
            print "aborting dig, can't go down"
            break
        end
        for i=1,4 do
            local s, dat = turtle.inspect()
            if s and interesting(dat.name) then
                turtle.dig()
                --todo add check on corners
            end
            turtle.turnRight()
        end
    end
    u.goto(0,0,0)
    u.pop()
end

shaft(3)