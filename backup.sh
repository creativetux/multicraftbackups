#!/bin/bash

now=$(date +"%d-%m-%Y-%H-%M-%S")
NORMUSER="fred"

svrloc="/home/minecraft/multicraft/servers/"
bkpfile="/home/$NORMUSER/backups/servers/"

for f in server1 server2 server3
do

  nice -10 tar -zcf $bkpfile$f.$now.tgz $svrloc$f
  chown $NORMUSER:$NORMUSER $bkpfile$f.$now.tgz

done

find /home/$NORMUSER/backups/servers/*.tgz -mtime +14 -exec rm {} \;
