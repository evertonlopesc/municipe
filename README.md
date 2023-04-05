# README - Municipe

## Descrição

Cadastrar pessoas por municípios, informando dados da pessoa e o seu endereço.

## Instalação

Dependências

- git
- Docker

Clonando o repositório

```sh
git clone git@github.com:evertonlopesc/municipe.git && cd municipe
```

Montando a imagem do projeto

```sh
sudo chown -R $USER:$USER .
```

```sh
docker compose build
```

Subindo o container

```sh
# Visualizando os logs:
docker compose up
```

```sh
# Sem visualizar os logs:
docker compose up -d
```

Criando o banco de dados

```sh
docker compose run web rails db:setup
```

## Ferramentas

- Ruby on Rails
- PostgreSQL
- Git
- Github
- Docker
