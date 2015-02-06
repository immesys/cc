

A = dofile "cc/lib/abspos.lua"
function sqr(x)
    A.push()
    A.goto(x,0,0)
    A.goto(x,x,0)
    A.goto(0,x,0)
    A.goto(0,0,0)
    A.pop()
end

sqr(5)
