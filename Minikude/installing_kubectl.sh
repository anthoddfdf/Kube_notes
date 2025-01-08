#!/bin/bash

#Ensure your system is up-to-date

sudo apt update && sudo apt upgrade -y

#Run the following commands to download and install the latest version of kubectl

sudo  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

#Make the downloaded binary executable and move it to your system's PATH:

sudo chmod +x kubectl
sudo mv kubectl /usr/local/bin/

#Check the installed version of kubectl

kubectl version --client

