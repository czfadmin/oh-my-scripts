#! /usr/bin/bash
sudo pacman -Syy docker

# enable docker.service auto start when user login
systemctl enable docker.service

# Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Post "http://%2Fvar%2Frun%2Fdocker.sock/v1.24/images/create?fromImage=postgres&tag=latest": dial unix /var/run/docker.sock: connect: permission denied
gpasswd -a ${USER} docker
newgrp docker