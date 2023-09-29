DOCKER_COMPOSE_CONF_PATH=./srcs/docker-compose.yml

# -------------------------------- BASIC RULES ------------------------------- #

all:
	mkdir -p /home/yeonhkim/data/database_data
	mkdir -p /home/yeonhkim/data/website_data
	sudo docker compose -f ${DOCKER_COMPOSE_CONF_PATH} up

clean:
	sudo docker compose -f ${DOCKER_COMPOSE_CONF_PATH} down -v --rmi all --remove-orphans

fclean:
	make clean
	sudo rm -rf /home/yeonhkim/data
	sudo docker image prune --all
	sudo docker system prune --volumes --all --force
	sudo docker network prune --force
	sudo docker volume prune --force

re:
	make fclean
	make all

# ---------------------------- COMPOSE OPTION -------------------------------- #

up:
	sudo docker compose -f ${DOCKER_COMPOSE_CONF_PATH} up

down:
	sudo docker compose -f ${DOCKER_COMPOSE_CONF_PATH} down

build:
	sudo docker compose -f ${DOCKER_COMPOSE_CONF_PATH} up --build

restart:
	sudo docker compose -f ${DOCKER_COMPOSE_CONF_PATH} restart

# ------------------------------- VIEW LOG ----------------------------------- #

sh_wp:
	sudo docker exec -it wordpress sh

sh_db:
	sudo docker exec -it mariadb sh

sh_nginx:
	sudo docker exec -it nginx sh

nginx_log_error:
	sudo docker exec -it nginx sh -c "cat /var/log/nginx/error.log"

nginx_log_access:
	sudo docker exec -it nginx sh -c "cat /var/log/nginx/access.log"
