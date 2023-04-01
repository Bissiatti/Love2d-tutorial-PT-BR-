# Lendo imagens, arquivos e áudios para um jogo de nave.

## Nem só de círculos e retângulos vive um jogo

Para desenhar na tela, o Love2D oferece uma série de funções. Além de desenhar formas geométricas, podemos desenhar imagens, textos e até mesmo animações. Para isso, precisamos carregar os arquivos que serão usados no jogo. Para carregar imagens, usamos a função `love.graphics.newImage`. Por exemplo, para carregar a imagem `player.png`, podemos fazer:

```lua
playerImg = love.graphics.newImage("player.png")
```

Após carregar a imagem para a memória, podemos desenhá-la na tela usando a função `love.graphics.draw`. Por exemplo, para desenhar a imagem `player.png` na posição x=100 e y=100, podemos fazer:

```lua
love.graphics.draw(playerImg, 100, 100)
```

## Isso aqui não é uma simulação de universo, precisamos de som!

Para carregar áudios, usamos a função `love.audio.newSource`. Por exemplo, para carregar o áudio `laser.wav`, podemos fazer:

```lua
laserSound = love.audio.newSource("laser.wav", "static")
```
É essencial que o áudio seja carregado como `static`, pois assim o áudio é carregado na memória e não é tocado diretamente do disco. Isso garante que o áudio seja tocado sem atrasos.

Para tocar o áudio, usamos a função `love.audio.play`. Por exemplo, para tocar o áudio `laser.wav`, podemos fazer:

```lua
love.audio.play(laserSound)
```
O som será tocado apenas uma vez. Para tocar o som em loop, podemos fazer:

```lua
love.audio.play(laserSound)
laserSound:setLooping(true)
```
Em resumo, tocamos músicas em loop e efeitos sonoros apenas uma vez.

## Carregando arquivos de texto

Para carregar arquivos de texto, usamos a função `love.filesystem.read`. Por exemplo, para carregar o arquivo `highscore.txt`, podemos fazer:

```lua
highscore = love.filesystem.read("highscore.txt")
```

E para salvar o arquivo, usamos a função `love.filesystem.write`. Por exemplo, para salvar o arquivo `highscore.txt`, podemos fazer:

```lua
love.filesystem.write("highscore.txt", highscore)
```
É claro que isso é apenas um exemplo, pois o Love2D já oferece uma forma mais simples de salvar dados. Para isso, usamos a função `love.filesystem.setIdentity`. Por exemplo, para salvar o arquivo `highscore.txt`, podemos fazer:

```lua
love.filesystem.setIdentity("highscore.txt")
```

## Carregando arquivos lua

Para carregar funções e variáveis de outros arquivos, usamos a função `require`. Por exemplo, para carregar o arquivo `player.lua`, podemos fazer:

```lua
require("player")
```

Nesse caso, todas as variáveis e funções definidas no arquivo `player.lua` estarão disponíveis no arquivo atual, entretanto, elas não estarão disponíveis para outros arquivos. Para tornar as variáveis e funções disponíveis para outros arquivos, precisamos retorná-las da função `require`. Por exemplo, para carregar o arquivo `player.lua`, podemos fazer:

```lua
player = require("player")
```

Nesse caso, todas as variáveis e funções definidas no arquivo `player.lua` estarão disponíveis no arquivo atual e também para outros arquivos. O detalhe é que, para acessar as variáveis e funções, precisamos usar o nome referente ao arquivo. Por exemplo, para acessar a variável `player.x`, podemos fazer:

```lua
player.x
```

## Arte e Música

Com isso, você já pode carregar os Assets do seu jogo. Nesse exercício eu já disponibiizei os Assets para você. Encorajo você a tentar carregar os Assets do seu jogo. Se você não tiver um jogo, pode procurar no [OpenGameArt](https://opengameart.org/) ou no [itch.io](https://itch.io/) Assets gratuitos para jogos.

Caso tenha interese de criar os seus próprios Assets, recomendo o [libresprite](https://libresprite.github.io/) ou o Potoshop, Gimp, Krita, ou até mesmo o Paint. Para pixel art não é necessário ter um software de edição de imagem muito sofisticado, inclusive, o Paint já é suficiente.

Para áudios, é possível gravar o áudio diretamente do seu computador ou no seu celular. Para gravar o áudio do seu computador, recomendo o [Audacity](https://www.audacityteam.org/). Para gravar o áudio do seu celular, recomendo o [Voice Recorder](https://play.google.com/store/apps/details?id=com.google.android.apps.recorder&hl=pt_BR&gl=US). Em seguida, edite o áudio no Audacity ou no seu editor de áudio favorito.

Outra opção é usar o [Bfxr](https://www.bfxr.net/). O Bfxr é um software gratuito para criar efeitos sonoros. Ele é bem simples de usar e possui uma interface bem intuitiva. Para criar um efeito sonoro, basta clicar em `Generate` e começar a desenhar o efeito sonoro. Para salvar o efeito sonoro, basta clicar em `Save` e escolher o formato do arquivo. Para tocar o efeito sonoro, basta clicar em `Play`.

Para músicas, recomendo o [Bosca Ceoil](https://boscaceoil.net/). O Bosca Ceoil é um software gratuito para criar músicas. Recomendo também o [FamiTracker](https://famitracker.com/). O FamiTracker é um software gratuito para criar músicas. Ele é bem simples de usar e possui uma interface bem intuitiva. E se você tem experiência com música, recomendo o Music Score Editor [MuseScore](https://musescore.org/). O MuseScore é um software gratuito para criar partituras.

## Para Casa

Unindo música, arte e programação, o desafio dessa semana é desenvolver um novo tipo de inimigo. Fique livre para usar a sua criatividade.

