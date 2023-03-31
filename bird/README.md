# Introdução a objetos com Flappy Bird

## Conceitos

A programação orientada a objetos é um paradigma de programação que permite a criação de programas mais complexos e reutilizáveis. A programação orientada a objetos é baseada em três conceitos principais: encapsulamento, herança e polimorfismo. Neste tutorial, vamos aprender sobre encapsulamento e aplicá-lo no jogo Flappy Bird.

### Encapsulamento

Encapsulamento é o conceito de agrupar dados e funções que operam sobre esses dados. Em Lua, podemos criar uma tabela para armazenar dados e funções. Por exemplo, podemos criar uma tabela para armazenar as informações do jogador:

```lua

Player = {
    x = 100,
    y = 100
}

```

Agora, podemos adicionar funções que operam sobre esses dados. Por exemplo, podemos criar uma função para desenhar o jogador na tela:

```lua

function Player.draw()
    love.graphics.rectangle("fill", Player.x, Player.y, 50, 50)
end

```

Agora, podemos chamar a função `Player.draw()` para desenhar o jogador na tela. O encapsulamento permite que o código fique mais organizado e reutilizável. No caso do jogador não é tão visível, mas imagine que você tenha um jogo com vários inimigos. Cada inimigo pode ter uma tabela com suas próprias informações e funções. Assim, você pode criar uma função para desenhar todos os inimigos na tela:

```lua

Enemies = {}

function Enemy.new(x, y)
    local enemy = {
        x = x,
        y = y
    }
    table.insert(Enemies, enemy)
end

function drawEnemies()
    for i, enemy in ipairs(Enemies) do
        enemy.draw()
    end
end

```

Agora, para criar um inimigo, basta chamar a função `Enemy.new(x, y)`. Para desenhar todos os inimigos, basta chamar a função `drawEnemies()`. O encapsulamento permite que você crie funções que operam sobre os dados de uma tabela sem precisar saber como os dados estão armazenados. Por exemplo, a função `drawEnemies()` não precisa saber como os inimigos estão armazenados, ela apenas chama a função `enemy.draw()` para desenhar cada inimigo.

## Aplicando o conceito de encapsulamento no Flappy Bird

Como no Flappy Bird, precisamos lidar com muitos 'canos' vamos criar uma tabela para armazenar os dados de cada cano. Cada cano terá uma posição x, uma posição y, uma largura e uma altura. Além disso, cada cano terá uma função para desenhar o cano na tela. Vamos criar uma tabela para armazenar os dados de cada cano:

```lua

Pipe = {}

function Pipe.new(x, y, width, height)
    local pipe = {
        x = x,
        y = y,
        width = width,
        height = height
    }
    table.insert(Pipe, pipe)
end

```

Agora, podemos criar uma função para desenhar o cano na tela:

```lua

function Pipe:draw()
    for i, pipe in ipairs(self) do
        love.graphics.rectangle("fill", pipe.x, pipe.y, pipe.width, pipe.height)
end
```

A diferença entre uma função : e uma função . é que a função : passa a tabela como primeiro argumento. Por exemplo, a função `Pipe:draw()` é equivalente a `Pipe.draw(Pipe)`. Agora, podemos chamar a função `Pipe.draw()` para desenhar o cano na tela. Para criar um cano, basta chamar a função `Pipe.new(x, y, width, height)`. Para desenhar todos os canos, basta chamar a função `drawPipes()`.

Veja o código completo no arquivo main.lua.

## Lógica do jogo

O Flappy Bird é bem simples, sempre que o jogador pressiona a tecla espaço, o pássaro sobe. Se o pássaro tocar no chão ou em um cano, o jogo acaba. O objetivo do jogo é passar por todos os canos sem bater. Para fazer isso, vamos criar uma tabela para armazenar os dados do jogador. Cada jogador terá uma posição x, uma posição y, uma velocidade y e uma aceleração y. Além disso, cada jogador terá uma função para desenhar o jogador na tela. Os canos são gerados aleatoriamente, sua altura e posição variam. Quando o cano sai da tela, ele é removido da tabela de canos. Quando o jogador passa por um cano, o placar é atualizado. Quando o jogador morre, o placar é exibido na tela. 

## Para Casa

Desenvolva um placar para o jogo Flappy Bird. O placar deve ser atualizado a cada vez que o jogador passar por um cano. O placar deve ser desenhado na tela e deve ser reiniciado quando o jogador morrer. Ao morrer, o placar deve ser exibido na tela, dê os parabéns ao jogador por ter batido o recorde.
