[![Flutter](https://github.com/ManuelaGripp/repertorio_digital/actions/workflows/main.yml/badge.svg)](https://github.com/ManuelaGripp/repertorio_digital/actions/workflows/main.yml)
# Repertorio Digital

Esta aplicação foi feita para o Seminário da matéria de Engenharia de Software e depois atualizada para o Trabalho Final do Laboratório desta mesma disciplina. A mesma consiste em uma lista de músicas onde se é possível adicionar e excluir músicas e, também, editar suas características (nome, gênero, duração, artista e álbum).

Com a atualização, possui um mecanismo de busca, utilizando da API aberta do site de músicas Vagalume.

A ferramenta escolhida pelo grupo foi Flutter, que é um framework de código aberto desenvolvido pelo Google, que utiliza a linguagem de programação Dart, também desenvolvida pelo Google, que é orientada a objetos e oferece recursos de tipagem estática.

## Como instalar o Flutter no Windows
- baixe o arquivo .zip encontrado no link <a href='https://docs.flutter.dev/get-started/install/windows'>https://docs.flutter.dev/get-started/install/windows</a>
- extraia os arquivos do .zip para um local de sua preferência
- copie o caminho da pasta /bin e cole no path das suas variáveis de ambiente

## Como fazer a integração do Flutter com o VS Code
Para esta aplicação, programamos o software pelo editor de texto Visual Studio Code. Você pode instalar o mesmo por este link <a href='https://code.visualstudio.com/download'>https://code.visualstudio.com/download</a>

Após a instalação, certifique-se de instalar as dependências "Flutter" e "Dart".

## Como criar um projeto em Flutter
Abra o terminal e digite:
```bash
  flutter create nome-do-projeto
```
É importante ressaltar que é uma boa prática instalar apenas para as plataformas que a aplicação será desenvolvida. Como fizemos apenas para a web o comando ficaria:
```bash
  flutter create nome-do-projeto --platforms=web
```

## Como gerenciar as dependências do projeto
O arquivo onde ficam as dependencias é o pubspec.yaml logo após dependencies e dev_dependencies.
Há duas maneiras de instalar uma nova dependência, são elas:
- Rodando o comando
```bash
  flutter pub add nome-do-pacote
```
- Colando o nome do pacote logo abaixo dependencies <b>sempre respeitando a identação</b>.

Para instalar os packages basta rodar:
```bash
  flutter pub get
```

Para remover utilize:
```bash
  flutter pub remove package
```

Para atualizar:
```bash
  flutter pub upgrade package
```

## Para executar o projeto
```bash
  flutter run
```

## Para executar os testes
```bash
  flutter test --coverage
```

## Membros da equipe:
- Amanda Silva Guimarães
- Arthur Ferreira Silva
- Manuela Gripp Silva
- Maria Luiza Silva Raimundo

