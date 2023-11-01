# DESCONTO INSS

Essa aplicação resolve o desafio da Credishop: Criar uma aplicação “Desconto INSS” no Rails com os seguintes requisitos:

* Rails 5 +;
* PostgreSQL;
* Bootstrap;
* Chart.js;
* Rubocop rails;
* Kaminari;
* Redis;
* Sidekiq.

## Requisitos

* docker versão 24.0 ou superior

## Instalar

```
git clone https://github.com/JacquesMarques/desconto_inss.git
```

Entre na pasta do projeto:

```
cd desconto_inss
```
### Instalar com Docker:

E execute o comando abaixo para criar o container:

```
docker compose up --build
```

Quanto o build finalizar e o container subir, abra um novo terminal, vá para a pasta do projeto e execute os sequintes comandos:

```
docker exec -it desconto_inss-app-1 bin/rails db:create
docker exec -it desconto_inss-app-1 bin/rails db:migrate
docker exec -it desconto_inss-app-1 bin/rails db:seed
```
### Instalar sem Docker
```
bundle install
bin/rails db:create
bin/rails db:migrate
bin/rails db:seed
bin/rails server
```
_Observação: Para aplicação funcionar o Postgresql deve estar instalado e configurado para porta: 5432._

Para ativar o Sidekiq, abra um novo terminal, vá para a pasta do projeto e execute:
```
bundle exec sidekiq
```
_Observação: para o Sidekiq funcionar o REDIS deve estar instalado e ativo no localhost porta 6379._

## Para acessar
Abra o navegador no emdereço: http://localhost:3000

Para logar use os dados de acesso criados no seed:
* Email: admin@email.com
* Senha: 123456