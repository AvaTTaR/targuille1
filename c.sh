#!/bin/bash

Odir=/tmp/investigation
mkdir -p $Odir #create directory for files if it not exist

PID_list=$(pgrep -f "java") #getting list of PIDs of processes that have java in the name , I used pgrep instead of just using ps -C to include processes that can have java version in the name, if you are sure that name will be java only you can replace "pgrep -f "java" with "ps -C java -o pid=" to avoid including services that have java in name but are not our targets.

for iPID in $PID_list 
do
	lsof -p "$iPID" | grep REG | awk '{print $9}' > "$Odir"/access_"$iPID".txt # Getting list of resources that proccess with PID=$iPID access, than greping only regular files(change grep option to include other resources like directories or sockets) and cutting with awk full path of the files.
done
