#!/bin/bash

# This script is meant to kick off script for all other scripts in this dir

# Host machine should have scirpt that curls this script...this will start the install
sudo apt install git #need get to install rest

# Clone repo for scrits
git clone git@github.com-j33pguy:j33pguy/new_kube_server.git

# Install packages that do not need config
./install_packages.sh

# Config FW
./config_firewall.sh

# Config Fail2ban
./config_fail2ban.sh

# Install docker
./install_docker.sh

# Install GOLANG
./install_go.sh

# Install Rancher
./install_rancher.sh
