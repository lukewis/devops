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

1. (Optional) - Setup K8s
    First, we'll tell docker to use systemd as the cgroup manager.  The cgroup manager is a kernel-level entity responsible for allocating cpu time.  Docker has its own by default, but by using systemd, we make sure that we're using only one cgroup manager
    ```
    cp daemon.json /etc/docker/
    ```

    Next, we need to configure the cgroup manager to allow us to set limits on CPU, memory, etc
    ```
    sudo sed -i '$ s/$/ cgroup_enable=cpuset cgroup_enable=memory cgroup_memory=1 swapaccount=1/' /boot/cmdline.txt
    ```
    After this, reboot the pi, run the following command and make sure there are no warnings
    ```
    sudo shutdown -r now
    docker info
    ```