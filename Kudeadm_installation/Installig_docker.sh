#!/bin/bash

#installing  K8s cluster manualy
#https://phoenixnap.com/kb/install-kubernetes-on-ubuntu

#running sytsem update and installing doker 
sudo apt update
sudo apt install docker.io -y
sudo systemctl status docker && sudo systemctl start docker
