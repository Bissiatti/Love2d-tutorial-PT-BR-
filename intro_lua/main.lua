-- function love.load()


-- end

-- function love.update(dt)
--     -- rectangle.x = rectangle.x + rectangle.speed * dt
--     if love.keyboard.isDown('d') then
--         rectangle.x = rectangle.x + rectangle.speed * dt
--     end
-- end

RectangleClass = {}

function RectangleClass:new(x,y,width,height,speed)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.x = x
    o.y = y
    o.width = width
    o.height = height
    o.speed = speed
    return o
end

function RectangleClass:move(dt)
    self.x = self.x + self.speed*dt
end

rectangle = RectangleClass:new(100, 100, 200, 100, 100)

rectangle2 = RectangleClass:new(500, 100, 200, 100, 100)


local x = 10

lista = {10, 20, 30, 40, 50}

function f(x)
    local y = 1
    return x + y
end

function fatorial(n)
    local result = 1
    local i = 1
    while i <= n do
        result = result * i
        i = i + 1
    end
end

function printLoveList(list)
    for i,e in ipairs(list) do
        love.graphics.print("Indice ".. i .. ", Valor " .. e, 100, 100 + i * 20)
    end    
end

function love.update(dt)
    rectangle:move(dt)
end

function love.draw()
    love.graphics.rectangle('fill', rectangle.x, rectangle.y, rectangle.width, rectangle.height)
    love.graphics.rectangle('fill', rectangle2.x, rectangle2.y, rectangle2.width, rectangle2.height)
end