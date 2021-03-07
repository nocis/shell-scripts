#!/bin/bash
cd $HOME/.local

# 0. save root password
echo "enter the sudo password, please"
read PW
echo "\e[1;32m [root password saved successful] \e[0m"

#echo $PW | ./playback_delete_data_patch.sh 09_delete_old_data_p.sql  
#./command_wo_sudo.sh <param>
#echo $PW | ./other_command_requires_sudo.sh <param>

# 1. update
echo $PW | sudo -S apt-get update > /dev/null 2>&1
echo "\e[1;32m [pkgs update successful] \e[0m"

# 2. check if git is installed
echo $PW | sudo -S apt-get -fy install git > #/dev/null 2>&1
echo "\e[1;32m [git install successful] \e[0m"

# 4. fetch scripts from 
git clone https://github.com/nocis/shell-scripts.git > /dev/null 2>&1
cd shell-scripts
pwd > /dev/null 2>&1
ls > /dev/null 2>&1
git pull --recurse-submodules > /dev/null 2>&1
echo "\e[1;32m [clone scripts successfull] \e[0m"
cd ..

# 5. auto install packages
. ~/.local/shell-scripts/utils/install.sh
echo "\e[1;32m [pkgs install successful] \e[0m"

# append init.sh scrirt to bashrc
if grep -Fxq "init.sh" ~/.bashrc
then
    # if found
    echo "\e[1;31m init.sh is already loaded \e[0m"
else
    # if not found
    echo 'source ~/.local/shell-scripts/init/init.sh' >> ~/.bashrc 
    . ~/.local/shell-scripts/init/init.sh 
fi
echo "\e[1;32m [init.sh activate successful] \e[0m"
