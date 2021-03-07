# 0. get arguments(does not require when using source)
# 1. install c++ build essential
echo $PW | sudo -kS apt-get -fy install build-essential > /dev/null 2>&1
echo "\e[1;33m -[c++ build essential installed] \e[0m"

#check gcc
#sudo update-alternatives --config gcc
#g++ --version

# 2. install OGL
echo $PW | sudo -kS apt-get -fy install cmake libx11-dev xorg-dev libglu1-mesa-dev freeglut3-dev libglew1.5 libglew1.5-dev libglu1-mesa libglu1-mesa-dev libgl1-mesa-glx libgl1-mesa-dev > /dev/null 2>&1
echo "\e[1;33m -[OGL libs installed] \e[0m"

# 2. install open-vm-tools
echo $PW | sudo -kS apt-get -fy install open-vm-tools-desktop > /dev/null 2>&1
echo "\e[1;33m -[open-vm-tools installed] \e[0m"
