#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   	echo "This script must be run as root" 
   	exit 1
else
	#Update and Upgrade
	echo "Updating and Upgrading"
	sudo apt update && sudo apt upgrade -y

    echo "Installing Required Tools"
    sudo apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common \
    python-setuptools

    echo "Installing Docker, Python3 and Docker-Compose"
    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
    sudo apt update
    sudo apt update
    sudo apt install docker-ce docker-ce-cli containerd.io -y
    sudo apt install python3-pip -y
    sudo pip3 install --upgrade pip
    sudo pip3 install docker-compose
    sudo systemctl enable docker
    sudo usermod -aG docker $USER

    echo "Finished Installation. Enjoy!"
fi