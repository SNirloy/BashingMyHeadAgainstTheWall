#! /usr/bin/bash

git pull;
$(git add "*" );
read -p "Comment: " comment;
git commit -m "$comment";
git push;

