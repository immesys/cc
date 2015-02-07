function vslice(z,w,h)
  for i=1,z do
    slice(w,h)
    turtle.up()
  end
  for i=1,z do
    turtle.down()
  end
end

function slice(w, h)
  for col=1,w do
    for row=1,h do
      while not turtle.forward() do
        turtle.dig()
      end
    end
    if col%2 == 1 then
      turtle.turnRight()
    else
      turtle.turnLeft()
    end
    while not turtle.forward() do
      turtle.dig()
    end
    if col %2 == 1 then
      turtle.turnRight()
    else
      turtle.turnLeft()
    end
  end
  turtle.turnLeft()
  for i=1,pw do
    while not turtle.forward()
    do turtle.dig() end
  end
  turtle.turnRight()
end --fun
vslice(pz,pw,ph)
