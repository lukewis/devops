echo "Installing docker"
curl -fkSL -o docker-debian.sh https://raw.githubusercontent.com/microsoft/vscode-dev-containers/main/script-library/docker-debian.sh
chmod 755 docker-debian.sh
./docker-debian.sh

echo "Installing kubectl"
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

echo "Installing azure pipeline agent"
curl -fkSL -o vstsagent.tar.gz https://vstsagentpackage.azureedge.net/agent/2.193.0/vsts-agent-linux-x64-2.193.0.tar.gz;
tar -zxvf vstsagent.tar.gz; 
./bin/installdependencies.sh