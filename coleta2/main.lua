require "player"
require 'coin'
sti = require 'sti'
wf = require 'windfield'

Map = sti("maps/mapInit.lua")
function drawDown()
    Map:drawLayer(Map.layers['Camada de Blocos 1'])
    Map:drawLayer(Map.layers['Camada de Blocos 3'])
end


function drawUp()
    Map:drawLayer(Map.layers['Camada de Blocos 2'])
end

Walls = {}

-- Load assets and initialize game
function love.load()
    -- Set initial player position

    if Map.layers['player'] then
        for i, obj in pairs(Map.layers['player'].objects) do
            player.x = obj.x
            player.y = obj.y
        end
    end

    world = wf.newWorld(0, 0, true)
    world:addCollisionClass('Player')
    world:addCollisionClass('Coin')
    world:addCollisionClass('Wall')
    world:addCollisionClass('End')
    player.collider = world:newRectangleCollider(player.x, player.y, player.w, player.h)
    player.collider:setCollisionClass('Player')
    Coins:new(10,world,player)

    if Map.layers['wall'] then
        for i, obj in pairs(Map.layers['wall'].objects) do
            local wall = world:newRectangleCollider(obj.x, obj.y, obj.width, obj.height)
            wall:setType('static')
            wall:setCollisionClass('Wall')
            table.insert(Walls, wall)
        end
    end

    if Map.layers['end'] then
        for i, obj in pairs(Map.layers['end'].objects) do
            local endCollider = world:newRectangleCollider(obj.x, obj.y, obj.width, obj.height)
            endCollider:setType('static')
            endCollider:setCollisionClass('End')
            endCollider:setPreSolve(function(collider_1, collider_2, contact)
                if collider_2.collision_class  == 'Player' then
                    love.event.quit()
                end
              end)
        end
    
    end
end

-- Update game logic
function love.update(dt)
    world:update(dt)
    Map:update(dt)
    player:update(dt)
    Coins:update(dt)
end

-- Draw game graphics
function love.draw()
    drawDown()
    Coins:draw()
    -- Draw player
    love.graphics.rectangle("fill", player.x, player.y, 20, 20, 0,1,1,0,0)
    world:draw()
    drawUp()
end