ECHO off
docker build -t my-webserver .

docker run -d -p 81:80 --name my-webserver-container my-webserver

