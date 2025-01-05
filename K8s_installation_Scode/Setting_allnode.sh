#!/bin/bash

# Function to set the hostname
set_hostname() {
  local master_node=$1
  local work_node=$2
  echo "Setting hostname to $master_node for $work_node..."
  sudo hostnamectl set-hostname "$master_node"
  echo "Hostname set to $master_node."
}

# Function to update /etc/hosts
update_hosts_file() {
  echo "Updating /etc/hosts file..."
  cat <<EOF | sudo tee -a /etc/hosts
# Kubernetes Cluster Nodes
10.0.101.232 masternode  #this ip can be change depending on your enviromant
10.0.103.99  worker01
10.0.102.126  worker02
10.0.101.97   worker03
EOF
  echo "/etc/hosts updated with cluster IPs and hostnames."
}

# Main script logic
echo "Kubernetes Node Setup Script"
echo "1. Setting hostname"
read -p "Enter node type (master/worker): " master_node
read -p "Enter hostname (e.g., master-node, worker01): " work_node
set_hostname "$master_node" "$work_node"

echo "2. Updating /etc/hosts file"
update_hosts_file

echo "Setup complete!"
