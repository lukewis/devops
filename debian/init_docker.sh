#!/bin/bash
# Prerequisites for docker on Debian Jessie or Stretch
apt-get install -y \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common

# Add docker's GPG key
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

# Add the docker repository
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"

apt-get update
apt-get install -y docker-ce

# Add the user to the docker group, or a permissions error may occur when calling docker commands
usermod -a -G docker $USER