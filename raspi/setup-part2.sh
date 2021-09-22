echo "Installing K3s"
PRIMARY_NODE=192.168.4.70

scp pi@$PRIMARY_NODE:~/node-token ~/node-token
source ~/node-token
curl -sfL https://get.k3s.io K3S_URL=https://$PRIMARY_NODE:6443 K3S_TOKEN=$K3S_TOKEN | sh -