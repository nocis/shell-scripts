# Thanks for skywind3000's scripts
# https://zhuanlan.zhihu.com/p/50080614

# init.sh
# load check
if [ -z "$_INIT_SH_LOADED" ]; then
    _INIT_SH_LOADED=1
else
    return
fi

# continue only for intereactive mode
case "$-" in
    *i*) ;;
    *) return
esac

# add ~/.local/shell-scripts/bin to PATH
if [ -d "$HOME/.local/shell-scripts/bin" ]; then
    export PATH="$HOME/.local/shell-scripts/bin:$PATH"
fi

# if -f check if ~/.local/etc/config.sh  existed, source it
if [ -f "$HOME/.local/etc/config.sh" ]; then
    . "$HOME/.local/etc/config.sh"
fi

# check if ~/.local/etc/local.sh existed, source it
if [ -f "$HOME/.local/etc/local.sh" ]; then
    . "$HOME/.local/etc/local.sh"
fi

# remove duplicated PATH
if [ -n "$PATH" ]; then
    old_PATH=$PATH:; PATH=
    while [ -n "$old_PATH" ]; do
        x=${old_PATH%%:*}      
        case $PATH: in
           *:"$x":*) ;;         
           *) PATH=$PATH:$x;;  
        esac
        old_PATH=${old_PATH#*:}
    done
    PATH=${PATH#:}
    unset old_PATH x
fi

export PATH

# source ~/.local/etc/function.sh for bash/zsh
if [ -n "$BASH_VERSION" ] || [ -n "$ZSH_VERSION" ]; then
    # run script for interactive mode of bash/zsh
    if [[ $- == *i* ]] && [ -z "$_INIT_SH_NOFUN" ]; then
        if [ -f "$HOME/.local/etc/function.sh" ]; then
            . "$HOME/.local/etc/function.sh"
        fi
    fi
fi

# source ~/.local/etc/login.sh for login mode
if [ -n "$BASH_VERSION" ]; then
    if shopt -q login_shell; then
        if [ -f "$HOME/.local/etc/login.sh" ] && [ -z "$_INIT_SH_NOLOG" ]; then
            . "$HOME/.local/etc/login.sh"
        fi
    fi
elif [ -n "$ZSH_VERSION" ]; then
    if [[ -o login ]]; then
        if [ -f "$HOME/.local/etc/login.sh" ] && [ -z "$_INIT_SH_NOLOG" ]; then
            . "$HOME/.local/etc/login.sh"
        fi
    fi
fi
