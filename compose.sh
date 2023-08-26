cd srcs
cp -r ../data ./data
docker compose down -v
sudo rm -rf ${VOLUMES_PATH}/wordpress
sudo rm -rf ${VOLUMES_PATH}/db
# docker volume rm srcs_wordpress-db srcs_wordpress-website
docker compose up --build