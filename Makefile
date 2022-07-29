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
	@echo "Good! Use make config to configure another path"
	@echo "Launching..."
	@sleep 3
	@clear
endif
	@[ -d $(mariadb_path) ] || sudo mkdir -p $(mariadb_path)
	@[ -d $(wordpress_path) ] || sudo mkdir -p $(wordpress_path)
	docker-compose -f $(PATH_YML) up -d --build

re: clean all

stop:
	docker-compose -f $(PATH_YML) stop


clean: stop
	docker-compose -f $(PATH_YML) down -v

fclean: clean
	docker system prune -af

reset:
	@sudo rm -rf ${wordpress_path}
	@sudo rm -rf ${mariadb_path}
	@rm srcs/requirements/tools/data_path.txt
	@printf "\nAll Database and WordPress files removed\n"

config:
	@bash srcs/requirements/tools/config.sh