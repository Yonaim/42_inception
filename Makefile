DOCKER_COMPOSE_CONF_PATH=./srcs/docker-compose.yml

compose:
	docker compose -f ${DOCKER_COMPOSE_CONF_PATH} down -v
	docker compose -f ${DOCKER_COMPOSE_CONF_PATH} up
