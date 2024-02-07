#!/bin/bash

<< Description

Using this script we can add user.

Description


read -p "Enter username to create a user ===>>  "   user


sudo useradd $user
sleep 3
echo "New user added with username $user "
sleep 5
echo "Below are the username's which is available in passwd file "
echo ""
sleep 4
awk -F':' '$3 >= 1000 { print $1 }' /etc/passwd

