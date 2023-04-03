# BashingMyHeadAgainstTheWall
By Sadi Nirloy 
## Code From Presentation
```
#! /usr/bin/bash

read -p "Enter file stem: " fileName;
file="$fileName.sh"
touch "$file";

var="$(which bash)"
# -e for the newline
echo -e "#! $var\n" >> $file;

chmod u+x $file;

echo -e "echo 'My name is $fileName';\n" >> $file
./$file
code $file
```
```
#! /usr/bin/bash
pushing(){
    read -p "Enter Comment: " comment;
    git commit -m "$comment";
    git push;
}

push=0;

i=1;
while [[ $i -le $# ]]
do
    plus=1;
    case $1 in
        "-p") 
            git pull;;
        "-b")
            plus=2;
            git branch $2;
            git checkout $2;;
        "-m")
            plus=2;
            git checkout $2;
            git pull origin main;
            git merge --no-ff main && git checkout main;
            git merge --no-ff $2;;
        "-a") 
            $(git add .);
            push=1;;
        *) 
            $(git add $1);
            push=1;;
    esac
    i=$(($i + $plus));
    shift $plus;
done
if [[ $push -gt 0 ]] 
then 
    pushing;
fi 
```
## What is Shell and Scripting
The shell is a program that allows the user to interact with the operating system (OS). The operating system is the level of software that interacts directly with the hardware. The shell can be programmed using a specific language based on the OS. Bourne Again Shell (Bash) is the shell scripting language of POSIX Systems, like Ubuntu and Linux. It even has implementations for MacOS and Windows. However, it is not the only scripting language out there. Bash is the sucessor of Bourne Shell, and incorporates parts of C Shell and Korn Shell. The latest Macs also use tcsh as their primary scripting language, with bash as a secondary.
## Starting Out With Bash
To create a bash file/script, we first need a .sh file.
``` 
touch File.sh 
```
Inside the .sh file, we'll need a shebang in order to tell the computer how to run the bash script:
``` 
which bash 
```
The above command in the terminal will tell you what to put inside the shebang. It should represent where bash is stored in your file system.
The actual shebang:
``` 
#! <which bash ouptut> 
```
Now we can add a command to test the shell script:
``` 
echo "Ayyy, what up, globe?" 
```
File.sh should look like this:
```
#! <which bash output>

echo "Ayyy, what up, globe?" 
```
Now, we can run the shell:
```
./File.sh
```
Haha, just joking. You can't just do that. Imagine if anyone could just write a bash script on a computer and run it. It would spell the end of every company. You need to do the following (make sure you have the permissions to do so)
```
chmod u+x File.sh
```
Check that this worked using : ``` ll ```. It should have an x next to the shell script. 
Now, run the file:
```
./File.sh
    <OR>
bash ./File.sh
```
You should see the string you echoed. 
HOORAYYY!!!
## Variables
Different to my normal presentation, I'll be organizing this one pager on concepts. Bash has variables to store values.
```
var=Value;
```
Note the lack of spaces. This is very important to the syntax of bash. In other languages, like Python or Java, there are optional spaces in assignments. Here, no spaces are allowed. The ending semicolon is optional, but highly recommended.
It is important to note that all values are strings.
```
var=5 #This is "5", not 5. Even without adding the quotation marks.
var1=var #This is the word "var", not referring to the variable var. 
```
In order to convert these strings into actual values, bash has something called String Expansions. Now, there are a LOT of them, and I don't even know about all of them. But, here are some of the more common ones.
### Variable Expansion
To replace a word with a variable of that name by putting that string in ```$```. This does not convert a number string into the actual number.
```
var="Hi there, neighbor";
message=$var; # The expansion turns message into "Hi there, neighbor"

echo $message; #Note how the variable expansion needs to be used in commands as well
```
The upside to the all string world of bash is that building strings with variables, and other expansions, becomes much easier.
```
person="Elaine Johnson";
greeting="What up";
speech="$greeting, $person."; #The comma is actually part of the string, and does not mess with the variable expansion, nor the period.

echo $speech; # "What up, Elaine Johnson."
```
### Command Expansion
Just as commands can be used as lines in bash, you can store the standard output of that command in variables using ```$()```
```
var=$(which bash); # "/usr/bin/bash" for Ubuntu
var1=$(fortune);
var2=$(ll);
```
### Arithmetic Expansion
Applying math to number strings with ```$(())```.
```
varA=9;
varB=10;

varA=$(( $varA + 2 ));
echo $(( $varA + $varB ));
```
You can do the 5 basic operations (+, -, *, /, %), but not exponents.
Please note, there are plenty of other ways to do math. One I just saw is piping into "bc" if that is on your system.
```
echo  "9+10" | bc;
```
Piping to be discussed later.
### Variables from Read
By using the ``` read ``` command, you can create and/or set a variable to an input from the user from mid-program. This will cause the program to pause until an input is given, and excludes the newline at the end.
```
read var;
read -p "String" var1; # Using the -p flag on read allows for a prompt to be printed before asking for input
```
## Conditionals
### Boolean Statements
A boolean statement can be created by ```[[]]```
This creates a new context, where you get access to special syntax that allows for comparisons.
### Boolean Operators
#### Equal
``` == ```: if the two strings are equal to each other. Other expansions will apply. 
```
var="5";
var1="3";
var2="2";
[[ 5 == $var ]] # True
[[ 1 == one ]] # False
[[ 1 == $(( $var1 - $var2 )) ]] # True
```
#### Not Equal
``` != ```: if two strings are not equal. The opposite of equal.
```
var="Hello";
var1="There";
[[ "Hello, There" != "$var, $var1" ]] # False because they match
[[ "hello, there" != "$var, $var1" ]] # True because they don't match on account of cases
```
#### Comparison Operators
``` -lt ```: if the first operand is **less than** the second
``` -gt ```: if the first operand is **greater than** the second
``` -lte ```: if the first operand is **less than or equal** the second
``` -gte ```: if the first operand is **greater than or equal** the second
These evaluate strings as numbers. If the strings are not numbers, the program will error out. 
```
var0=0
var1=1
var2=0

[[ $var0 -lt $var1 ]] # True 0 < 1
[[ $var0 -lt $var2 ]] # False 0 < 0
[[ $var2 -gt $var1 ]] # False 0 > 1
[[ $var1 -gt $var0 ]] # True 1 > 0
[[ $var0 -lte $var2 ]] # True 0 <= 0
[[ $var1 -gte $var2 ]] # True 1 >= 0
```
#### String Length
```${#word}```: get the number of characters in the word (This is something called a parameter expansion, but those are REALLY numerous, and so not right now. This can exist outside of a conditional, but this is common in conditionals, so here it is.)
Converts the word into a variable automatically.
```
var="qwerty";
var1="qwertyuiopasdfghjklzxcvbnm";
echo ${#var}; # 6
[[ ${#var1} -lt 12 ]] # False 26 < 12
```
#### Boolean Operators
These are operations used in the conditional context to connect boolean statements.
``` && ```: AND : is true if both statements are true
``` || ```: OR : is true if at least one statement is true
```
[[ true && true ]] # True
[[ false && true ]] # False 
[[ false && false ]] # False
[[ true || true ]] # True
[[ true || false ]] # True 
[[ false || false ]] # False
```
Outside of the conditional context, these operators have a different meaning. 
```
command0 && command1 # The second command only runs if the first one is successful (exit status of 0)
command0 || command1 # The second command runs if and only if the first command returns a non-zero status
```
### If Statements
```if```: runs the associated code when the given conditional is true
```then```: designates code to the conditional
```elif```: if the previous conditional in the block returned false, this statement's conditional test is ran. You can chain as many elifs as you want, and elifs are optional in the first place.
```else```: if all previous conditionals in the block were false, this statement's code is run. Not necessary for all conditional blocks.
```fi```: closes out a conditional chain. Always needed.
Tabbing is **VITAL** for the conditional code.
```
# Scaffold
if [[ conditional ]]
then 
    # code
elif [[ conditional ]]
then 
    # code
else
    # code
fi
```
Example
```
read -p "What do you want to say?" message;
len=${#message};
if [[ len -lte 10 ]]
then
    echo "Short Message"
elif [[ len - lte 25 ]]
then 
    echo "Medium Message"
else
    echo "Long Message"
fi
```
### Cases
This is a quick way of typing out a set of conditionals to test if a variable has a value using the ```case``` and ```in``` keywords. Just as ```if``` has ```fi``` to close out the block, ```case``` has ```esac```.
```
case $var in
    val1)
        code ;; # This double semicolon denotes the end of the code for the condition
    val2)
        code;
        more_code;;
    *) # This asterisk denotes a default case, since all non-empty values satisfy this condition
        default_code;;
```
## Loops
This is how to repeat some steps of code without having to retype it. 
### While Loops
To repeat code until a specific condition is satisfied. Useful for when you do not know how many times you need to run the code, and repeating code a number of times.
```while```: to denote the condition of the loop. As long as the condition is true, the code will continue to run.
```do```: to designate the start of the code that belongs to the loop
```done```: to designate the end of the code of the loop
```
while [[ condition ]]
do 
    #code
done
```
Example:
```
read int
while [[ ${#int} -lt 32 ]]
do 
    int="$0int"
done

echo $int
```

### For Loops
Unlike most other languages, for loops aren't used for numbers. Rather, all for loops are like enhanced for loops, and specialize in easily looping through lists of values and using them. If you are confused, please look at the Lists section.
Uses ```for```, ```in```, ```do```, ```done```.
```
for var in $list
do
    # code
done
```
## Lists 
You can create a list really easily using ``` () ```.
```
list=("Hello" "There" "I Am" "Thou");
```
### Length of a List 
```${#list[@]}``` is used to find the length of a list. 
### Looping through Lists
#### Indexing
Normally, a value of a list can be accessed via a number, starting at 0. This is done with ```${list[]}```
```
list=("Hello" "There" "I Am" "Thou");

echo ${list[0]}; # "Hello"
echo ${list[1]}; # "There"
```
```@``` is used to represent all of the indices of the list. This is used in for loops so you needn't specify the length of a list. 
```
list=("Hello" "There" "I Am" "Thou");
for var in ${list[@]}
do
    echo $var
done
```
The above loop is an enhanced for loop, where each var represents the string in the list, where position is not really noted.
```${!list[@]}``` can be used in order to loop through the numerical indices of the list.
```
list=("Hello" "There" "I Am" "Thou");
for var in ${!list[@]}
do
    echo "$var: ${list[$var]}";
done
```
#### Shifting
You can also loop through a list using the ```shift``` keyword. What this does is it basically decreases all of the indices of the list by the number given, changing the values at each index. It also decreases the length of the list. 
```
# Looping through all vals
while [[ ${#list[@]} -gt 0 ]]
do
    echo ${#list[0]};
    shift 1;
done

# Looping through all even indexed vals
while [[ ${#list[@]} -gte 1 ]]
do
    echo ${#list[0]};
    shift 2;
done

# Looping through all odd indexed vals
while [[ ${#list[@]} -gte 2 ]]
do
    echo ${#list[1]};
    shift 2;
done
```
### Loops as an expansion in strings
Just as you can put in variables and commands into your strings, you can do the same with list literals via ```{}```. What will happen is that the string will be formed for each string at each index of list given. I **assume** that list variables can be used as well via ```${}```.
```
echo "Number: {0, 1, 2, 3, 4}{0, 1, 2, 3, 4}"; # This will print out 16 strings.
```
## Functions
Functions can be easily created with ```(){}```. These are used to group bunches of code for easy reusability in various spots throughout the code. 
```
foo(){
    #code
}
```
Then the function can be run as ```foo;```, like a terminal command.
## Command Line Arguments (and Function Arguments)
These are given when the bash file is run. Like so:
```./File.sh arg1 arg2 arg3```
These values are usable with in the code. 
### Indexing
These arguments can be accessed with ```$num```.
```
# Using the above call
echo $1; # arg1
echo $2; #arg2
```
Note the intentional start at 1. $0 is always the name of the function/file being called. ALWAYS.
#### For Looping
```$@``` substitutes ```${list[@]}``` for a normal list. 
```$#``` is for the number of arguments excluding $0. 
```
for arg in $@
do 
    echo $arg
done
```
#### Shifting with Args
You can loop through the args with shift, which is helpful if you need to jump arguments. However, note that $0 will always be the function name, even after shifting.
```
for arg in $@
do
    echo $1;
    echo $0;
    shift 1;
done
```
## Bonus, but Unexplained Code
```
#! /usr/bin/bash

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
```