require("maps.mapTest")
require("player")
local wf = require('libs.windfield')
local e = {}

function love.load()
    World = wf.newWorld(0,0,true)
    rpgMap:load()
    local block = {}
    if rpgMap.map.layers['block'] then
        for i,obj in ipairs(rpgMap.map.layers['block'].objects) do
            block[i] = World:newRectangleCollider(obj.x,obj.y,obj.width,obj.height,{collision_class = 'Block'})
            block[i]:setType('static')
        end
    end

    local px,py = 100,100
    if rpgMap.map.layers['player'] then
        for i,obj in ipairs(rpgMap.map.layers['player'].objects) do
            px = obj.x
            py = obj.y
        end
    end


    if rpgMap.map.layers['spawn'] then
        for i,obj in ipairs(rpgMap.map.layers['spawn'].objects) do
            for i = 1,10 do
                local x = math.random(obj.x,obj.x+obj.width)
                local y = math.random(obj.y,obj.y+obj.height)
                table.insert(e,{x = x,y = y,colider = World:newRectangleCollider(x,y,10,10,{collision_class = 'Enemy'})})
            end
            break
        end
    end

    Player:load(px,py,World)
end

function love.update(dt)
    Player:update(dt)
    rpgMap:update(dt)
    World:update(dt)
    --Player.colider:setPosition(Player.x,Player.y)
end

function love.draw()
    rpgMap:drawDown()
    World:draw()
    Player:draw()
    rpgMap:drawnUp()
    for i,enemy in ipairs(e) do
        love.graphics.rectangle('fill',enemy.x,enemy.y,10,10)
    end
end
