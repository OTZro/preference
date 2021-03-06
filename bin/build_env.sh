#!/bin/bash

absPath(){
    if [[ -d "$1" ]]; then
        cd "$1"
        echo "$(pwd -P)"
    else
        cd "$(dirname "$1")"
        echo "$(pwd -P)/$(basename "$1")"
    fi
}

SCRIPTPATH=$(absPath $(dirname $0))

# SCRIPTPATH=$?

if [[ -s "~/.zshrc" ]] ; then
    mv ~/.zshrc ~/.zshrc.bac
fi
ln -fs ${SCRIPTPATH}/../.zshrc ~/.zshrc
ln -fs ${SCRIPTPATH}/../.tigrc ~/.tigrc
ln -fs ${SCRIPTPATH}/../.vimrc ~/.vimrc
ln -fs ${SCRIPTPATH}/../com.hegenberg.BetterTouchTool.plist ~/Library/Preferences/com.hegenberg.BetterTouchTool.plist
