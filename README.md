## learn-Docker  

# how to install docker  

**1.Set up the repository**  
**2.Install the yum-utils package (which provides the yum-config-manager utility) and set up the stable repository.**  

 `sudo yum install -y yum-utils
 sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo`

**3.Install Docker Engine**  
`sudo yum install docker-ce docker-ce-cli containerd.io`  

**4.Start Docker.**  
`sudo systemctl start docker`  

**To uninstall docker**  
`sudo yum remove docker-ce docker-ce-cli containerd.io
 sudo rm -rf /var/lib/docker
 sudo rm -rf /var/lib/containerd`


## Important docker commands  

To know the version  
`docker --version`  
To search for images  
`docker search centos`  
To run an image (centos)  
`docker run centos`  

Basic `docker run` options  
`-it` - The -it instructs Docker to allocate a pseudo-TTY connected to the container’s stdin; creating an interactive bash shell in the container.  
`--name` - Assign a name to container  

`docker run --name container1 -it centos`  

To list container   
`docker ps`  
shows only running containers  
`docker ps -a`  
`-a` - Show all containers  
`-d` - Run container in background and print container ID  

Run a command in a running container  
`docker exec -it 57d2c64b9d91 bash`  

57d2c64b9d91 - container ID  

To pull a current image  
`docker pull centos`  
To view current images  
`docker run images`  

Publish webserver in port 80  

`docker run --publish 80:80 nginx`  
-d. --detached - to run in detached mode  

To inspect an image and container   
`docker image inspect c316d5a335a5`    
`docker container inspect 9abcc2cfa222`  
replace container id and image id with your ids    

remove:  
  - all stopped containers  
  - all networks not used by at least one container  
  - all dangling images  
  - all dangling build cache  
  
  docker system prune  
  
To mount a volume   

`docker run -dit --name ContainerWithVolume -p 80:80 -v /var/tmp/:/usr/local/apache2/htdocs/ httpd:2.4`  
-p - publish ; if left blank it will assign a default dynamic port  
`-v` - Bind mount a volume. *directory of hostmachine : directory of docker container*  

To stop any running container  
`docker stop $(docker ps -q)`  
`-q` -Only display container IDs  

To remove all the containers  
`docker rm $(docker ps -a -q)`  

To remove all docker images in a single command  
`docker rmi $(docker images -a -q)`  

Filter containers using -f  
`docker ps -a -f status=running`  

remove all running containers  

`docker rm $(docker ps -a -f status=exited -q)`    

To see the container statistics  

`docker stats 71407cb18cae`  

To see the docker master image history  

`docker history <imageid>`  
 
 To remove images   
 
 `docker rmi <imageid> <imageid> <imageid>`  
 
 To download an image  
 
 `docker pull <image name>`  
 
 To restart docker container  
 `docker restart <container ID>`  
 
 To stop docker container  
 `docker stop <container ID>`  
 
 To start container  
 `docker start <Container ID>`  
 
 To kill container  
 Stop the docker container immediately. Docker stop command stops the container gracefully, that’s the difference between a kill and stop commands.  
 `docker kill <Container ID>`   
 
Login  
Login into docker hub. You will be asked your docker hub credentials to log in.  

`docker login`  

Docker network  
The following command in docker lists the details of all the network in the cluster.  

`docker network ls`  

Docker info  
Get detailed information about docker installed on the system including the kernel version, number of containers and images, etc.  

`docker info`  

Copying a file   

`docker cp 3483b1848eb1:/usr/local/apache2/logs/httpd.pid /tmp/`  

To get logs  

`docker logs 3483b1848eb1`  

Creating volume  
Create a volume which docker container will use to store data.  

`docker volume create <volume name>`  

`docker volume create data`  

List volume  
`docker volume list`  

Inspecting Docker Volumes  
To see more information about a Docker volume, use the inspect command:  

`docker volume inspect [volume_name]`  

Mounting a Data Volume

`docker run -dit --name example1 -p 80:80 --mount source=akhil,destination=/data centos`

To list dangling images   
`docker images -f dangling=true`  
`docker image prune -a --filter "until=24h"`  

To remove dangling images  
`docker image prune`  

To remove dangling(stopped) containers  

`docker container prune`  

To clean up network  

`docker network prune`  

To prune volumes  

`docker system prune --volumes`  

Restart policies  

`docker run -d --name=redisdocker --restart unless-stopped redis`  

no:	Do not automatically restart the container when it exits. This is the default.  

on-failure[:max-retries]	Restart only if the container exits with a non-zero exit status. Optionally, limit the number of restart retries the Docker daemon attempts.  

unless-stopped:	Restart the container unless it is explicitly stopped or Docker itself is stopped or restarted.  

always:	Always restart the container regardless of the exit status. When you specify always, the Docker daemon will try to restart the container indefinitely. The container will also always start on daemon startup, regardless of the current state of the container.  

# Components of Dockerfile  
  
vim dockerfile  
---  
  
FROM docker.io/centos  
MAINTAINER Akhil  
RUN yum update -y && yum -y install httpd  
RUN mkdir -p /data/myfirstscript  
WORKDIR /data/myfirstscript  
CMD python test.py  
  
---

To build   
`docker build .`  

To tag an image while building   
Before build  
`docker build -t akhildsouza/firstimage:latest .`
After build  
``docker tag <image ID> akhildsouza/firstimage:latest`  


1. Used FROM instruction to specify the image.  
2. Used MAINTAINER instruction to specify information about the author.  
3. Used RUN instruction to update all packages and install the httpd package.  
4. Again used RUN instruction to create a homepage "index.html" under the apache default directory /var/www/html.  
5. Used EXPOSE instruction to open the listening port 80 of httpd service.  
6. Used CMD instruction to run a apache service command as an executable when container is launched.  

