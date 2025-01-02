#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "User is not root , running the script with sudo"
    sudo su -c "cd /home/ec2-user/shell-script/ && dnf install mysql -y"
    if [ $? -ne 0 ]
    then
        echo "Installing MySQL ... FAILURE"
        exit 1
    else
        echo "Installing MySQL ... SUCCESS"
        cd /home/ec2-user/shell-script/
    fi
else
    echo "User is root, skipping MySQL installation"
fi

exit 0
