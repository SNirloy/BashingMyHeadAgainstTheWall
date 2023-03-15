#! /usr/bin/bash

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