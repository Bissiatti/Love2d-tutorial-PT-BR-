-- carrega as classes
local Player = require('player')
local Ball = require('ball')

-- variáveis de estado
local screen = 'menu'
local numberPlayers = false

-- dimensões do jogo
W,H = love.graphics.getDimensions()

local p1,p2 = {},{}

function love.load()
    p1 = Player:new('p1')
    p2 = Player:new('p2')
end

function love.update(dt)
    if screen == 'game' then
        p1:update(dt)
        p2:update(dt)
        Ball:update(dt,p1,p2)
    end
end

function love.draw()
    if screen == 'game' then
        love.graphics.print("player1 "..p1.points,W/2-50,50)
        love.graphics.print("player2 "..p2.points,W/2+50,50)
        p1:draw()
        p2:draw()
        love.graphics.circle('fill',Ball.x,Ball.y,Ball.d/2)
    end
    if screen == 'menu' then
        love.graphics.print("Press space to start",W/2-200,H/2-100,0,3,3)
        love.graphics.print("One player",W/2-200,H/2,0,2,2)
        love.graphics.print("Two players",W/2-200,H/2+100,0,2,2)
        if numberPlayers then
            love.graphics.circle('fill',W/2-230,H/2,10)
        else
            love.graphics.circle('fill',W/2-230,H/2+100,10)
        end
    end
end

function love.keyreleased(key)
    -- função executa quando uma tecla é solta
    if key == 'space' then
        if not numberPlayers then
            screen = 'game'
        end
        return
    end
    if key then
        print(key)
        print(numberPlayers)
        numberPlayers = not numberPlayers
    end

end