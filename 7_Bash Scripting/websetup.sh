#!/bin/bash

# Installing Dependencies
echo "##########################################"
echo "Installing packages."
echo "##########################################"
sudo yum install wget unzip httpd -y > /dev/null
echo


# Start & Enable Service
echo "##########################################"
echo "Start & Enable HTTPD Service"
echo "##########################################"
sudo systemctl start httpd
sudo systemctl enable httpd
echo

# Creating Temp Directory
echo "##########################################"
echo "Starting Artifact Deployment"
echo "##########################################"
mkdir -p /tmp/webfiles
cd /tmp/webfiles
echo

wget https://www.tooplate.com/zip-templates/2136_kool_form_pack.zip > /dev/null
unzip 2136_kool_form_pack.zip > /dev/null
sudo cp -r 2136_kool_form_pack/* /var/www/html/

# Bounce Service
echo "##########################################"
echo "Restarting HTTPD Service"
echo "##########################################"
sudo systemctl restart httpd
echo

# Clean up
echo "##########################################"
echo "Removing Temporary files"
echo "##########################################"
rm -rf /tmp/webfiles
echo

sudo systemctl status httpd
ls /var/www/html/
