#! /usr/bin/bash

while getopts a: OPTION
do 
    case "${OPTION}" in
        a) echo ${OPTARG} ;;
    esac
done

i=1;
for user in "$@" 
do
    echo "$i: $user";
    i=$((i + 1));
done


for input in "$@"
do 
    echo "$input";
    shift 1;
done