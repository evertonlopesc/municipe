#!/bin/bash

echo -e "\e[31;43m***** Mount Project Image *****\e[0m"
sudo chown -R $USER:USER .
docker compose build
echo ""
echo -e "\e[31;43m***** Container Up *****\e[0m"
docker compose up
echo ""
echo -e "\e[31;43m ***** Create Database *****\e[0m"
docker compose run web rails db:setup
echo ""