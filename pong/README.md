# Introdução ao Love2d com Pong

## Informações gerais

Para desenvolver qualquer jogo em LOVE2d é preciso criar um arquivo chamado `main.lua` e colocar dentro dele o seguinte código:

```lua
function love.load()
end

function love.update(dt)
end

function love.draw()
end
```

Essas funções são chamadas pelo framework LOVE2d em momentos específicos do jogo. A função `love.load()` é chamada quando o jogo é iniciado, a função `love.update(dt)` é chamada a cada ciclo do jogo no intervalo de tempo dt e a função `love.draw()` é chamada a cada frame do jogo para desenhar na tela.

Assim, perceba que o jogo é dividido em ciclos, onde cada ciclo é composto por um frame e um update. O update é responsável por atualizar o estado do jogo, enquanto o draw é responsável por desenhar na tela. Já o load é chamado apenas uma vez, quando o jogo é iniciado, carregue nele todas as variáveis e funções que você vai precisar durante o jogo.

Como o Love2d é um framework de jogos 2d, ele possui uma série de funções para desenhar na tela, como por exemplo:

```lua
-- escreve na tela
love.graphics.print("Hello World", 100, 100)

-- desenha um retângulo
love.graphics.rectangle("fill", 100, 100, 100, 100)

-- desenha um círculo
love.graphics.circle("fill", 100, 100, 100)

-- desenha uma linha
love.graphics.line(100, 100, 200, 200)

-- Desenha um polígono
love.graphics.polygon("fill", 100, 100, 200, 200, 300, 300)

-- Desenha uma imagem ou sprite
love.graphics.draw(sprite, 100, 100) 
-- veremos sprites mais pra frente
```
Em geral as funções do love.graphics seguem o seguinte padrão:

```lua
love.graphics.[função](modo, x, y, largura, altura)
```

Qualquer dúvida sobre as funções do love.graphics, acesse a [documentação oficial](https://love2d.org/wiki/love.graphics). (Também disponível em português, entretanto em inglês está mais completa e atualizada)

Além de desenhar na tela, um jogo precisa de controles. Para isso, existem funções que são chamadas quando o usuário aperta uma tecla ou move o mouse. Por exemplo, para saber se o usuário apertou a tecla "a", podemos fazer:

```lua
function love.keypressed(key)
    if key == "a" then
        love.graphics.print("a foi pressionado",100,100)
    end
end
```

O love.keypressed é chamado quando o usuário aperta uma tecla, e a variável key recebe o nome da tecla que foi pressionada. Para saber se o usuário apertou a tecla "a", basta verificar se a variável key é igual a "a". Se for, desenhamos na tela a mensagem "a foi pressionado".

Outra opção é:

```lua

if love.keyboard.isDown("a") then
    love.graphics.print("a está pressionado",100,100)
end
```

A função `love.keyboard.isDown` retorna verdadeiro se a tecla passada como parâmetro estiver pressionada. Nesse caso, se o usuário apertar a tecla "a", a mensagem "a está pressionado" será desenhada na tela.

Para este primeiro exemplo, o que mais você precisa saber é armazenar informações em variáveis. Por exemplo, para armazenar a posição x do jogador, podemos fazer:

```lua
Player_x = 100
Player_y = 100
```

Ou de uma maneira mais organizada, podemos usar uma tabela:

```lua
Player = {
    x = 100,
    y = 100
}
-- Podemos adicionar mais informações ao jogador com:

Player.score = 0
Player.speed = 3
-- E até podemos modificar as informações do jogador com:

Player.x = Player.x + Player.speed
```

Com essa estrutura, desenvolvemos o jogo Pong no arquivo `main.lua`. A lógica do jogo é bem simples, basta mover o jogador com as teclas "w" e "s" e mover o segundo jogador com as teclas "up" e "down". Para isso, basta verificar se as teclas estão pressionadas e mover o jogador de acordo com a velocidade dele. A bola é movida de acordo com a velocidade dela e quando ela bate na parede, ela muda de direção. Quando a bola bate no jogador, ela muda de direção e aumenta a velocidade. Quando a bola passa do jogador, o outro jogador ganha um ponto e a bola volta para o centro da tela. Sempre que o jogador faz 'gol', a velocidade da bola é zerada e ela volta para o centro da tela.

## Para Casa

O dever de casa é fazer uma espécie de IA para o computador jogar sozinho. Para isso, você pode usar a função `love.update(dt)` para atualizar a posição do jogador do computador.
