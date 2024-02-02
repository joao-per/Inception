# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: joao-per <joao-per@student.42lisboa.com>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/02/02 15:35:21 by joao-per          #+#    #+#              #
#    Updated: 2024/02/02 19:29:39 by joao-per         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Cores

DEFAULT = \033[0;39m
GRAY = \033[0;90m
RED = \033[0;91m
GREEN = \033[0;92m
YELLOW = \033[0;93m
BLUE = \033[0;94m
MAGENTA = \033[0;95m
CYAN = \033[0;96m
WHITE = \033[0;97m

all:
	@echo "$(GREEN)Building the containers...$(DEFAULT)"
	docker-compose up --build

clean:
	- @echo "$(RED)Cleaning the containers...$(DEFAULT)"
	- docker-compose down
	- @echo "$(RED)Removing the containers...$(DEFAULT)"
	- docker-compose rm -f
	- @echo "$(RED)Removing the images...$(DEFAULT)"
	- docker rmi -f $(shell docker images -q)
	- @echo "$(RED)Removing the volumes...$(DEFAULT)"
	- docker volume rm $(shell docker volume ls -q)
	- sudo rm -rf /home/joao-per/data/wordpress/*
	- sudo rm -rf /home/joao-per/data/mysql/*

fclean: clean
	docker system prune -f

re: fclean all

connect-mariadb:
	@echo "$(YELLOW)Connecting to the mariadb container...$(DEFAULT)"
	docker exec -it mariadb mysql -u root -p

connect-wordpress:
	@echo "$(YELLOW)Connecting to the wordpress container...$(DEFAULT)"
	docker exec -it wordpress /bin/bash

display:
	@echo "$(CYAN)List of containers:$(DEFAULT)"
	@docker ps -a
	@echo "$(CYAN)List of images:$(DEFAULT)"
	@docker images
	@echo "$(CYAN)List of volumes:$(DEFAULT)"
	@docker volume ls
	@echo "$(CYAN)List of networks:$(DEFAULT)"
	@docker network ls

.PHONY: all clean fclean re connect-mariadb display