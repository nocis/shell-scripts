# 0. get arguments(does not require when using source)
# 1. install c++ build essential
echo $PW | sudo -kS apt-get -fy install build-essential pkg-config fakeroot python3-dev libpng-dev libjpeg-dev libtiff-dev zlib1g-dev libssl-dev libx11-dev libgl1-mesa-dev libxrandr-dev libxxf86dga-dev libxcursor-dev bison flex libfreetype6-dev libvorbis-dev libeigen3-dev libopenal-dev libode-dev libbullet-dev nvidia-cg-toolkit libgtk2.0-dev libassimp-dev libopenexr-dev > /dev/null 2>&1
echo -e "\e[1;33m --[c++ build essential installed] \e[0m"

# 2. install CV pre-requisites essential
echo $PW | sudo -kS apt-get -fy install libsquish-dev libcv-dev > /dev/null 2>&1
echo -e "\e[1;33m --[CV pre-requisites installed] \e[0m"

# 3. install ffmpeg
echo $PW | sudo -kS apt-get -fy install libavutil-dev libavcodec-dev libavformat-dev libopenexr-dev libav-tools libavcodec-extra-56 ffmpeg > /dev/null 2>&1
echo -e "\e[1;33m --[FFMPEG installed] \e[0m"

# 4. install openexr
echo $PW | sudo -kS apt-get -fy install fftw-dev libjpeg62-dev openexr > /dev/null 2>&1
echo -e "\e[1;33m --[OpenExr installed] \e[0m"

#check gcc
#sudo update-alternatives --config gcc
#g++ --version

# 5. install OGL and eigen3
echo $PW | sudo -kS apt-get -fy install cmake libx11-dev xorg-dev libglu1-mesa-dev freeglut3-dev libglew1.5 libglew1.5-dev libglu1-mesa libglu1-mesa-dev libgl1-mesa-glx libgl1-mesa-dev libeigen3-dev > /dev/null 2>&1
echo -e "\e[1;33m --[OGL libs installed] \e[0m"

# 6. install open-vm-tools(not required for 20.04)
# echo $PW | sudo -kS apt-get -fy install open-vm-tools open-vm-tools-desktop > /dev/null 2>&1
# echo -e "\e[1;33m --[open-vm-tools installed] \e[0m"

# 7. install Qt pre-requisites
echo $PW | sudo -kS apt-get -fy install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6 > /dev/null 2>&1
echo -e "\e[1;33m --[Qt pre-requisites installed] \e[0m"

# 8. install CLion
read -p "Do you want to install CLion（snap required）? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo $PW | sudo -kS snap install clion --classic  > /dev/null 2>&1
    echo -e "\e[1;33m --[CLion installed] \e[0m"
else
    echo -e "\e[1;31m --[CLion not installed] \e[0m"
fi

# 9. install vscode
read -p "Do you want to install vscode（snap required）? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo $PW | sudo -kS snap install --classic code  > /dev/null 2>&1
    echo -e "\e[1;33m --[vscode installed] \e[0m"
else
    echo -e "\e[1;31m --[vscode not installed] \e[0m"
fi

# 10. install cmake
read -p "Do you want to install cmake（snap required）? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo $PW | sudo -kS snap install cmake --classic  > /dev/null 2>&1
    echo -e "\e[1;33m --[cmake installed] \e[0m"
else
    echo -e "\e[1;31m --[cmake not installed] \e[0m"
fi

# 11. install gitkraken
read -p "Do you want to install gitkraken（snap required）? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo $PW | sudo -kS snap install gitkraken --classic  > /dev/null 2>&1
    echo -e "\e[1;33m --[gitkraken installed] \e[0m"
else
    echo -e "\e[1;31m --[gitkraken not installed] \e[0m"
fi

# 12. install emacs
read -p "Do you want to install emacs? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo $PW | sudo -kS snap install emacs --classic  > /dev/null 2>&1
    echo -e "\e[1;33m --[emacs installed] \e[0m"
else
    echo -e "\e[1;31m --[emacs not installed] \e[0m"
fi

# 13. install TMUX
read -p "Do you want to install tmux? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo $PW | sudo -kS snap install tmux --classic  > /dev/null 2>&1
    echo 'export TERM=xterm' >> $HOME/.bashrc 
    source $HOME/.bashrc
    echo -e "\e[1;33m --[tmux installed] \e[0m"
else
    echo -e "\e[1;31m --[tmux not installed] \e[0m"
fi

# 14. install miniconda
read -p "Do you want to install miniconda? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    hash conda > /dev/null 2>&1
    if [ "$?" != "0" ]; then
        echo -e "\e[1;31m [miniconda not found, install start] \e[0m"
        # echo $PW | mkdir -p $HOME/anaconda3  > /dev/null 2>&1
        wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -P $HOME/tmp/miniconda3
        bash $HOME/tmp/miniconda3/Miniconda3-latest-Linux-x86_64.sh -b
        rm $HOME/tmp/miniconda3/Miniconda3-latest-Linux-x86_64.sh
        echo 'export PATH="$HOME/miniconda3/bin:$PATH"' >> $HOME/.bashrc 
        # Reload default profile
        source $HOME/.bashrc
        conda init
        echo -e "\e[1;33m --[miniconda installed] \e[0m"
    else
        echo -e "\e[1;32m [miniconda is installed] \e[0m"
    fi
else
    echo -e "\e[1;31m --[miniconda not installed] \e[0m"
fi
 