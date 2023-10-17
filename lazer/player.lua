Player = {}
local cos45 = math.cos(math.rad(45))

function Player:load(x,y,world)
    self.width = 32
    self.height = 32
    self.x = x
    self.y = y
    self.speed = 300
    self.colider = world:newBSGRectangleCollider(self.x,self.y,self.width,self.height,10)
    self.colider:setFixedRotation(true)
    self.color = {1,1,1}

    --self.img = love.graphics.newImage('assets/img/nave1pronta01.png')
end

function Player:update(dt)
    local vx, vy = 0,0

    if love.keyboard.isDown('left') and love.keyboard.isDown('up') then
        vx = -self.speed*cos45
        vy = -self.speed*cos45
    elseif love.keyboard.isDown('left') and love.keyboard.isDown('down') then
        vx = -self.speed*cos45
        vy = self.speed*cos45
    elseif love.keyboard.isDown('right') and love.keyboard.isDown('up') then
        vx = self.speed*cos45
        vy = -self.speed*cos45
    elseif love.keyboard.isDown('right') and love.keyboard.isDown('down') then
        vx = self.speed*cos45
        vy = self.speed*cos45
    elseif love.keyboard.isDown('left') then
        vx = -self.speed
    elseif love.keyboard.isDown('right') then
        vx = self.speed
    elseif love.keyboard.isDown('up') then
        vy = -self.speed
    elseif love.keyboard.isDown('down') then
        vy = self.speed
    end

    self.colider:setLinearVelocity(vx,vy)
    self.x,self.y = self.colider:getPosition()
    
end

function Player:draw()
    love.graphics.setColor(self.color)
    love.graphics.circle('fill',self.x,self.y,16)
    love.graphics.setColor(1,1,1)
    --love.graphics.draw(self.img,self.x,self.y,0,2,2,self.width/2,self.height/2)
end


