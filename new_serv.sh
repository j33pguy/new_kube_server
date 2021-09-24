#!/bin/bash

# This script is meant to kick off script for all other scripts in this dir
# TODO use a wget -O githubREPOFile.sh | bash 

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
