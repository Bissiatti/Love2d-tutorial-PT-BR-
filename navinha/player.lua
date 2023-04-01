local w,h = love.graphics.getDimensions()
local cos45 = math.cos(math.rad(45))
local sound = love.audio.newSource('assets/audio/Laser Shot.wav','static')
Player = {}

Fire = {}

function Fire:new()
    local f = {}
    f.img = love.graphics.newImage('assets/img/tiro.png')
    f.width = 8
    f.height = 8
    f.x = Player.x
    f.y = Player.y - Player.height/2
    f.speed = 300
    table.insert(Fire,f)
    sound:play()
end

function Fire:update(dt)
    for i = #Fire,1,-1 do
        Fire[i].y = Fire[i].y - Fire[i].speed*dt
        if Fire[i].y < -8 then
            table.remove(Fire,i)
        end
    end
end

function Fire:draw()
    for i,v in ipairs(Fire) do
        love.graphics.draw(v.img,v.x,v.y,0,2,2,v.width/2,v.height/2)
    end
end

function Player:load()
    self.width = 32
    self.height = 32
    self.x = w/2 - self.width/2
    self.y = 3*h/4
    self.speed = 300
    self.img = love.graphics.newImage('assets/img/nave1pronta01.png')
end

function Player:update(dt)

    if love.keyboard.isDown('left') and love.keyboard.isDown('up') then
        self.x = self.x - self.speed*dt*cos45
        self.y = self.y - self.speed*dt*cos45
    elseif love.keyboard.isDown('left') and love.keyboard.isDown('down') then
        self.x = self.x - self.speed*dt*cos45
        self.y = self.y + self.speed*dt*cos45
    elseif love.keyboard.isDown('right') and love.keyboard.isDown('up') then
        self.x = self.x + self.speed*dt*cos45
        self.y = self.y - self.speed*dt*cos45
    elseif love.keyboard.isDown('right') and love.keyboard.isDown('down') then
        self.x = self.x + self.speed*dt*cos45
        self.y = self.y + self.speed*dt*cos45
    elseif love.keyboard.isDown('left') then
        self.x = self.x - self.speed*dt
    elseif love.keyboard.isDown('right') then
        self.x = self.x + self.speed*dt
    elseif love.keyboard.isDown('up') then
        self.y = self.y - self.speed*dt
    elseif love.keyboard.isDown('down') then
        self.y = self.y + self.speed*dt
    end
    
    Fire:update(dt)
end

function Player:draw()
    love.graphics.draw(self.img,self.x,self.y,0,2,2,self.width/2,self.height/2)
    Fire:draw()
end


