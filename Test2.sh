#!/bin/bash

USERID=$(id -u)
varcount=$#

if [ $varcount -eq 0 ]
then
    echo "Usage: $0 <package>"
    exit 1
else 
    echo "Script started executing at: $(date)"
    echo "Total number of packages to install: $#"
    for i in "$@"
    do
        if [ $USERID -ne 0 ]
        then
            echo "User is not root , running the script with sudo"
            sudo su -c "cd /home/ec2-user/shell-script/ && dnf install $i -y"
            if [ $? -ne 0 ]
            then
                echo "Installing $i ... FAILURE"
                exit 1
            else
                echo "Installing $i ... SUCCESS"
                cd /home/ec2-user/shell-script/
            fi
        else
            echo "User is root, skipping $i installation"
fi
exit 0
done
fi

