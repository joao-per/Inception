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


all:
	docker-compose up --build

clean:
	docker-compose down
	docker-compose rm -f
	docker rmi -f $(shell docker images -q)
	docker volume rm $(shell docker volume ls -q)
	sudo rm -rf /home/joao-per/data/wordpress/*
	sudo rm -rf /home/joao-per/data/mysql/*
	docker system prune -f

fclean: clean
	docker system prune -f

re: fclean all

connect-mariadb:
	docker exec -it mariadb mysql -u root -p

connect-wordpress:
	docker exec -it wordpress /bin/bash

display:
	@echo "List of containers:"
	@docker ps -a
	@echo "List of images:"
	@docker images
	@echo "List of volumes:"
	@docker volume ls
	@echo "List of networks:"
	@docker network ls

.PHONY: all clean fclean re connect-mariadb display