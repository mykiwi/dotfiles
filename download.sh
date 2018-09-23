#!/bin/sh
set -xe

NOCOLOR='\e[0m'
REDCOLOR='\e[37;41m'

which git 2>&1 /dev/null
if [ ! $? -eq 0 ]; then
    printf "${REDCOLOR}You need git. Installation stopped.${NOCOLOR}\n"
    exit 1
fi

if [ ! -d ~/dev/github.com/mykiwi/dotfiles ]; then
    mkdir -p ~/dev/github.com/mykiwi
    git clone git@github.com:mykiwi/dotfiles.git ~/dev/github.com/mykiwi/dotfiles
else
    cd ~/dev/github.com/mykiwi/dotfiles
    git pull --rebase 2>&1 /dev/null || true
fi
~/dev/github.com/mykiwi/dotfiles/install.sh

if [ ! -d ~/dev/gitlab.com/mykiwi/private-dotfiles ]; then
    mkdir -p ~/dev/gitlab.com/mykiwi
    git clone git@gitlab.com:mykiwi/private-dotfiles.git ~/dev/gitlab.com/mykiwi/private-dotfiles
else
    cd ~/dev/gitlab.com/mykiwi/private-dotfiles
    git pull --rebase 2>&1 /dev/null || true
fi
~/dev/gitlab.com/mykiwi/private-dotfiles/install.sh
