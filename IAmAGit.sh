#! /usr/bin/bash


for input in $@
do
    if [[ $input == "-a" ]] 
    then
        $(git add "*");
    elif [[ $input == "-p" ]]
    then 
        git pull;
    else
        $(git add $input)
    fi
done

read -p "Enter Comment: " comment;
git commit -m "$comment";
git push;