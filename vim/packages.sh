#!/bin/bash

if [ -z $(which git 2>/dev/null) ]; then
    echo "Please install git before running"
    exit
fi

V_PACK="${HOME}/.vim/pack"
V_THEMES="${V_PACK}/themes"

function git_install() {
    if [ $# != 2 ]; then
        echo "Incorrect number of arguments to git_install. Expected 2, got $#"
        echo "git_install $@"
        return
    fi

    if [ -e "$2" ]; then
        echo "$2 already exists; skipping..."
    else
        echo "Installing $2..."
        git clone "$1" "$2"
    fi
}

SOLARIZED8_URL="https://github.com/lifepillar/vim-solarized8.git"
SOLARIZED8_LOC="${V_THEMES}/opt/solarized8"

git_install "$SOLARIZED8_URL" "$SOLARIZED8_LOC"

