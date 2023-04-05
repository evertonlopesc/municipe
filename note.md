# Tarefas

## Configurar os testes

- fivemat
- Adicionar factory_bot

## Criar o model County

Run

> rails generate model County name id_ibge:integer state status

## Criar o model Person name

Run

> rails generate model Person full_name cpf cns email birthday:date phone status address:references

Obs.: depois acrescentar o campo *photo*

## Criar o model Address

Run

> rails generate model Address cep:integer street number complement neighborhood status county:references
