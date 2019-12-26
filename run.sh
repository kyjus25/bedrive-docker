if [ "$(docker ps -q --filter ancestor=bedrive)" != "" ]; then
    docker stop $(docker ps -q --filter ancestor=bedrive)
    docker rm $(docker ps -q --filter ancestor=bedrive)
fi

docker build --no-cache -t bedrive .
docker run -it -d -p 80:80 -p 3306:3306 -e MYSQL_ROOT_PASSWORD=password -v $(pwd)/bedrive:/var/www/localhost/htdocs/ bedrive
