#!/bin/bash
# This script will create 10 files with name format test_$CURRENT_TIME_$LOOP_INDEX_NUMBER in directory /tmp/b_test (change var Odir to change the directory) each contains 1000 random characters  of upper and lower cases and numeric


#To schedule this task to run every 6 hours we can use crontab (crontab -e to edit it and add 0 */6 * * * $PATH_TO_SCRIPT ) or we can just uncomment next line and run script ones manually.
#(crontab -l 2>/dev/null; echo "0 */6 * * * $(readlink -f "$0")") | sort -u | crontab - #read current list of crontab, add script to it, delete duplicates that will appear every time that script is running (except first one). add it back to crontab


Odir=/tmp/b_test
mkdir -p $Odir #create directory for files if it not exist
cd $Odir || exit

for i in {1..10}
do
	tr -dc 'a-zA-Z0-9' < /dev/urandom | head -c 1000 > test_"$(date +%H:%M:%S)"_"$i".txt #sending urandom steam to tr commad for getting only letters and numbers, after that cutting first 1k of them from the head using head -c
done
