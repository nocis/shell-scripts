#!/bin/bash
cd $HOME

# 0. save root password
echo "enter the sudo password, please"
read PW
echo -e "\e[1;32m [root password saved successful] \e[0m"

#echo $PW | ./playback_delete_data_patch.sh 09_delete_old_data_p.sql  
#./command_wo_sudo.sh <param>
#echo $PW | ./other_command_requires_sudo.sh <param>

# 1. update
echo $PW | sudo -S apt-get update
echo -e "\e[1;32m [pkgs update successful] \e[0m"

# 2. check if git is installed
echo $PW | sudo -S apt-get -fy install git
echo -e "\e[1;32m [git install successful] \e[0m"

# 4. fetch scripts from 
git clone https://github.com/nocis/shell-scripts.git
git pull --recurse-submodules
echo -e "\e[1;32m [clone scripts successfull] \e[0m"

# 5. auto install packages
echo $PW | yes | ~/.local/shell-scripts/utils/install.sh
echo -e "\e[1;32m [pkgs install successful] \e[0m"

# append init.sh scrirt to bashrc
if grep -Fxq "init.sh" ~/.bashrc
then
    # if found
    echo "init.sh is already loaded"
else
    # if not found
    echo 'source ~/.local/shell-scripts/init/init.sh' >> ~/.bashrc 
    source ~/.local/shell-scripts/init/init.sh
fi
echo -e "\e[1;32m [init.sh activate successful] \e[0m"
