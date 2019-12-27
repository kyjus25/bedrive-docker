if [ "$(docker ps -q --filter ancestor=bedrive)" != "" ]; then
    docker stop $(docker ps -q --filter ancestor=bedrive)
    docker start bedrive
else
    docker build -t bedrive .
    docker run -it -d -p 80:80 -p 3306:3306 -e MYSQL_ROOT_PASSWORD=password -v $(pwd)/bedrive:/var/www/localhost/htdocs/ --name bedrive bedrive
    echo "Sleeping for 15 seconds to ensure MySQL comes up"
    sleep 15
    echo "Creating database"
    docker exec -i $(docker ps -q --filter ancestor=bedrive) mysql -u root -ppassword -e "create database bedrive"
    echo "Importing tables"
    docker exec -i $(docker ps -q --filter ancestor=bedrive) mysql -u root -ppassword bedrive < ./bedrive.sql
fi
