#! /usr/bin/bash

# echo 'My name is GitGud';

#To be named "IAmAGit.sh"

# version 1
read -p "Enter Comment: " comment;

$(git add .);
git commit -m "$comment";
git push;