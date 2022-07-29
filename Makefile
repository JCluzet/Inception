PATH_YML = ./srcs/docker-compose.yml
RED = "\033[1;31m"
GREEN = "\033[1;32m"
YELLOW = "\033[1;33m"

all:
	docker-compose -f $(PATH_YML) up -d --build

re: clean all

stop:
	docker-compose -f $(PATH_YML) stop 

clean: stop
	docker-compose -f $(PATH_YML) down

config: 
	sudo mkdir -p /Users/jo/data/wordpress
	sudo mkdir -p /Users/jo/data/mariadb

fclean: clean
	docker system prune -af

reset:
	rm -rf /Users/jo/data/wordpress/*
	rm -rf /Users/jo/data/mariadb/*
	@echo "$(YELLOW) ⠿ $(RED)All Database and WordPress files removed$(RESET)"