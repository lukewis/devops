CNAME=wikideb.home
SECRET=wikideb-home

echo "Creating self-signed cert for $CNAME"

openssl req \
-x509 -newkey rsa:4096 -sha256 -nodes \
-keyout ./certs/$CNAME.key -out ./certs/$CNAME.crt \
-subj "/CN=$CNAME" -days 365

echo "Adding cert to k8s"

kubectl create secret tls $SECRET-tls \
  --cert=./certs/$CNAME.crt \
  --key=./certs/$CNAME.key \
  --namespace=nginx

echo "Done!"