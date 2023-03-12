#! /usr/bin/bash

#folder="Homework";
#i=1;
#read num;
#while [[ $i -le $num ]]
#do
#    $(touch "$folder/homework$i.jpeg")
#    i=$((i+1));
#done

# Getting each file in a directory && Making them Private
folder="Homework"
directory=$(ls $folder);
for file in ${directory[@]}
do
    mv -- "$folder/$file" "$folder/.$file";
done

oldExtension=".jpeg"
newExtension=".png"

# Changing all of the file types
for file in ${directory[@]}
do #Substring Finding
    if [[ $file == *$oldExtension* ]] 
    then
        # echo "$oldExtension";
        stem="${file%%"$oldExtension"}";
        # echo $stem;
        newFile="$stem$newExtension";
        # echo $newFile;
        mv -- "$folder/$file" "$folder/$newFile"
    fi
done
ls $folder