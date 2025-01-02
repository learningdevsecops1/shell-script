#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "User is not root , running the scrrpt with sudo"
    sudo su -c "cd /home/ec2-user/shell-script/"
    cd /home/ec2-user/shell-script/
fi

if [ $USERID -ne 0 ]
then 
    dnf install mysql -y
    if [ $? -ne 0 ]
    then
        echo "Installing MySQL ... FAILURE"
        exit 1
    else
        echo "Installing MySQL ... SUCCESS"
    fi
else
    echo "MySQL is already ... INSTALLED"
fi
exit 0