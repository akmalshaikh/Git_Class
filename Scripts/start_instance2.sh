#!/bin/bash

instances=$(aws ec2 describe-instances --region ap-south-1 | egrep -i instanceid | cut -d '"' -f 4)
current_date=$(date +"%Y-%m-%d %H:%M:%S")

for instance in $instances
do
  aws ec2 start-instances --instance-ids $instance
  echo "$current_date - $instance" >> /home/akmal/awscli/started_instances.txt
done



