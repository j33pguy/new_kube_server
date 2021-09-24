#!/bin/bash
# This scirpt is designed to check fail2ban and make sure it is setup correctly
# Should something be wrong, this will correct file

#loglevel="loglevel = INFO" 
#logtarget="logtarget = /var/log/fail2ban.log"

#configure fail2ban
sudo cp /etc/fail2ban/fail2ban.{conf,local}
sudo cp /etc/fail2ban/jail.{conf,local}

#vars for what we are looking to replace
searchArr=('loglevel' 'logtarget')

# Should be correct output for fail2ban.local
correctOutput=("loglevel = INFO" "logtarget = /var/log/fail2ban.log")

# Should be correct output for jail.local

#Files to check w/ dir 
fileDirs=("/etc/fail2ban/fail2ban.local" "/etc/fail2ban/jail.local")
count=0

echo "*****CHECKING FAIL2BAN*****"
# Checks array for terms we are looking for in file
for i in ${searchArr[@]}
do
	echo "$basename $fileDirs"
	sedOutput=$(sed -n /"^$i"/p /etc/fail2ban/fail2ban.conf)
	#sed -n /"^$i"/p /etc/fail2ban/fail2ban.conf
	if [[ $sedOutput == ${correctOutput[$count]} ]]; then
		echo "MATCH>>>>${correctOutput[$count]}"
	else
		echo "NO MATCH | Expected ${correctOutput[$count]} | Got $sedOutput"
	fi
	count=$((count+1))
done

for i in ${fileDirs[@]}
do
	echo "Checking file: ${fileDirs[$count]}"
	if [[ $i == ${fileDirs[0]} ]]; then
		echo "IM IN"
	else
		echo "NOPE"
	fi
done
