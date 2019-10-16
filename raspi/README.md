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