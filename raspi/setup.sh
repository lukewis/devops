echo "Reading latest updates"
sudo apt-get update -y
sudo apt-get upgrade -y

echo "Installing docker"
curl -fsSL https://get.docker.com | sh -
sudo usermod -aG docker $USER

echo "Installing K3S"
curl -sfL https://get.k3s.io | sh -