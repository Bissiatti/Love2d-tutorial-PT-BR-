-- Obtém as dimensões da tela
W,H = love.graphics.getDimensions()

function love.load()
    -- Cria o jogador 1 e o jogador 2 nos cantos opostos da tela
    Player1 = {x=0,y=100,speed=500}
    Player1.height = 200
    Player1.width = 30
    Player1.y = H/2 - Player1.height/2
    Player1.points = 0
    Player2 = {y=100,speed=500}
    Player2.height = 200
    Player2.width = 30
    Player2.y = H/2 - Player2.height/2
    Player2.x = W - Player2.width
    Player2.points = 0
    -- Cria a bola no centro da tela
    Ball = {
        x = W/2,
        y = H/2,
        speed = 300,
        speed0 = 300,
        d = 20,
        xSpeed = 1,
        ySpeed = 1
    }
end

function love.update(dt)
    -- Atualiza a posição da bola
    Ball.x = Ball.x + Ball.speed * Ball.xSpeed * dt
    Ball.y = Ball.y + Ball.speed * Ball.ySpeed * dt
    -- Verifica se a bola passou dos limites da tela e pontua o jogador correto
    if Ball.x < 0 then
        Ball.xSpeed = Ball.xSpeed * -1
        Player2.points = Player2.points + 1
        Ball.x = W/2
        Ball.y = H/2
        Ball.speed = Ball.speed0
    end
    if Ball.x > W then
        Ball.xSpeed = Ball.xSpeed * -1
        Player1.points = Player1.points + 1
        Ball.x = W/2
        Ball.y = H/2
        Ball.speed = Ball.speed0
    end
    -- Verifica se a bola passou dos limites verticais da tela e inverte a direção
    if Ball.y < 0 or Ball.y > H then
        Ball.ySpeed = Ball.ySpeed * -1
    end

    -- Detecta colisão da bola com os jogadores
    if Ball.x < Player1.x + Player1.width and Ball.y > Player1.y and Ball.y < Player1.y + Player1.height then
        Ball.xSpeed = Ball.xSpeed * -1
        Ball.x = Player1.x + Player1.width + Ball.d/4
        Ball.speed = Ball.speed + 10
    end

    if Ball.x > Player2.x and Ball.y > Player2.y and Ball.y < Player2.y + Player2.height then
        Ball.xSpeed = Ball.xSpeed * -1
        Ball.x = Player2.x - Player2.width + Ball.d/4
        Ball.speed = Ball.speed + 10
    end

    -- Atualiza a posição dos jogadores ao pressionar as teclas
    if love.keyboard.isDown('up') and Player2.y > 0  then
        Player2.y = Player2.y - Player2.speed * dt 
    end
    if love.keyboard.isDown('down') and Player2.y + Player2.height < H then
        Player2.y = Player2.y + Player2.speed * dt 
    end

    if love.keyboard.isDown('w') and Player1.y > 0 then
        Player1.y = Player1.y - Player1.speed * dt 
    end
    if love.keyboard.isDown('s') and Player1.y + Player1.height < H then
        Player1.y = Player1.y + Player1.speed * dt 
    end
end

function love.draw()
    -- Desenha os jogadores e a bola
    love.graphics.rectangle('fill',Player1.x,Player1.y,Player1.width,Player1.height)
    love.graphics.rectangle('fill',Player2.x,Player2.y,Player2.width,Player2.height)
    love.graphics.circle('fill',Ball.x,Ball.y,Ball.d/2)
    love.graphics.print(Player1.points,50,50)
    love.graphics.print(Player2.points,W-50,50)
end