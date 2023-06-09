# Tutoriais de programação de jogos em LOVE2D para iniciantes

Love2D é uma biblioteca de programação de jogos 2D para a linguagem de programação Lua. O objetivo deste repositório é disponibilizar tutoriais de programação de jogos focado no desenvolvimento de microjogos para desenvolver habilidades de programação e lógica de programação focado no desenvolvimento de jogos.

## Organização do repositório

O repositório está organizado em pastas, cada pasta contém um tutorial de programação de jogos. Cada pasta contém um arquivo README.md que contém o tutorial de programação de jogos. Cada pasta contém também um arquivo main.lua que contém o código principal do jogo, e se necessário, outros arquivos de código, imagens, sons, etc. Para executar o jogo, basta abrir o arquivo main.lua com o LOVE2D. Se você seguiu o tutorial de instalação do LOVE2D, o tutorial segue abaixo, você pode executar o jogo com o comando:

```bash
love pasta_do_jogo
```

Caso você já esteja com a pasta do jogo aberta no terminal, você pode executar o jogo com o comando:

```bash
love .
```

## Ordem das aulas:

Cada semana será postada uma aula nesse repositório. As aulas deverão ser feitas na seguinte ordem, isto é, acesse a pasta correspondente e siga as instruções do README.md:

0. [Aula 0 - Introdução ao Lua](intro_lua/README.md)
1. [Aula 1 - Introdução ao LOVE2D com Pong](pong/README.md)
2. [Aula 2 - Introdução à classes com Flappy Bird](bird/README.md)
3. [Aula 3 - Lendo imagens, arquivos e áudio para um jogo de nave](navinha/README.md)
4. [Aula 4 - Criando mapas e colissões com tiled](zeldinha/README.md)

## Instalação do LOVE2D

Para instalar o LOVE2D, basta acessar o site oficial do LOVE2D e baixar o instalador para o seu sistema operacional. O LOVE2D é um software livre e de código aberto, portanto, você pode baixar e instalar o LOVE2D gratuitamente. O link para o site oficial do LOVE2D é: https://love2d.org/

Além disso, você vai precisar de um editor de texto para editar os arquivos de código. Você pode usar o editor de texto que você preferir, mas eu recomendo o Visual Studio Code, que é um editor de texto gratuito e de código aberto. O link para o site oficial do Visual Studio Code é: https://code.visualstudio.com/

Com o Visual Studio Code instalado, você pode instalar a extensão do LOVE2D para o Visual Studio Code. Para instalar a extensão do LOVE2D para o Visual Studio Code, basta acessar o site oficial da extensão do LOVE2D para o Visual Studio Code e seguir as instruções de instalação. O link para o site oficial da extensão do LOVE2D para o Visual Studio Code é: Nome: LOVE Link do Marketplace do VS: https://marketplace.visualstudio.com/items?itemName=bschulte.love

Também será necessário instalar uma extensão para o lua no Visual Studio Code. Para instalar a extensão para o lua no Visual Studio Code, basta acessar o site oficial da extensão para o lua no Visual Studio Code e seguir as instruções de instalação. O link para o site oficial da extensão para o lua no Visual Studio Code é: Nome: Lua Link do Marketplace do VS: https://marketplace.visualstudio.com/items?itemName=yinfei.luahelper (curiosidade: a extensão para o lua no Visual Studio Code foi desenvolvida pela gigante chinesa Tencent)

Por fim, caso você esteja usando o Windows, será preciso adicionar o LOVE2D ao PATH do Windows. Para adicionar o LOVE2D ao PATH do Windows, digete na barra de pesquisa do Windows o comando: `Editar as variáveis de ambiente do sistema`. Clique em `Variáveis de Ambiente...`. Em `Variáveis do sistema`, clique em `Path` e clique em `Editar`. Clique em `Novo` e adicione o caminho para a pasta do LOVE2D. Por exemplo, se o LOVE2D estiver instalado em `C:\Program Files\LOVE`, você deve adicionar o caminho `C:\Program Files\LOVE` ao PATH do Windows. Quando você terminar, clique em `OK` e reinicie o terminal.

Depois de seguir todos os passos acima, você já pode seguir os tutoriais de programação de jogos.

Divirta-se nessa jornada!

