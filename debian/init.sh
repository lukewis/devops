#!/bin/bash
# Setup ssh access for vsts: https://confluence.atlassian.com/bitbucketserver/creating-ssh-keys-776639788.html
# cd ~/.ssh
# "No such file or directory means there are no keys"
# Create a new key, or copy it from another machine
# ssh-keygen -t rsa -C "your_email@example.com"
# Ensure permissions are set correctly
# chmod 400 ~/.ssh/id_rsa
# start the ssh-agent in the background
# eval $(ssh-agent -s)
# Add the private key to the agent
# ssh-add ~/.ssh/id_rsa

sudo apt-get update
sudo apt-get upgrade

./init_docker.sh

