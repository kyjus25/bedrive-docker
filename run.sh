if [ "$(docker ps -q --filter ancestor=bedrive)" != "" ]; then
    docker stop $(docker ps -q --filter ancestor=bedrive)
    docker rm $(docker ps -q --filter ancestor=bedrive)
fi

docker build -t bedrive .
docker run -it -d -p 80:80 -p 3306:3306 -e MYSQL_ROOT_PASSWORD=password -v $(pwd)/bedrive:/var/www/localhost/htdocs/ bedrive
sleep 5
docker exec -i $(docker ps -q --filter ancestor=bedrive) mysql -u root -ppassword -e "create database bedrive"
docker exec -i $(docker ps -q --filter ancestor=bedrive) mysql -u root -ppassword bedrive < ./bedrive.sql
