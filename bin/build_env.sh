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
ln -s ${SCRIPTPATH}/../.zshrc ~/.zshrc
