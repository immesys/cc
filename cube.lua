
u = dofile "cc/lib/util.lua"

function sqr(x)
    u.push()
    u.goto(x,0,0)
    u.goto(x,x,0)
    u.goto(0,x,0)
    u.goto(0,0,0)
    u.pop()
end

sqr(5)
