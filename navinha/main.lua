require('player')
require('enemy')

local count = 0
local timer = 3

local music = love.audio.newSource('assets/audio/Hardmoon_-_Deep_space.mp3','stream')
music:setLooping(true)

function love.load()
    Player:load()
    Enemy1:load()
    love.graphics.setDefaultFilter('nearest','nearest')
    music:play()
end

function love.update(dt)
    Player:update(dt)
    Enemy1:update(dt)
    count = count + dt
    if count > timer then
        Enemy1:new(math.random(0,love.graphics.getWidth()),math.random(0,love.graphics.getHeight()),math.random(100,300))
        count = 0
    end
end

function love.draw()
    Player:draw()
    Enemy1:draw()
end

function love.keyreleased(key)
    if key == 'space' then
        Fire:new()
    end
end