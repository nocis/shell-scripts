# 0. check installed
check_installed() 
{
    hash $1 > /dev/null 2>&1
    if [ "$?" != "0" ]; then
    print "command $1 is not found."
    exit 1
    fi
}
