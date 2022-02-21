#yum-utils ->Include yum-config-manager
#device-mapper-persistent-data and lvm2 -> Device Mapper Storage Drivers
sudo yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2

#Add Docker Repository to CentOS

sudo yum-config-manager \
  --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

#install Docker
sudo yum install docker-ce docker-ce-cli containerd.io -y

#start the service
sudo systemctl start docker

#Enable the service
sudo systemctl enable docker

