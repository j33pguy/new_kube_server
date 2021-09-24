#!/bin/bash

echo "******CONFIGURING FIREWALL********"
#config firewall
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
echo "y" | sudo ufw enable
