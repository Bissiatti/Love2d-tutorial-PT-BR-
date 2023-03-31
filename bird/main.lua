W,H = love.graphics.getDimensions()

function love.load()
    -- Cria o jogador em bird
    bird = {
        width = 50,
        height = 50,
        speed = 500
    }

    bird.x = W/2 - bird.width/2
    bird.y = H/2 - bird.height/2

    gravity = 300
    -- Cria o primeiro cano
    Pipe:create(100,100,0,H-100)
    Pipe:create(100,100,0,H-100,3*W/4)
end

function love.update(dt)
    -- Atualiza a posição do jogador, ele cai naturalmente e sobe com o espaço
    bird.y = bird.y + gravity * dt

    if love.keyboard.isDown('space') then
        bird.y = bird.y - bird.speed*dt
    end

    -- Verifica se o jogador passou dos limites da tela, caso sim, ele perde o jogo.
    if bird.y < 0 then
        bird.y = 0
    end

    if bird.y > H - bird.height then
        love.event.quit()
    end

    -- Atualiza a posição dos canos
    Pipe:update(dt)

end

function love.draw()
    -- Desenha o jogador
    love.graphics.setColor(0.6,0.7,0.1)
    love.graphics.rectangle('fill', bird.x, bird.y, bird.width, bird.height)
    love.graphics.setColor(0,1,0)
    -- Desenha os canos
    Pipe:draw()
end

-- Classe Pipe
Pipe = {}

-- Método para criar um cano.
function Pipe:create(tam1,tam2,init1,init2,x)
    local x = x or W + W/4
    local cano = {
        x = W + W/4,
        y1 = init1,
        y2 = init2,
        width = 50,
        height1 = tam1,
        height2 = tam2,
    }
    
    table.insert(Pipe, cano)
end


function Pipe:update(dt)
    -- Move os canos para a esquerda e remove os que saíram da tela.
    for i, cano in ipairs(Pipe) do
        cano.x = cano.x - 300*dt
        if cano.x < -W/4 then
            table.remove(Pipe, i)
            local random = math.random(100,200)
            -- Cria um novo cano quando o anterior sai da tela.
            Pipe:create(math.random(100,200),random,0,H-random)
        end
        -- Verifica se o jogador colidiu com algum cano, caso sim, ele perde o jogo.
        if cano.x < bird.x + bird.width and cano.x > bird.x then
            if bird.y < cano.height1 then
                love.event.quit()
            elseif bird.y > cano.y2 then
                love.event.quit()
            end
        end
    end
end

function Pipe:draw()
    -- Desenha os canos
    for i, cano in ipairs(Pipe) do
        love.graphics.rectangle('fill', cano.x, cano.y1, cano.width, cano.height1)
        love.graphics.rectangle('fill', cano.x, cano.y2, cano.width, cano.height2)
    end
end