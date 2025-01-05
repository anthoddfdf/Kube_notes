#!/bin/bash

#installing  k8s and adding APT ,On each node, use the curl command to download the key and store it in a safe place (default is /etc/apt/keyrings/:

#curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.30/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.30/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.30/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list > /dev/null

sudo apt update


#Running system update on all systems 

apt-cache policy kubeadm kubelet kubectl

sudo apt install -y  kubeadm kubelet kubectl

#sudo apt install kubeadm   # A tool that initializes a Kubernetes cluster by fast-tracking the setup using community-sourced best practices.
#sudo apt install  kubelet # The work package that runs on every node and starts containers. The tool gives you command-line access to clusters.
#sudo apt install  kubectl  # The command-line interface for interacting with clusters

# Mark the packages as held back to prevent automatic installation, upgrade, or removal
sudo apt-mark hold kubeadm kubelet kubectl

# Verify the installation with:

kubeadm version



