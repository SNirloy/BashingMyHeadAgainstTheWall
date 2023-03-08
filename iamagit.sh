#! /usr/bin/bash

git pull
git add *

echo "Type your Comment"
read comment
echo $comment
git commit -m "\"$comment\""
git push