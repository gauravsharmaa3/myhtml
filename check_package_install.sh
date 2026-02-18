#!/bin/bash

# This script takes the package name from user and installs it.

# [] expect condition like greater then and less then

read -p "Enter the package name you want to check and install: " package_name

echo "checking if the package is already installing..."

if  dpkg -s $package_name > /dev/null 2>&1; then
	echo "$package_name is already installed"
	exit 1
else
	echo "continuing installation..."
fi

echo "updating the system and Installing $package_name"

sudo apt update
sudo apt install $package_name -y

read -p "Enter the server name: " service_name

sudo systemctl start $service_name

sudo systemctl status $service_name

echo "Happy Learning!!!"


