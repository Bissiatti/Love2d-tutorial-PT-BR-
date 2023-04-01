Enemy1 = {}
local img;
local W,H = love.graphics.getDimensions()

local boom = love.audio.newSource('assets/audio/hjm-big_explosion_3.wav','static')
require('player')

function Enemy1:load()
    img = love.graphics.newImage('assets/img/navefantasma.png')
    Enemy1:new(100,100,200)
end

function Enemy1:new(x,y,speed)
    local enemy = {}
    enemy.x = x
    enemy.y = y
    enemy.speed = speed
    enemy.width = 32
    enemy.height = 32
    enemy.xSpeed = 1
    enemy.ySpeed = 1
    table.insert(Enemy1,enemy)
end

function euclidianDistance(x1,x2,y1,y2)
    return math.sqrt((x2-x1)^2 + (y2-y1)^2)
end

function Enemy1:update(dt)
    for i,v in ipairs(Enemy1) do
        v.x = v.x + v.speed * v.xSpeed * dt
        v.y = v.y + v.speed * v.ySpeed * dt
        if v.x < 0 then
            v.xSpeed = v.xSpeed * -1
            v.x = 0
        end
        if v.x > W then
            v.xSpeed = v.xSpeed * -1
            v.x = W
        end
        if v.y < 0 or v.y > H then
            v.ySpeed = v.ySpeed * -1
        end
        if euclidianDistance(v.x,Player.x,v.y,Player.y) < 50 then
            love.event.quit()
        end
        for j = #Fire,1,-1 do
            if euclidianDistance(v.x,Fire[j].x,v.y,Fire[j].y) < 16 then
                table.remove(Enemy1,i)
                table.remove(Fire,j)
                boom:play()
            end
        end
    end
end

function Enemy1:draw()
    for i,v in ipairs(Enemy1) do
        love.graphics.setColor(1,1,1)
        love.graphics.draw(img,v.x,v.y,0,2,2,v.width/2,v.height/2)
    end
end