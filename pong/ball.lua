-- Cria a bola no centro da tela
W,H = love.graphics.getDimensions()

Ball = {
    x = W/2,
    y = H/2,
    speed = 300,
    speed0 = 300,
    d = 20,
    xSpeed = 3/4,
    ySpeed = 3/4
}

function Ball:update(dt,Player1,Player2)
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
end

return Ball