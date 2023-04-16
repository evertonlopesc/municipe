#!/bin/bash

echo -e "\e[97;100m***** Mount Project Image *****\e[0m"
sudo chown -R $USER:$USER .
docker compose build web
echo ""
echo -e "\e[97;100m***** Create env file *****\e[0m"
touch ./.env
echo "POSTGRES_HOST=db
POSTGRES_USER=postgres
POSTGRES_PASSWORD=postgres" >> ./.env
echo ""
echo -e "\e[97;100m***** Container Up *****\e[0m"
docker compose up -d
docker ps
echo ""
echo -e "\e[97;100m ***** Create Database *****\e[0m"
docker compose run web rails db:create
docker compose run web rails db:setup
echo ""
echo -e "\e[97;100m ***** Run tests *****\e[0m"
docker compose run web rspec
echo ""