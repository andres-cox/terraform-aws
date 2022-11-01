#!/bin/bash
# https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-using-volumes.html

echo "Running mount script"

# sleep until ebs is attached
sleep 100

# list block devices information 
sudo lsblk -f

# add format to block device
sudo mkfs -t xfs /dev/xvdh

# create dir to mount
sudo mkdir /data

# mounting block device to dir
sudo mount /dev/xvdh /data

# unmount for terraform destroy
# better approach https://github.com/hashicorp/terraform-provider-aws/issues/1991
# sudo umount /data