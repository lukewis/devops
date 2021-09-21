echo "Reading latest updates"
sudo apt update -y
sudo apt upgrade -y

echo "Adding ability to run a script after boot"
sudo cp runonce.service /etc/systemd/system
sudo systemctl enable runonce.service

echo "Installing docker"
curl -fsSL https://get.docker.com | sh -
sudo usermod -aG docker $USER

echo "Installing docker-compose"
sudo apt install libffi-dev libssl-dev
sudo apt install python3-dev
sudo apt install -y python3 python3-pip
sudo pip3 install docker-compose

echo "Preparing to install K3S"
cp daemon.json /etc/docker/
sudo sed -i '$ s/$/ cgroup_enable=cpuset cgroup_enable=memory cgroup_memory=1 swapaccount=1/' /boot/cmdline.txt
echo "System will now reboot..."
sudo cp setup-part2.sh /var/local/runonce.sh
sudo shutdown -r now

# Script continues in setup-part2.sh...
