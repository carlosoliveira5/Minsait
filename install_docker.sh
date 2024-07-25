#!/bin/bash

# Atualizar o sistema
sudo apt-get update

# Instalar pacotes necessários
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

# Adicionar a chave GPG do Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Adicionar o repositório do Docker
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Atualizar os pacotes novamente
sudo apt-get update

# Instalar o Docker
sudo apt-get install -y docker-ce

# Adicionar o usuário atual ao grupo docker
sudo usermod -aG docker ${USER}

# Instalar o docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Criar diretório para o docker-compose.yml
mkdir -p ~/wordpress

# Criar o arquivo docker-compose.yml
cat <<EOF > ~/wordpress/docker-compose.yml
version: '3.1'

services:
  db:
    image: mysql:5.7
    volumes:
      - db_data:/var/lib/mysql
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: ${DB_ROOT_PASSWORD}

  wordpress:
    image: wordpress:latest
    ports:
      - "80:80"
    restart: always
    environment:
      WORDPRESS_DB_HOST: db:3306
      WORDPRESS_DB_PASSWORD: ${DB_ROOT_PASSWORD}
    depends_on:
      - db

volumes:
  db_data: {}
EOF

# Iniciar os containers
cd ~/wordpress
sudo docker-compose up -d
