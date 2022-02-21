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


  

