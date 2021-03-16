#!/bin/bash

# git update-index --chmod=+x : give permission
# use . or source execute shell scripts in current shell
#. ~/.local/shell-scripts/scripts/webapp/blogsetup.sh

# 0. includes
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
source $parent_path/../../utils/functions.sh

# 1. check conda env
check_installed conda

mb=$(conda info --envs | grep -ow "myblog" | wc -l)     
if [ "$mb" != "2" ]; then
    conda create -yn myblog nodejs > /dev/null 2>&1
fi
eval "$(conda shell.bash hook)"
conda activate myblog

cd ~
# git myblog
cd ~/myblog


# 2. install prerequisites
check_installed yarn
npm i -g yarn > /dev/null 2>&1
npm install > /dev/null 2>&1
echo -e "\e[1;32m [myblog is initialized] \e[0m"
