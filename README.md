# BashingMyHeadAgainstTheWall
By Sadi Nirloy 
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
You can do the 4 basic operations (+, -, *, /), but not exponents.
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
#### Working?
## Lists and Loops
You can create a list really easily using ``` () ```