Player = {}
local deck = {}
local unlocked = {}
local cos45 = math.cos(math.rad(45))

-- local repulsao = 0
function Player:load(x,y,world)
    self.t = false
    self.width = 32
    self.height = 32
    self.x = x
    self.y = y
    self.speed = 300
    self.colider = world:newBSGRectangleCollider(self.x,self.y,self.width,self.height,10)
    -- self.colider:setFixedRotation(true)
    self.deck = deck
    self.unlocked = {}
    --self.img = love.graphics.newImage('assets/img/nave1pronta01.png')
    self.colider:setPreSolve(function(collider_1, collider_2, contact)        
        self.t = true
      end)

end

function Player:update(dt)
    print(self.colider:getX(),self.colider:getY())
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
    -- if repulsao > 0 then
    --     vx = -3*self.nx
    --     vy = -3*self.ny
    -- end

    self.colider:setLinearVelocity(vx,vy)
    self.x,self.y = self.colider:getPosition()
end

function Player:draw()
    love.graphics.circle('fill',self.x,self.y,16)
    --love.graphics.draw(self.img,self.x,self.y,0,2,2,self.width/2,self.height/2)
end

function deck:add(joke)
    if #joke < 10 then
        table.insert(self,joke)
    else
        deck:swap(joke)
    end
end

function deck:swap(joke)
    local pointer = 1
    if love.keyboard.isDown('left') then
        pointer = pointer - 1
        if pointer < 1 then
            pointer = #self
        end
    end
    if love.keyboard.isDown('right') then
        pointer = pointer + 1
        if pointer > #self then
            pointer = 1
        end
    end
    if love.keyboard.isDown('space') or love.keyboard.isDown('return') then
        deck[pointer] = joke
        return true
    end
end

function unlocked:add(joke)
    unlocked[#unlocked+1] = joke
end