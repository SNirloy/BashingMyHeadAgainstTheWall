# BashingMyHeadAgainstTheWall
By Sadi Nirloy 
## Starting Out With Bash
To create a bash file/script, we first need a .sh file.
``` touch File.sh ```
Inside the .sh file, we'll need a shebang in order to tell the computer how to run the bash script:
``` which bash ```
The above command in the terminal will tell you what to put inside the shebang. It should represent where bash is stored in your file system.
The actual shebang:
``` #! <which bash ouptut> ```
Now we can add a command to test the shell script:
``` echo "Ayyy, what up, globe?" ```
The whole script should look like this:
```
!# <which bash output>

echo "Ayyy, what up, globe?" 
```