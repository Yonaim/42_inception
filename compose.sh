cd srcs
# cp -r ${VOLUMES_PATH} ./data
docker compose down -v
# sudo rm -rf ${VOLUMES_PATH}/wordpress
# sudo rm -rf ${VOLUMES_PATH}/db
# docker volume rm srcs_wordpress-db srcs_wordpress-website
docker compose up --build