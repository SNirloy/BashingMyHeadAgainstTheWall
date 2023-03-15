#! /usr/bin/bash

# echo 'My name is GitGud';

#To be named "IAmAGit.sh"

# version 1

#show off the for loop
for input in $@
do
    echo input;
done

for input in $@
do
    if [[ $input == "-a" ]]
    then 
        $(git add .);
    elif [[ $input == "-p" ]]
    then 
        $(git pull);
    else 
        $(git add $input);
    fi
done
read -p "Enter Comment: " comment;
git commit -m "$comment";
git push;

# version 2

#Show 
$1 and stuff 

# This won't work so, we must introduce the shift;
i=1;
while [[ $i -le $# ]]
do
    echo $"$i";
    i=$(($i + 1));
done

i=1;
while [[ $i -le $# ]]
do
    echo $1;
    shift 1;
done

pushing(){
    read -p "Enter Comment: " comment;
    git commit -m "$comment";
    git push;
}

push=0;

i=1;
while [[ $i -le $# ]]
do
    plus=1;
    case $1 in
        "-p") 
            git pull;;
        "-b")
            plus=2;
            git branch $2;
            git checkout $2;;
        "-m")
            plus=2;
            git checkout $2;
            git pull origin main;
            git merge --no-ff main && git checkout main;
            git merge --no-ff $2;;
        "-a") 
            $(git add .);
            push=1;;
        *) 
            $(git add $1);
            push=1;;
    esac
    i=$(($i + $plus));
    shift $plus;
done
if [[ $push -gt 0 ]] 
then 
    pushing;
fi 