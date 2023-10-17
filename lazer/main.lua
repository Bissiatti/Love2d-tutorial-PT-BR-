require "player"
local wf = require('libs.windfield')

W,H = love.graphics.getDimensions()

Lazer = {
    x = 0,
    speed = 300,
    colider = nil,
    d=1,
}

-- lazer move on x axis in 0 and W/2

Lazer.update = function(dt)
    Lazer.x = Lazer.x + Lazer.speed*dt*Lazer.d
    Lazer.colider:setPosition(Lazer.x,H/2)
    if Lazer.x > W/2 or Lazer.x < 0 then
        Lazer.d = Lazer.d * -1
    end
end

function love.load()
    World = wf.newWorld(0,0,true)
    World:addCollisionClass('Player')
    World:addCollisionClass('Lazer')
    Player:load(W/4,H/2,World)
    Lazer.colider = World:newBSGRectangleCollider(0,0,30,H,10)
    Lazer.colider:setFixedRotation(true)
    Lazer.colider:setPreSolve(function(collider_1, collider_2, contact)
        if collider_1 == Player.colider or collider_2 == Player.colider then
            contact:setEnabled(false)
            Player.color = {1,0,0}
        end
    end)
end

function love.update(dt)
    Player:update(dt)
    World:update(dt)
    Lazer.update(dt)
end

function love.draw()
    World:draw()
    Player:draw()
    Player.color = {1,1,1}
end
