#! /usr/bin/bash
clear
echo "Let's start our thing!"

echo "Name our new bash script"
read fileName
file="$fileName.sh"

touch $file
echo "Created $fileName"

bin="#! $(which bash)"
echo "Added Header"
chmod u+x $file

echo "Granted Permissions"

echo "Now let's start writing"

input=""
while [[input != "done"]]; do

done


rm -rf "$fileName.sh"
echo "Removed $fileName"