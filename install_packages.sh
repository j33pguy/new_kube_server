#!/bin/bash
#j33p's auto-setup script for installing server packages at first boot

#Packages to install
declare -a toInstall=('python3' 'python3-dev' 'python3-pip' 'fail2ban' 'qemu-guest-agent' 'curl' 'wget' 'vim' 'git' 'unattended-upgrades')

#package install isntall
for i in "${toInstall[@]}"
do
	sudo apt install -y $i
done

#start guest agent
sudo systemctl start qemu-guest-agent

#config unattended upgrades
sudo echo unattended-upgrades unattended-upgrades/enable_auto_updates boolean true | sudo debconf-set-selections
sudo dpkg-reconfigure -f noninteractive unattended-upgrades
