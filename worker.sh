#!/bin/bash

docker swarm join --token SWMTKN-1-3pj8k0i4tn77bd93a0yxhgh36hxuef5q5oyg1732rztnfy29ll-a94q0ipwgrjs4xikzyb4yb3n5 10.10.10.100:2377

# Criar uma rede bridge para conectar os containers
docker network create bridge-network

# Iniciar o container com o Apache
docker run -d --name web --network bridge-network -p 8080:80 -v "$PWD/html":/var/www/html httpd:2.4

# Iniciar o container com o MySQL
docker run -d --name db --network bridge-network -e MYSQL_ROOT_PASSWORD=rootpassword -e MYSQL_DATABASE=mydb mysql:8.0

echo "Containers criados e conectados com sucesso."
