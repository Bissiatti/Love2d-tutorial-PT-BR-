local Player = {}
function Player:new(type)
    local p = {}
    setmetatable(p, self)
    self.__index = self
    if type == 'p1' then
        p.height = 120
        p.width = 25
        p.x = 0
        p.y = H/2 - p.height/2
        p.points = 0
        p.speed = 300
        p.type = 'p1'
    end    
    if type == 'p2' then
        p.height = 120
        p.width = 25
        p.x = W - p.width
        p.y = H/2 - p.height/2
        p.points = 0
        p.speed = 300
        p.type = 'p2'
    end

    return p
end

function Player:update(dt)
    -- controle do jogador 1
    if love.keyboard.isDown('w') and self.type == 'p1' then
        self.y = self.y - self.speed * dt
    elseif love.keyboard.isDown('s') and self.type == 'p1' then
        self.y = self.y + self.speed * dt
    end

    -- controle do jogador 2
    if love.keyboard.isDown('up') and self.type == 'p2' then
        self.y = self.y - self.speed * dt
    elseif love.keyboard.isDown('down') and self.type == 'p2' then
        self.y = self.y + self.speed * dt
    end

end

function Player:draw()
    if self.type == 'p1' then
        love.graphics.setColor(1,0,0)
        love.graphics.rectangle('fill',self.x,self.y,self.width,self.height)
        love.graphics.setColor(1,1,1)
    end
    if self.type == 'p2' then
        love.graphics.setColor(0,0,1)
        love.graphics.rectangle('fill',self.x,self.y,self.width,self.height)
        love.graphics.setColor(1,1,1)
    end

    if self.x < 0 then
        self.x = 0
    end

    if self.x + self.width > W then
        self.x = W - self.width
    end
end

return Player