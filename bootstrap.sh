#!/bin/bash
cd $HOME

# 0. save root password
echo "enter the sudo password, please"
read PW

#echo $PW | ./playback_delete_data_patch.sh 09_delete_old_data_p.sql  
#./command_wo_sudo.sh <param>
#echo $PW | ./other_command_requires_sudo.sh <param>

# 1. update
echo $PW | sudo apt-get update

# 2. check if git is installed
echo $PW | yes | sudo apt-get -f install git

# 4. fetch scripts from 
git clone https://github.com/nocis/shell-scripts.git
git pull --recurse-submodules

# 5. auto install packages
echo $PW | yes | ~/.local/shell-scripts/install.sh

# append init.sh scrirt to bashrc
if grep -Fxq "init.sh" ~/.bashrc
then
    # if found
    echo "init.sh is already loaded"
else
    # if not found
    echo 'source ~/.local/shell-scripts/init.sh' >> ~/.bashrc 
    source ~/.local/shell-scripts/init.sh
fi
