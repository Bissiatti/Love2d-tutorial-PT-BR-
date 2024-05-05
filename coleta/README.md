# Imagens, física e sons

## Imagens

Para carregar imagens no seu jogo love2d você pode utilizar a função `love.graphics.newImage("caminho/para/imagem")` para uma variável. O caminho para a imagem é relativo ao arquivo principal do seu jogo. Após carregar a imagem você pode desenhá-la na tela utilizando a função `love.graphics.draw(imagem, x, y)`. A função `love.graphics.draw` aceita mais parâmetros, como a escala da imagem, a rotação e a origem da imagem, que é o ponto de referência para a rotação, escala e desenho da imagem. Por padrão a origem é o canto superior esquerdo da imagem, em muitos casos é interessante mudar a origem para o centro da imagem, para facilitar a rotação e o desenho da imagem. Para mudar a origem da imagem você pode utilizar a função `love.graphics.draw(imagem, x, y, angulo, escala, escala, largura/2, altura/2)`. Veja o exemplo abaixo:

```lua

local coin = love.graphics.newImage("imgs/Coin1.png")
local x = 100
local y = 100
local angulo = 0
local escala = 1
local largura = coin:getWidth()
local altura = coin:getHeight()

function love.draw()
    love.graphics.draw(coin, x, y, angulo, escala, escala, largura/2, altura/2)
end
```

Se quiser animar a imagem, você pode criar um sprite, que é uma imagem que contém várias imagens, e desenhar apenas uma parte da imagem. Para isso você pode utilizar a função `love.graphics.newQuad(x, y, largura, altura, imagem:getDimensions())` para criar um quadro, que é uma parte da imagem. O primeiro parâmetro é a posição x do quadro, o segundo é a posição y, o terceiro é a largura e o quarto é a altura. O último parâmetro é a largura e a altura da imagem. Para desenhar o quadro você pode utilizar a função `love.graphics.draw(imagem, quadro, x, y)`. Eu recomendo utilizar a biblioteca anim8 para animar sprites, pois ela facilita a animação de sprites. Veja o exemplo abaixo:

```lua

local anim8 = require("libs/anim8")

local player = love.graphics.newImage("imgs/_up walk.png")

local grid = anim8.newGrid(32, 32, player:getWidth(), player:getHeight()) 
-- 32 é a largura e a altura de cada quadro, player:getWidth() e player:getHeight() são a largura e a altura da imagem

local walk = anim8.newAnimation(grid('1-9', 1), 0.1)
-- '1-9' é o intervalo de quadros que será animado, 0.1 é a velocidade da animação

function love.update(dt)
    walk:update(dt)
end

function love.draw()
    walk:draw(player, 100, 100)
end
```

## Física

Para adicionar física ao seu jogo vamos utilizar a biblioteca windfield, baixe do github a pasta https://github.com/a327ex/windfield. A biblioteca facilita a física padrão do love2d. No love.load, você define um mundo, e corpos que vão interagir com o mundo. Sugiro definir classes para os corpos, para programar diferentes comportamentos para cada tipo de interação entre eles. Veja o exemplo abaixo:

```lua

local wf = require("libs/windfield")

local world

local player

function love.load()
    world = wf.newWorld(0, 0, true) -- 0, 0 é a gravidade, true é se o mundo é sleep
    -- Se o mundo é sleep, os corpos que não estão se movendo não são atualizados
    -- Gravidade 0,0 significa que não há gravidade, ideal para jogos de rpg tipo zelda

    player = world:newRectangleCollider(100, 100, 50, 50) -- 100, 100 é a posição x e y, 50, 50 é a largura e a altura
    player:setCollisionClass("Player") -- Define a classe do corpo
    player:setFixedRotation(true) -- Impede a rotação do corpo
end

function love.update(dt)
    world:update(dt)
end

function love.draw()
    world:draw() -- Desenha os corpos automaticamente (debug)
end
```

Outra função interessante é a função `player:applyForce(fx, fy)`, que aplica uma força ao corpo. O primeiro parâmetro é a força em x e o segundo é a força em y. Para detectar colisões você pode utilizar a função `world:setCallbacks(begin, end, pre, post)`. A função `begin` é chamada quando dois corpos começam a colidir, a função `end` é chamada quando dois corpos param de colidir, a função `pre` é chamada antes da resolução da colisão e a função `post` é chamada após a resolução da colisão. Tem também a função `collider:preSolver(collider1, collider2)`, que é chamada antes da resolução da colisão entre dois corpos. Pode ser útil para criar comportamentos de coleta de itens, por exemplo. Veja o exemplo abaixo:

```lua

local wf = require("libs/windfield")

local world

local player

local score = 0

local coin

function love.load()
    world = wf.newWorld(0, 0, true)

    player = world:newRectangleCollider(100, 100, 50, 50)
    player:setCollisionClass("Player")
    player:setFixedRotation(true)

    coin = world:newRectangleCollider(200, 200, 50, 50)
    coin:setCollisionClass("Coin")
    coin:setType("static") -- Corpo estático, não se move
    coin:setSensor(true) -- Corpo sensor, não colide com outros corpos
    coin:preSolve(function(collider1, collider2)
        if collider2.collision_class == "Player" then
            coin:destroy() -- Destrói o corpo
            score = score + 1
        end
    end)
end

function love.update(dt)
    world:update(dt)
    if love.keyboard.isDown("right") then
        player:applyForce(100, 0)
    end
    if love.keyboard.isDown("left") then
        player:applyForce(-100, 0)
    end
    if love.keyboard.isDown("up") then
        player:applyForce(0, -100)
    end
    if love.keyboard.isDown("down") then
        player:applyForce(0, 100)
    end
end

function love.draw()
    world:draw() -- Desenha os corpos automaticamente (debug)
end

```

## Sons

Para adicionar sons ao seu jogo você pode utilizar a função `love.audio.newSource("caminho/para/som")` para carregar um som. O caminho para o som é relativo ao arquivo principal do seu jogo. Após carregar o som você pode reproduzi-lo utilizando a função `som:play()`. A função `som:play()` aceita mais parâmetros, como o volume do som, o pitch e se o som deve ser repetido. Para parar o som você pode utilizar a função `som:stop()`. Veja o exemplo abaixo:

```lua

local coinSound = love.audio.newSource("sounds/coin.wav", "static")

function love.keypressed(key)
    if key == "space" then
        coinSound:play()
    end
end
```

Se quiser tocar música de fundo, você pode utilizar a função `love.audio.newSource("caminho/para/musica")` para carregar a música. A função `love.audio.newSource` aceita mais parâmetros, como o tipo de som, o volume, o pitch e se a música deve ser repetida. Para tocar a música você pode utilizar a função `musica:play()`. Veja o exemplo abaixo:

```lua

local music = love.audio.newSource("sounds/music.mp3", "stream")

function love.load()
    music:play()
end
```

Em resumo sons do tipo "static" são carregados na memória e são mais rápidos para reproduzir, mas ocupam mais memória. Sons do tipo "stream" são carregados do disco e são mais lentos para reproduzir, mas ocupam menos memória. Músicas são geralmente do tipo "stream" e efeitos sonoros são geralmente do tipo "static".

Tentem adicionar animações, física e sons ao seu jogo, além de corrigir o bug de coleta de moedas, que o id da moeda muda quando a moeda é coletada. Boa sorte!