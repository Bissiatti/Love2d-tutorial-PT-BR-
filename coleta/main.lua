require "player"
require 'coin'
wf = require 'windfield'
-- Load assets and initialize game
function love.load()
    -- Set initial player position
    player.x = love.graphics.getWidth() / 2
    player.y = love.graphics.getHeight() / 2
    world = wf.newWorld(0, 0, true)
    world:addCollisionClass('Player')
    world:addCollisionClass('Coin')
    player.collider = world:newRectangleCollider(player.x, player.y, player.w, player.h)
    player.collider:setCollisionClass('Player')
    Coins:new(10,world,player)
end

-- Update game logic
function love.update(dt)
    world:update(dt)
    player:update(dt)
end

-- Draw game graphics
function love.draw()
    Coins:draw()
    -- Draw player
    love.graphics.rectangle("fill", player.x, player.y, 20, 20, 0,1,1,0,0)
    world:draw()
end