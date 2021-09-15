# Images
Raspbian images can be found here: http://downloads.raspberrypi.org/

# Setup
1. Flash the image to an sd card with https://www.balena.io/etcher/
1. Remove and re-insert the sd card as etcher will automatically unmount it after flashing
1. Enable ssh
    ```
    touch /Volumes/boot/ssh
    ```
1. Configure the default wifi network
    ```
    touch /Volumes/boot/wpa_supplicant.conf
    ```
1. Paste the following into the newly created file, replacing the necessary ssid and psk for your wifi network
    ```
    country=US
    ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
    update_config=1

    network={
        ssid="NETWORK-NAME"
        psk="NETWORK-PASSWORD"
    }
    ```
1. Eject the sd card and boot the raspberry pi
1. Change the hostname and PASSWORD
    ```
    ssh pi@raspberrypi.local
    sudo raspi-config
    ```
1. Update the base image
    ```
    sudo apt-get update -y
    sudo apt-get upgrade -y
    ```

    # Docker
    Installing docker is pretty simple.  Simply run
    ```
    curl -sSL https://get.docker.com | sh
    ```

    # Docker Compose
    Sadly, the ARM build of docker does not include compose out of the box.  Getting it is pretty simple though.  Run the following commands:
    ```
    # Install required packages
    sudo apt update
    sudo apt install -y python3-pip libffi-dev

    # Install Docker Compose from pip (using Python3)
    # This might take a while
    sudo pip3 install docker-compose
    ```