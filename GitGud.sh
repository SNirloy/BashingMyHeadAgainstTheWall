#! /usr/bin/bash

# echo 'My name is GitGud';

#To be named "IAmAGit.sh"

# version 1
# read -p "Enter Comment: " comment;

# git pull;
# git add .;
# git commit -m "$comment";
# git push;

# version 2
# for input in $@
# do
    # echo $input
    # if [[ $input == "-p" ]]
    # then 
        # $(git pull);
    # elif [[ $input == "-a" ]]
    # then 
        # $(git add .);
    # else 
        # $(git add $input);
    # fi
    # shift 1;
# done
# read -p "Enter Comment: " comment;
# git commit -m "$comment";
# git push;

# version 3

for input in $@
do
    # echo $input
    if [[ $input == "-p" ]]
    then 
        $(git pull);
    elif [[ $input == "-b" ]]
    then 
        shift 1;
        echo $@;
        continue;
    elif [[ $input == "-a" ]]
    then 
        $(git add .);
    else 
        $(git add $input);
    fi
    shift 1;
done
read -p "Enter Comment: " comment;
git commit -m "$comment";
git push;