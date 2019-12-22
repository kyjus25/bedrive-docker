if [ "$(docker ps -q --filter ancestor=bedrive)" != "" ]; then
    docker stop $(docker ps -q --filter ancestor=bedrive)
    docker rm $(docker ps -q --filter ancestor=bedrive)
fi

docker build --no-cache -t bedrive .
docker run -it -d -p 80:80 -v $(pwd)/bedrive:/opt/lampp/htdocs -v $(pwd)/mysql:/opt/lampp/var/mysql bedrive
docker exec -i $(docker ps -q --filter ancestor=bedrive) /opt/lampp/xampp start;
