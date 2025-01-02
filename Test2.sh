#!/bin/bash

USERID=$(id -u)
varcount=$#

if varcount -ne 1
then
    echo "Usage: $0 <package>"
    exit 1
else 
    for (( i=1; i<=varcount; i++ ));
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

