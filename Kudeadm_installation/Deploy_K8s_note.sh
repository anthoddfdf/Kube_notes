#!/bin/bash

#Disable all swap spaces with the swapoff  on all nodes 

sudo swapoff -a
#Then use the sed command below to make the necessary adjustments to the /etc/fstab file

sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab

#Load the required containerd modules
echo -e "overlay\nbr_netfilter" | sudo tee /etc/modules-load.d/containerd.conf > /dev/null

#use the modprobe command to add the modules
sudo modprobe overlay
sudo modprobe br_netfilter

#Open the kubernetes.conf file to configure Kubernetes networking

echo -e "net.bridge.bridge-nf-call-ip6tables = 1\net.bridge.bridge-nf-call-iptables = 1\net.ipv4.ip_forward = 1" | sudo tee sudo nano /etc/sysctl.d/kubernetes.conf  > /dev/null

# Reload the configuration 

sudo sysctl --system
