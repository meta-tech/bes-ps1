#!/bin/bash
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
# @author   a-Sansara - https://git.pluie.org/meta-tech/bes-build
# @app      bes-build
# @license  GNU GPL v3
# @date     2017-06-16 04:38:52 CET
#
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      BES_VERSION=2.1
         BES_NAME="bes-ps1"
          BES_URL="https://git.pluie.org/meta-tech/$BES_NAME/raw/latest/dist/$BES_NAME"
          APP_DIR=$(pwd)
         APP_NAME=$(basename $(pwd)) 
          APP_BIN=$APP_DIR/dist/$APP_NAME

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function bes.main ()
{
    if   [ "$1" = "version" ] || [ "$1" = "-v" ]; then
        echo $BES_VERSION
    else
        echo.app "$BES_NAME" "$BES_VERSION"
        echo
        if   [ "$1" = "install" ] || [ "$1" = "-i" ]; then
            bes.install "$BES_NAME" "$BES_URL" "$2" "bes.ps1.install"
        elif [ "$1" = "help" ] || [ "$1" = "-h" ]; then
            bes.usage
        fi
        echo
    fi
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function bes.ps1.install ()
{
    local path="/usr/share/bes/ps1"
    local dir=$(dirname "$path")
    if [ ! -d "$dir" ]; then
        echo.action "Creating default bes share dir" "$Cspe$dir$Coff"
        sudo mkdir -p "$dir"
        echo.state $?
    fi
    echo.action "Downloading ps1 file"
    wget -q https://raw.githubusercontent.com/meta-tech/bes-ps1/latest/src/ps1
    echo.state $?
    echo.action "Moving ps1 file to" "$Cspe$path$Coff"
    sudo mv ps1 "$path"
    echo.state $?
    if [ ! -f "/home/$USER/.bash_ps1" ]; then
        echo.action "Downloading .user_ps1 file"
        wget -q https://raw.githubusercontent.com/meta-tech/bes-ps1/latest/src/.user_ps1
        echo.action "Moving .user_ps1 file to" "${Cspe}~/.bash_ps1${Coff}"
        mv .user_ps1 ~/.bash_ps1
        echo.state $?
    fi
    echo.action "Updating $USER .bashrc file"
    if [ ! -f "~/.bashrc" ]; then
        touch ~/.bashrc
    fi
    local line=$(cat ~/.bashrc | grep -n '# > BES_PS1' | cut -d':' -f1)
    if [ -z "$line" ]; then
        echo "
# > BES_PS1
if [ -f ~/.bash_ps1 ]; then
    . ~/.bash_ps1
fi
# < BES_PS1
" >> ~/.bashrc
    else
        echo.msg "already updated"
    fi
    echo.state $?
    echo.action "You can now edit ~/.bash_ps1 to customize ps1"
    cat ~/.bash_ps1
    echo.action "To view effects immediatly run :"
    echo.msg "source ~/.bashrc"
    source ~/.bash_ps1
}
bes.main $*
