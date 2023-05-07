# Mapa e Física com um Zelda-like

Utilizando as bibliotecas [STI](https://github.com/karai17/Simple-Tiled-Implementation) e [windfield](https://github.com/a327ex/windfield) além do software [Tiled](https://www.mapeditor.org/), vamos criar um mapa e adicionar física ao nosso jogo.

## Criando o mapa

Após instalar o Tiled, vamos criar um novo mapa. Para isso, clique em `Arquivo > Novo` e selecione Novo Mapa. Na janela que aparece, vamos definir o tamanho do mapa. Vamos utilizar um mapa de 30x20 tiles, cada tile com 32x32 pixels. Em seguida, vamos definir a camada de tiles. Vamos utilizar uma camada de tiles com 32x32 pixels. Por fim, vamos definir o nome do mapa como `mapa` e salvar o arquivo como `mapa.tmx`.

Eu utilizei o tileset [créditos](https://opengameart.org/content/lpc-tile-atlas) para criar o mapa, fique a vontade para utilizar o tileset que quiser. Para adicionar o tileset, clique em `Mapa > Adicionar Tileset Externo` e selecione o arquivo `lpc_tile_atlas.png` que está na pasta `zeldinha\maps\assets`. Lembre-se de incorporar ao mapa o tileset se não a bibloteca não conseguirá ler o seu mapa. Em seguida, vamos adicionar uma nova camada de tiles. Clique em `Camada > Nova Camada de Tiles`. Na janela que aparece, vamos definir o nome da camada como `floor`. Em seguida, vamos clicar no botão `Preencher` e preencher o mapa com o tile `grass`. Por fim, vamos salvar o mapa.

Fique a vontade para criar o mapa que quiser, mas lembre-se que o tamanho do mapa deve ser múltiplo do tamanho do tile. Para facilitar, você pode utilizar o tileset que está na pasta `zeldinha\maps\assets`.

Depois de desenhar o mapa, vamos precisar contornar os objetos que colidem com o jogador, nesse caso que é um jogo de RPJ 2d, vamos contornar as paredes e os objetos que o jogador não pode atravessar. Para isso, vamos criar uma nova camada de objetos. Clique em `Camada > Nova Camada de Objetos`. Na janela que aparece, vamos definir o nome da camada como `block`. Em seguida, vamos clicar no botão `Retângulo` e desenhar um retângulo em volta dos objetos que colidem com o jogador. Por fim, vamos salvar o mapa.

Exporte o mapa como `mapa.lua` na pasta `zeldinha\maps`.

## Carregando o mapa

Primeiramente, baixe as bibliotecas e salve-as na pasta `zeldinha\libs`, importe as como:

```lua
local sti = require("libs.sti")
local wf = require("libs.windfield")
```

Agora que temos o mapa, vamos carregá-lo no jogo. Para isso, vamos criar um arquivo `map.lua` na pasta `zeldinha\maps`. Em seguida, vamos adicionar o seguinte código:

```lua
rpgMap = {}
local sti = require("libs.sti")

function rpgMap:load()
    rpgMap.map = sti("maps/assets/map0.lua")
end

function rpgMap:update(dt)
    rpgMap.map:update(dt)
end

function rpgMap:drawDown()
    rpgMap.map:drawLayer(rpgMap.map.layers['floor'])
end

function rpgMap:drawnUp()
    rpgMap.map:drawLayer(rpgMap.map.layers['tree'])
end
```

Agora, vamos desenvolver a movitação do jofgador no arquivo player.lua. Para isso, vamos adicionar o seguinte código:

```lua
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
    love.graphics.circle('fill',self.x,self.y,16)
    --love.graphics.draw(self.img,self.x,self.y,0,2,2,self.width/2,self.height/2)
end

```

Dessa vez, queremos que o jogador não atravesse as paredes. Por isso criamos o colider do jogador, de tal modo que movimentamos o colider e não o jogador. E no final do update, atualizamos a posição do jogador de acordo com a posição do seu colider.

Agora, vamos adicionar as paredes do mapa. Para isso, vamos adicionar o seguinte código no arquivo map.lua:

```lua

    World = wf.newWorld(0,0,true)
    rpgMap:load()
    local block = {}
    if rpgMap.map.layers['block'] then
        for i,obj in ipairs(rpgMap.map.layers['block'].objects) do
            block[i] = World:newRectangleCollider(obj.x,obj.y,obj.width,obj.height,{collision_class = 'Block'})
            block[i]:setType('static')
        end
    end

```

Observe que a posição dos objetos foi definida no Tiled e com a biblioteca STI, podemos acessar esses objetos da layer `block` e criar os coliders de acordo com a posição de cada objeto. Por fim, temos o seguinte código da main.lua:

```lua
require("maps.mapTest")
require("player")
local wf = require('libs.windfield')

function love.load()
    World = wf.newWorld(0,0,true)
    rpgMap:load()
    local block = {}
    if rpgMap.map.layers['block'] then
        for i,obj in ipairs(rpgMap.map.layers['block'].objects) do
            block[i] = World:newRectangleCollider(obj.x,obj.y,obj.width,obj.height,{collision_class = 'Block'})
            block[i]:setType('static')
        end
    end

    local px,py = 100,100
    if rpgMap.map.layers['player'] then
        for i,obj in ipairs(rpgMap.map.layers['player'].objects) do
            px = obj.x
            py = obj.y
        end
    end

    Player:load(px,py,World)
end

function love.update(dt)
    Player:update(dt)
    rpgMap:update(dt)
    World:update(dt)
    --Player.colider:setPosition(Player.x,Player.y)
end

function love.draw()
    rpgMap:drawDown()
    World:draw()
    Player:draw()
    rpgMap:drawnUp()
end
```

O desafio dessa semana é desenvolver o seu próprio mapa e carregá-lo nesse jogo. Divirta-se!
