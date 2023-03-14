#! /usr/bin/bash

git pull;
git add .;
read -p "Enter Comment: " comment;
git commit -m "$comment";
git push;