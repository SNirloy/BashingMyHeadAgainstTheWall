#! /usr/bin/bash

folder="Homework";
i=1;
read num;
while [[ $i -le $num ]]
do
    $(touch "$folder/homework$i.jpeg")
    i=$((i+1));
done