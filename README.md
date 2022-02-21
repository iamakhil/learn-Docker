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
