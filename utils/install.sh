# 0. get arguments(does not require when using source)
# 1. install c++ build essential
echo $PW | sudo -kS apt-get -fy install build-essential > /dev/null 2>&1
echo "\e[1;33m --[c++ build essential installed] \e[0m"

#check gcc
#sudo update-alternatives --config gcc
#g++ --version

# 2. install OGL
echo $PW | sudo -kS apt-get -fy install cmake libx11-dev xorg-dev libglu1-mesa-dev freeglut3-dev libglew1.5 libglew1.5-dev libglu1-mesa libglu1-mesa-dev libgl1-mesa-glx libgl1-mesa-dev > /dev/null 2>&1
echo "\e[1;33m --[OGL libs installed] \e[0m"

# 2. install open-vm-tools
echo $PW | sudo -kS apt-get -fy install open-vm-tools open-vm-tools-desktop > /dev/null 2>&1
echo "\e[1;33m --[open-vm-tools installed] \e[0m"

# 3. install Qt pre-requisites
echo $PW | sudo -kS apt-get -fy install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6 > /dev/null 2>&1
echo "\e[1;33m --[Qt pre-requisites installed] \e[0m"

# 4. install CLion
read -p "Do you want to install CLion（snap required）? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo $PW | sudo -kS snap install clion --classic
    echo "\e[1;33m --[CLion installed] \e[0m"
else
    echo "\e[1;31m --[CLion not installed] \e[0m"
fi

# 5. install vscode
read -p "Do you want to install vscode（snap required）? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo $PW | sudo -kS snap install --classic code
    echo "\e[1;33m --[vscode installed] \e[0m"
else
    echo "\e[1;31m --[vscode not installed] \e[0m"
fi

# 6. install cmake
read -p "Do you want to install cmake（snap required）? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo $PW | sudo -kS snap install cmake --classic
    echo "\e[1;33m --[cmake installed] \e[0m"
else
    echo "\e[1;31m --[cmake not installed] \e[0m"
fi
