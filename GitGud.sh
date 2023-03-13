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

pushing(){
    read -p "Enter Comment: " comment;
    git commit -m "$comment";
    git push;
}

push=0;

for input in $@
do
    # echo $input
    case $input in
        "-p") $(git pull);;
        "-b") shift 1;
            git branch $@;
            git checkout $@;;
        "-a") $(git add .);
            push=1;;
        *) $(git add $input);
            push=1; 
    esac
    shift 1;
done
