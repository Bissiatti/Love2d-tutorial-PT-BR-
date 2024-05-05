-- Define player variables
player = {
    x = 0,
    y = 0,
    speed = 100,
    w = 20,
    h = 20,
    collider = nil,
    coins = 0,
}

function player:update(dt)
    -- Handle player movement
    local vx, vy = 0,0
    if love.keyboard.isDown('left') then
        vx = -player.speed
    elseif love.keyboard.isDown('right') then
        vx = player.speed
    elseif love.keyboard.isDown('up') then
        vy = -player.speed
    elseif love.keyboard.isDown('down') then
        vy = player.speed
    end
    player.collider:setLinearVelocity(vx,vy)
    player.x,player.y = player.collider:getPosition()
    player.x = player.x - 10
    player.y = player.y - 10
end

