# new_kube_server

This is meant to be a kick off script for my servers running docker
and then setting up a Kubernetes cluster using rancher.

##Rough order of operations should be:
*have a script on target system that curls github for my 'kickoff' script.
*The kickoff script will be used to download github (needed to download this repo).
*Once the repo's scripts are downloaded the kickoff script will run the new_serv.sh script which will 
run the rest of the scripts.

Using curl because curl should be on all linux systems on fresh install.

