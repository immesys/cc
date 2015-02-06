gw=5
gh=5

u = dofile "cc/lib/util.lua"

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

function refuel_all()
    for i = 1, 16 do -- loop through the slots
        turtle.select(i) -- change to the slot
        turtle.refuel()
    end-- if it's valid fuel
end

function grid(width, height)
    u.push()
    for w=1,width do
        for h=1,height do
            refuel_all()
            if turtle.getFuelLevel() < 1000 then
                print "no fuel, aborting"
                u.goto(0,0,0)
                return
            end
            goto(w*4, h*4, 0)
            shaft(100)
        end
    end
    u.goto(0,0,0)
    u.pop()
end

grid(gw,gh)
