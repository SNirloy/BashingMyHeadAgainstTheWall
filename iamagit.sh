#! /usr/bin/bash

while getopts a: flag
do 
    case "${flag}" in
        a) echo ${OPTARG} ;;
    esac
done

i=1;
for user in "$@" 
do
    echo "$i: $user";
    i=$((i + 1));
done