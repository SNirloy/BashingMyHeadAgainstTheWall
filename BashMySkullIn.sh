#! /usr/bin/bash

read -p "What to call the file? " fileName;
file="$fileName.sh";

touch $file;
chmod u+x $file;

var=$(which bash);
echo -e "#! $var\n" >> $file;

code $file;