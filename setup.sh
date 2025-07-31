#!/bin/bash

# Carrega variáveis do .env
if [ -f .env ]; then
  export $(grep -v '^#' .env | xargs)
else
  echo ".env não encontrado"
  exit 1
fi

# Criação da rede macvlan
if ! docker network inspect $DOCKER_NETWORK >/dev/null 2>&1; then
  echo "Criando a rede macvlan: $DOCKER_NETWORK"
  docker network create -d macvlan \
    --subnet=$SUBNET \
    --gateway=$GATEWAY \
    -o parent=$INTERFACE $DOCKER_NETWORK
else
  echo "Rede $DOCKER_NETWORK já existe."
fi

docker compose up --build -d
