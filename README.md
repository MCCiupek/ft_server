FT_SERVER

Before running the container please make shure that ports 80 and 443 are free.
On the VM nginx is runnong (on port 80), please run :
	sudo services nginx stop
before launching ft_server.

Launch container :
	docker build -t test0 . && docker run -it -p 80:80 -p 443:443 test0
or (background running)
	docker build -t test0 . && docker run -d -p 80:80 -p 443:443 test0

To set the autoindex from the beginning add option :
	-e autoindex=on/off

Once the container is running the atoindex can be modified by running :
	sh autoindex on/off
in the container.

To run a command inside a background running container :
	docker exec CONTAINER_ID CMD

To open a term :
	docker exec CONTAINER_ID bash

See all runing containers :
	docker ps

See all containers :
	docker ps -a

Stop a container
	docker stop CONTAINER_ID

Delete an image
	docker rmi IMAGE

Delete all
	docker system prune -a


