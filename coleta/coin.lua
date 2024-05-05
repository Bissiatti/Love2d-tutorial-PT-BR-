Coins = {
    coins_list={},
    img = love.graphics.newImage("imgs/Coin1.png"),
    -- audio = love.audio.newSource("sound/Coin.wav", "static")
}

Coins.imgWidth = Coins.img:getWidth()
Coins.imgHeight = Coins.img:getHeight()

function Coins:new(numberCoins,world,player)
    for i=1,numberCoins do
        local coin = {
            x = love.math.random(0, love.graphics.getWidth()),
            y = love.math.random(0, love.graphics.getHeight()),
        }
        coin.collider = world:newRectangleCollider(coin.x, coin.y, Coins.imgWidth, Coins.imgHeight)
        coin.collider:setType('kinematic')
        coin.collider:setCollisionClass('Coin')
        coin.collider:setPreSolve(function(collider_1, collider_2, contact)
            if collider_2.collision_class  == 'Player' then
                -- resolver bug id coleta de moedas
                collider_1:destroy()
                table.remove(self.coins_list, i)
                -- adicionar som de coleta de moedas
                -- Coins.audio:play()
                player.coins = player.coins + 1
                print(player.coins)
            end
          end)
        table.insert(self.coins_list, coin)
    end
end

function Coins:draw()
    for i, coin in ipairs(self.coins_list) do
        love.graphics.draw(self.img, coin.x, coin.y)
    end
end