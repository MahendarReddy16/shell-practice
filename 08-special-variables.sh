#!/bin/bash

#Special Variables in shell scripts

echo "All the args passed to the script: $@"
echo "Number of varibales/args passed to the script: $#"
echo "To see the script name under terminal: $0"
echo "To see cureent users home directory: $HOME"
echo "Current/Present Working Directory: $PWD"
echo "PID(process ID) of the current executing script: $$"
echo "who is running the script: $USER"
echo "PID of last background commond of the script: $!"
sleep 100 &
echo "All args passed to script: $*"
echo "To view exit status of the last command whether executed successfully: $?"
echo "Last argument of previous command: $_"
echo "Arguments can be passed from $1 to $9"


#Arguments Handling Variables
echo "All the args passed to the script: $@"
echo "Number of varibales/args passed to the script: $#"
echo "To see the script name under terminal: $0"
echo "All args passed to script: $*"
echo "Arguments can be passed from one to Nine: $1 to $9"
echo " Tenth argument and above: ${10}"

#PROCESS Handling Variables
echo "PID(process ID) of the current executing script: $$"
echo "PID of last background commond of the script: $!"
echo "To view exit status of the last command whether executed successfully: $?"
echo "Last argument of previous command: $_"

#### Shell Status Variables
echo "Current shell Options: $-"
echo "Current line number in script: $LINENO"
echo "Name of the current function: $FUNCNAME"
echo "Number of seconds script has been running: $SECONDS"
echo "Generates random number: $RANDOM"
echo "Parent process ID: $PPID"
echo "User ID of current user: $UID"
echo "Effective user ID: $EUID"
echo "Current/Present Working Directory: $PWD"
echo "Previous Working Directory: $OLDPWD"
echo "Shell level indicates no. of nested shells currently running: $SHLVL"


#Script Execution Variables
echo "Path of Bash shell: $BASH"
echo "Version of Bash: $BASH_VERSION"
echo "Script filename: $BASH_SOURCE"
echo "Command currently executing: $BASH_COMMAND"
echo "System hostname: $HOSTNAME"
echo "System architecture type: $HOSTTYPE"
echo "Operating system type: $OSTYPE"
echo "User home directory:$HOME"
echo "Command search path: $PATH"