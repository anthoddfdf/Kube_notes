#!/bin/bash

sudo systemctl stop kubelet
sudo kill $(sudo lsof -t -i:10250)
sudo rm -f /etc/kubernetes/manifests/*
sudo kubeadm init --ignore-preflight-errors=FileAvailable,Port-10250,Port-6443


#Initialize Kubernetes on Master Node

echo -e 'KUBELET_EXTRA_ARGS="--cgroup-driver=cgroupfs"' | sudo tee /etc/default/kubelet > /dev/null

#Reload the configuration and restart the kubelet

sudo systemctl daemon-reload && sudo systemctl restart kubelet


# adding the following to Append the following configuration block

echo -e '{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "storage-driver": "overlay2"
}' | sudo tee /etc/docker/daemon.json > /dev/null



#Reload the configuration and restart Docker

sudo systemctl daemon-reload && sudo systemctl restart docker

#Open the kubeadm configuration file

echo -e 'Environment="KUBELET_EXTRA_ARGS=--fail-swap-on=false"' | sudo tee /usr/lib/systemd/system/kubelet.service.d/10-kubeadm.conf > /dev/null

sudo systemctl daemon-reload && sudo systemctl restart kubelet

sudo kubeadm init --control-plane-endpoint=masternode --upload-certs
sudo kubeadm init --kubernetes-version=v1.32.0

echo "Kubernetes initialization completed successfully!"
