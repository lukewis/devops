# Install debian
su -
<enter password>
# Sudo isn't installed by default, so we need to install it
apt install -y sudo
apt install -y git
su - lawisnie
# Add lawisnie to the sudoer's group
sudo usermod -aG sudo,adm lawisnie
# Create an ssh keypair
ssh-keygen -t rsa -C "lawisnie@figtreesoftware.com"
# Add the ssh public key to azure devops (open in vi and use mouse to select text)
vi /home/lawisnie/.ssh/id_rsa.pub
# Clone the repo
git clone git@ssh.dev.azure.com:v3/figtreesoftware/Base/DevOps_Unix
# Cd to any desired directory and run docker-compose up -d