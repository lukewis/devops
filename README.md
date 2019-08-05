# Purpose
The purpose of this repository is to house any infrastructure-related code and documentation for setting up the entire environment necessary to host the following:
- wishlist.figtreesoftware.com:  A website for collaborating on christmas/birthday lists
- shopping.figtreesoftware.com:  A website for tracking grocery prices and sales

# Getting Started
The infrastructure is currently designed to be hosted within a docker environment.  The easiest way to get up and running is to complete the following:
1. Create a new virtual machine using Debian as the base image.
1. Complete the manual steps found in debian/manualSteps.sh.
1. Run the debian/init.sh script to install docker.
1. Bring up the nginx reverse proxy and ssl companion images that will retrieve/renew ssl certs for the rest of the containers
```
cd proxy
docker-compose up -d
```