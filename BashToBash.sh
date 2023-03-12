#! /usr/bin/bash

read -p "Enter file stem: " fileName;
file="$fileName.sh"
touch "$file";

var="$(which bash)"
# -e for the newline
echo -e "#! $var\n" >> $file;

chmod u+x $file;

echo -e "echo "My name is $fileName;"\n" >> $file
./$file