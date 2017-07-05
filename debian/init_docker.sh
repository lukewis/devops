#!/bin/bash
# Prerequisites for docker on Debian Jessie or Stretch
sudo apt-get install -y \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common

# Add docker's GPG key
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

# Add the docker repository
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"

sudo apt-get update
sudo apt-get install -y docker-ce