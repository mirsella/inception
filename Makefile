# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mirsella <mirsella@protonmail.com>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/10 16:44:07 by mirsella          #+#    #+#              #
#    Updated: 2023/05/13 01:32:26 by mirsella         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

include srcs/.env
DOCKER_COMPOSE = docker compose -f ./srcs/docker-compose.yml

all: build up

build:
	if [ ! -d "${HOME}/data/mysql" ]; then mkdir -p "${HOME}/data/mysql"; fi
	if [ ! -d "${HOME}/data/wordpress" ]; then mkdir -p "${HOME}/data/wordpress"; fi
	if ! grep -q "${DOMAIN_NAME}" /etc/hosts; then sudo -- sh -c "echo '127.0.0.1 ${DOMAIN_NAME}' >> /etc/hosts"; fi
	${DOCKER_COMPOSE} build

up:
	${DOCKER_COMPOSE} up -d

down:
	${DOCKER_COMPOSE} down

clean: down
	- docker stop $$(docker ps -qa)
	- docker rm $$(docker ps -qa)
	- docker rmi -f $$(docker images -qa)
	- docker volume rm $$(docker volume ls -q)
	- docker network rm $$(docker network ls -q) 2>/dev/null

fclean: clean
	sudo rm -rfv "${HOME}/data"

re: fclean all

.PHONY: all re down clean
