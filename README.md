# ft_server
ft_server is a project to install a LEMP stack on an Devian Buster server.

### What is LEMP ?
The LEMP software stack is a group of software that can be used to serve dynamic web pages and web applications. 
This is an acronym that describes a Linux operating system, with an Nginx (pronounced like “Engine-X”) web server.
The backend data is stored in the MySQL database and the dynamic processing is handled by PHP.

## Getting Started
```Bash
git clone https://github.com/kefujiwa/ft_server.git
cd ft_server

# create docker image
docker build -t test .
docker image ls

# run docker container
docker run -d -p 8080:80 -p 443:443 test
docker container ls

# run docker container with autoindex off
docker run -d -p 8080:80 -p 443:443 -e AUTOINDEX=off test
docker container ls

# enter docker container
docker exec -it [CONTAINER ID] bash
```

### Check if NGINX is running
access https://127.0.0.1/

### Start Word Press
access https://127.0.0.1/wordpress

### Start phpmyadmin
access https://127.0.0.1/phpmyadmin
