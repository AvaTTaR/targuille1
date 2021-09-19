#!/bin/bash
echo "Please enter directory name (full path if not in the root):"
read -r Dir
if [ ! -d "$Dir" ] 
then
    echo "There is no such directory. Check it and run script again" 
    exit 1
fi
echo "Enter max file size(MB) to search:"
read -r MSize
if ! [[ $MSize =~ ^[0-9]+$ ]] ; then
   echo "Sorry - this is not a valid integer - please enter a positive integer (run script again)"
   exit 1
fi
echo "There is a list of files and subdirectories of $Dir that are bigger than $MSize MB:"
find "$Dir" -type f -size +"$MSize"M -or -type d -size +"$MSize"M 2>/dev/null