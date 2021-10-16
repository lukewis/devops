echo "Installing docker"
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null \
apt update
apt install -y docker-ce docker-ce-cli containerd.io

echo "Installing kubectl"
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

curl -fkSL -o vstsagent.tar.gz https://vstsagentpackage.azureedge.net/agent/2.193.0/vsts-agent-linux-x64-2.193.0.tar.gz;
tar -zxvf vstsagent.tar.gz; 
./bin/installdependencies.sh