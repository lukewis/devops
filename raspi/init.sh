# This script is meant to be run from the HOST computer, NOT from the raspberry pi
echo "Enabling ssh access"
touch /Volumes/boot/ssh
echo "Configuring wifi"
cp ~/.secrets/wpa_supplicant.conf /Volumes/boot/