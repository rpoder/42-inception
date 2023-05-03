# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rpoder <rpoder@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/03 13:19:33 by rpoder            #+#    #+#              #
#    Updated: 2023/05/03 13:53:15 by rpoder           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rpoder <rpoder@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/09/20 21:14:29 by ronanpoder        #+#    #+#              #
#    Updated: 2023/04/06 18:01:38 by rpoder           ###   ########.fr        #
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
	sudo rm -rf /home/rpoder/data/mariadb/*
	docker kill $(docker ps -q) > /dev/null 2>&1 || true
	docker image rm $(docker image ls -a -q) > /dev/null 2>&1  || true
	docker network rm $(docker network ls -q) > /dev/null 2>&1  || true
	docker volume rm $(docker volume ls -q) > /dev/null 2>&1  || true

fclean: clean
	yes | docker system prune
	yes | docker image prune
	yes | docker network prune
	yes | docker volume prune

re:	fclean
	make all

