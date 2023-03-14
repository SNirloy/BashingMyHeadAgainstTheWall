#! /usr/bin/bash

var=$(which bash);

read -p "What file do you want to make? " fileName;
file="$fileName.sh"
touch "$file";

var="$(which bash)"
# -e for the newline

echo -e "#! $var\n" >> $file;

chmod u+x $file;
code $file;