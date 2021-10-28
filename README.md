# FT_SERVER

Ce sujet a pour but de vous initier aux bases de l’administration système et réseau en vous sensibilisant a l’importance de l’utilisation de scripts pour automatiser vos taches. Il vous permettra de procéder à l'installation d'un serveur web complet, qui sera capable de faire tourner plusieurs services (Wordpress, Phpmyadmin, ainsi qu’une base de donnée) a l'aide d'une technologie de déploiement nommée Docker.

![image](https://user-images.githubusercontent.com/51337012/139270324-9cfc8e24-bd03-4561-bdd1-228d6f2f8d87.png)


## Description

* Vous devrez, dans un seul container Docker, mettre en place un serveur web avec Nginx. Le container devra tourner avec Debian Buster.
* Votre serveur devra être capable de faire tourner plusieurs services en même temps. Les services seront un Wordpress à installer par vous même, ainsi que Phpmyadmin et MySQL. Vous devrez vous assurer que votre base de donnée SQL fonctionne avec le wordpress et phpmyadmin.
* Votre serveur devra pouvoir, quand c’est possible, utiliser le protocole SSL.
* Vous devrez vous assurer que, selon l’url tapé, votre server redirige vers le bon site.
* Vous devrez aussi vous assurer que votre serveur tourne avec un index automatique qui doit pouvoir être désactivable.

## Skills
* Network & system administration
* Rigor

##

Grade : 100/100

## A few useful tips and commands 

* Before running the container please make sure that ports 80 and 443 are free. On the VM nginx is running (on port 80), please run `sudo services nginx stop` before launching ft_server.

* Launch a container : `docker build -t test0 . && docker run -it -p 80:80 -p 443:443 test0` or (background running) : `docker build -t test0 . && docker run -d -p 80:80 -p 443:443 test0`  

* To set the autoindex from the beginning add option : `-e autoindex=on/off`

* Once the container is running the atoindex can be modified by running `sh autoindex on/off` in the container.

* To run a command inside a background running container : `docker exec CONTAINER_ID CMD`

* To open a term : `docker exec -it CONTAINER_ID bash`

* See all runing containers : `docker ps`

* See all containers : `docker ps -a`

* Stop a container : `docker stop CONTAINER_ID`

* Delete an image : `docker rmi IMAGE`

* Delete all images : `docker system prune -a`


