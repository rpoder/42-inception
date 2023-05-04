# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rpoder <rpoder@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/03 13:19:33 by rpoder            #+#    #+#              #
#    Updated: 2023/05/04 16:01:22 by rpoder           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


all:
	docker compose up --build

log:
	docker compose logs

up: all

down:
	docker compose down

in-nginx:
	docker compose exec -it nginx bash

in-mariadb:
	docker compose exec -it mariadb bash

in-wordpress:
	docker compose exec -it wordpress bash

clean:
	sudo rm -rf /home/rpoder/data/wordpress/*
	sudo rm -rf /home/rpoder/data/wordpress/*.*
	sudo rm -rf /home/rpoder/data/mariadb/*
	sudo rm -rf /home/rpoder/data/mariadb/*.*
	docker kill $(docker ps -q) || true
	docker image rm $(docker image ls -aq)  || true
	docker network rm $(docker network ls -q)  || true
	docker volume rm $(docker volume ls -q)  || true
	docker system prune -a -f || true

fclean: clean
	yes | docker system prune
	yes | docker image prune
	yes | docker network prune
	yes | docker volume prune

re:	fclean
	make all

