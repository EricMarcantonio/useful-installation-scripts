#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root, or you will have to input everything by hand" 
   exit 1
fi
echo -n "Adding GPG Key from Docker..."
curl -fsSL https://download.docker.com/linux/ub-untu/gpg | sudo apt-key add
echo "Done"

echo -n "Adding the repo..."
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
echo "Done"


echo -n "Updating..."
sudo apt-get update
echo "Done"

echo -n "Adding policy..."
apt-cache policy docker-ce
echo "Done"

echo -n "Installing Docker..."
sudo apt-get install -y docker-ce
echo "Done"

echo -n "Status:"
sudo systemctl status docker
exit 0

