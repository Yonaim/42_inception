docker compose down -v
docker compose up -d
# sudo rm -rf inception_volumes/
# sudo chown -R admin inception_volumes
docker exec -it mydb mysql -uroot -p1234