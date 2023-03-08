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
    # Note that some syntax only exists within specific contexts
while [[ $input != "done" ]]
do
    echo "What do you want to make?"
    read input
    case $read in
        variable) echo "varying";;
    esac
done


rm -rf "$fileName.sh"
echo "Removed $fileName"