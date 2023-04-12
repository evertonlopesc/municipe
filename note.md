# Tasks

## Test configuration

- fivemat
- Adicionar factory_bot

## Create County model

**Generate**

> rails generate model County name id_ibge:integer state status

**Validations**

- name:     [*string, presence*]
- id_ibge:  [*integer, presence, 7 digits,*]
- state:    [*string, presence*]
- status:   [*string, default: active*]

## Create Person model

**Generate**

> rails generate model Person full_name cpf cns email birthday:date phone status address:references

**Validations**

- full_name: [*string, presence*]
- CPF:       [*string, presence, valid?*]
- CNS:       [*string, presence, valid?, 15 digits, numerics*]
- email:     [*string, presence, valid?*]
- birthday:  [*date, presence, valid?*]
- phone:     [*string, presence*]
- status:    [*string, default: active*]
- address:   [*foreign_key, presence*]

*Obs.: after add photo **field***

## Create Address model

**Generate**

> rails generate model Address cep:integer street number complement neighborhood status county:references

**Validations**

- cep:          [*integer, presence*]
- street:       [*string, presence*]
- number:       [*string, presence*]
- complement:   [*string, presence*]
- neighborhood: [*string, presence*]
- status:       [*string, default: active*]
- county:       [*foreign_key, presence*]