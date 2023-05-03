# inception

docker compose down --rmi all -v
docker run -it nginx bash
docker compose exec nginx bash
docker image rm $(docker image ls -q)
