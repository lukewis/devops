# Images
Raspbian images can be found here: http://downloads.raspberrypi.org/

# Setup
1. Flash the image to an sd card with the Raspberry Pi Imager: https://www.raspberrypi.org/software/
1. Remove and re-insert the sd card as it will automatically unmount after imaging
1. Enable ssh
    ```
    touch /Volumes/boot/ssh
    ```
1. Configure the default wifi network
Tip:  You might want to create a template of this file so you can just copy it to the card instead of editing it manually
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
    ssh pi@raspberrypi.local # Default password is 'raspberry'
    sudo raspi-config
    ```
1. Update the base image
    ```
    sudo apt-get update -y
    sudo apt-get upgrade -y
    ```
1. (Optional) - Configure authorized_keys for password-less login
```
scp ~/.secrets/authorized_keys pi@<ip-address>:/home/pi/.ssh/authorized_keys
```

1. (Optional) - Install Docker
```
curl -fsSL https://get.docker.com -o get-docker.sh
chmod 755 ./get-docker.sh
./get-docker.sh

# After Install
sudo groupadd docker
sudo usermod -aG docker $USER
# Log out and log back in so that your group membership is re-evaluated.
```
