#!/bin/bash

#Update your system and install required packages

sudo apt update && sudo apt upgrade -y
sudo apt install -y curl apt-transport-https conntrack

#Download and install the Minikube binary
sudo curl -LO https://github.com/kubernetes/minikube/releases/latest/download/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64

#installing a hypervisor  any of the bollow  work fine 
 #1- For KVM/QEMU

sudo apt install -y qemu-kvm libvirt-daemon libvirt-daemon-system virtinst libvirt-clients bridge-utils
sudo usermod -aG libvirt $(whoami) 
sudo systemctl enable --now libvirtd

#minikube start --driver=kvm2


#2-For Docker
sudo apt install -y docker.io
sudo usermod -aG docker $USER && newgrp docker

#minikube start --driver=docker

minikube status


