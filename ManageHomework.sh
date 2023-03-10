#! /usr/bin/bash

# echo 'My name is ManageHomework';
folder="";
fileStem="homework";
case $1 in
    "setup") 
        read -p "What folder?       " folder;
        mkdir $folder;
        i=1;
        read -p "How much homework?     " num;
        while [[ $i -le $num ]]
        do
            touch $folder/$fileStem$i.txt;
            i=$(($i + 1));
        done
        touch $folder/{q,w,e,r,t,y,u,i,o,p,a,s,d,f,g,h,j,k,l,z,x,c,v,b,n,m}{q,w,e,r,t,y,u,i,o,p,a,s,d,f,g,h,j,k,l,z,x,c,v,b,n,m}.jpeg;;
    "hide") # Getting each filetype in a directory && Making them Private
        read -p "What filetype to hide?     " fileType;
        read -p "From where?    " folder;
        directory=$(ls $folder); #note the list
        fileType=.$fileType;
        for file in ${directory[@]} #note the for each loop with an array;
        do
            if [[ $file == *$fileType* ]] #note the finding of substring
            then
                mv -- "$folder/$file" "$folder/.$file";
            fi
        done
        ;;
    "replace")
        read -p "From where?    " folder;
        read -p "What filetype to replace?     " oldFileType;
        read -p "What filetype to replace with?     " newFileType;
        directory=$(ls -a $folder);
        for file in ${directory[@]}
        do
            if [[ $file == *$oldFileType* ]]
            then
                stem="${file%%"$oldFileType"}"; #Removal of substring from the back
                newFile="$stem$newFileType";
                mv -- "$folder/$file" "$folder/$newFile";
            fi
        done
        ;;
    "new")
        read -p "From where?       " folder;
        read -p "What files?    " fileStem;
        directory=$(ls -a $folder | grep "$fileStem"); # Note the piping into Grep
        count=0;
        for file in ${directory[@]}
        do
            part="${file##"$fileStem"}"; #removal of substring from the fron
            num="${part%%.***}";
                # echo $num;
            if [[ $num -ge $count ]]
            then
                count=$num;
            fi
        done
        count=$(($count + 1));
        echo $folder/$fileStem$count.txt;
        touch $folder/$fileStem$count.txt;;
esac





# Changing all of the file types
#for file in ${directory[@]}
#do #Substring Finding
#    if [[ $file == *$oldExtension* ]]
#    then
#        # echo "$oldExtension";
#        stem="${file%%"$oldExtension"}";
#        # echo $stem;
#        newFile="$stem$newExtension";
        # echo $newFile;
#        mv -- "$folder/$file" "$folder/$newFile"
#    fi
#done
#ls $folder

#Next homework  file
#fileStem="homework";
#echo $directory;
#for file in ${directory[@]}
#do
#    echo $file;
#done
