# 0. check installed
check_installed() 
{
    hash $1 > /dev/null 2>&1
    if [ "$?" != "0" ]; then
        echo -e "\e[1;31m [$1 not found] \e[0m"
        exit 1
    else
        echo -e "\e[1;32m [$1 is installed] \e[0m"
    fi
}
