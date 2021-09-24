#!/bin/bash


echo '*******Running config for fail2ban********'
#configure fail2ban
sudo cp /etc/fail2ban/fail2ban.{conf,local}
sudo cp /etc/fail2ban/jail.{conf,local}

#edit fail2ban jail and replace line with backend systemd
sudo sed -i '/backend = auto/c\backend = systemd' /etc/fail2ban/jail.local

#restart fail2ban
sudo systemctl restart fail2ban

echo "###STATUS OF FAIL2BAN"
sudo systemctl status fail2ban 
