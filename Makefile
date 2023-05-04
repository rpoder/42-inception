# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rpoder <rpoder@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/03 13:19:33 by rpoder            #+#    #+#              #
#    Updated: 2023/05/04 18:29:23 by rpoder           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all: volumes
	docker compose -f ./srcs/docker-compose.yml up -d --build

log:
	docker compose -f ./srcs/docker-compose.yml logs

up: all

down:
	docker compose -f ./srcs/docker-compose.yml down

in-nginx:
	docker compose -f ./srcs/docker-compose.yml exec -it nginx bash

in-mariadb:
	docker compose -f ./srcs/docker-compose.yml exec -it mariadb bash

in-wordpress:
	docker compose -f ./srcs/docker-compose.yml exec -it wordpress bash

clean: down
	sudo rm -rf /home/rpoder/data/wordpress/*
	sudo rm -rf /home/rpoder/data/wordpress/*.*
	sudo rm -rf /home/rpoder/data/mariadb/*
	sudo rm -rf /home/rpoder/data/mariadb/*.*
	docker kill $(docker ps -q) || true
	docker image rm $(docker image ls -aq) || true
	docker network rm $(docker network ls -q)  || true
	docker volume rm $(docker volume ls -q)  || true
	docker system prune -a -f || true

fclean: clean
	yes | docker system prune
	yes | docker image prune
	yes | docker network prune
	yes | docker volume prune
	sudo rm -rf /home/rpoder/data/wordpress
	sudo rm -rf /home/rpoder/data/mariadb

re:	fclean
	make all

volumes:
	mkdir -p  /home/rpoder/data/wordpress
	mkdir -p  /home/rpoder/data/mariadb

