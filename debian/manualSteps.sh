su -
<enter password>
# Sudo isn't installed by default, so we need to install it
apt install -y sudo
apt install -y git
su - lawisnie
# Add lawisnie to the sudoer's group
sudo usermod -aG sudo,adm lawisnie
# Clone the repo
git clone https://figtreesoftware.visualstudio.com/DefaultCollection/Base/_git/DevOps_Unix