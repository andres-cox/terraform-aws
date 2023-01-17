#!/bin/bash

# install efs utils
sudo yum install -y amazon-efs-utils

# create dir to mount
sudo mkdir /home/ec2-user/efs

# Log efs id
#echo "${efs_id}" > /home/ec2-user/log.txt

# Waiting for EFS resources 
# without this time is not working (didn't test with less time)
# Might need other EFS dependencies?
sleep 90

# attach efs
sudo mount -t efs -o tls ${efs_id}:/ /home/ec2-user/efs