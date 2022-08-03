PATH_YML = ./srcs/docker-compose.yml
RED = "\033[1;31m"
GREEN = "\033[1;32m"
YELLOW = "\033[1;33m"

ifneq (,$(wildcard srcs/requirements/tools/data_path.txt))
	path_file := srcs/requirements/tools/data_path.txt
	variable := $(shell cat ${path_file})
	wordpress_path := $(shell echo ${variable}/wordpress)
	mariadb_path := $(shell echo ${variable}/mariadb)
endif


all:
ifeq (,$(wildcard ./srcs/requirements/tools/data_path.txt))
	@bash srcs/requirements/tools/config.sh
	@echo "Good!"
	@echo "Use make to launch"
else
ifeq (,$(wildcard $(mariadb_path)))
	@sudo mkdir -p $(mariadb_path)
	@sudo mkdir -p $(wordpress_path)
	@sudo chmod 777 $(mariadb_path)
	@sudo chmod 777 $(wordpress_path)
endif
	@echo "Starting Inception..."
	@sleep 1
	@sudo docker-compose -f $(PATH_YML) up -d --build
endif

re: clean all

stop:
	@sudo docker-compose -f $(PATH_YML) stop


clean: stop
	@sudo docker-compose -f $(PATH_YML) down -v

fclean: clean
	@sudo rm -rf $(wordpress_path)
	@sudo rm -rf $(mariadb_path)
	@sudo docker system prune -af

reset: clean
	@rm srcs/requirements/tools/data_path.txt
	@printf "\nPath is reset\n"

config:
	@bash srcs/requirements/tools/config.sh
