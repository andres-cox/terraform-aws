#!/bin/bash

# install efs utils
sudo yum install -y amazon-efs-utils

# create dir to mount
sudo mkdir /home/ec2-user/efs

# Log efs id
#echo "${efs_id}" > /home/ec2-user/log.txt

# added depends_on in tf instance resource
# to get successfully mount command working
# attach efs
sudo mount -t efs -o tls ${efs_id}:/ /home/ec2-user/efs