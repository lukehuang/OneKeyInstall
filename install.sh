#!/bin/bash
####################################
#
# Install some tools
#
####################################

####################################
# generate
# replace kernal to linux-image-4.4.0-47-generic
###################################

dpkg --configure -a
apt-get update

sudo apt install linux-image-4.4.0-47-generic -y
kernel=`dpkg -l|grep linux-image|awk '{if($2!="linux-image-4.4.0-47-generic"){print $2}}'`
echo $kernel
`sudo apt purge $kernel -y`

sudo apt-mark hold linux-image-4.4.0-47-generic

wget install_ssr.sh https://github.com/blackfe/OneKeyInstall/blob/master/install_ssr.sh && chmod +x install_ssr.sh

echo "sh /root/install_ssr.sh" >> /root/.profile

sudo update-grub && reboot
exit 1;
