#!/bin/sh
set -xe

NOCOLOR='\e[0m'
REDCOLOR='\e[37;41m'

which git 2>&1 /dev/null
if [ ! $? -eq 0 ]; then
    echo "${REDCOLOR}You need git. Installation stopped.$NOCOLOR"
    exit 1
fi

if [ ! -d ~/dev/github.com/mykiwi/dotfiles ]; then
    mkdir -p ~/dev/github.com/mykiwi
    git clone git@github.com:mykiwi/dotfiles.git ~/dev/github.com/mykiwi/dotfiles
    cd ~/dev/github.com/mykiwi/dotfiles
else
    cd ~/dev/github.com/mykiwi/dotfiles
    git pull --rebase 2>&1 /dev/null || true
fi

exec install.sh
