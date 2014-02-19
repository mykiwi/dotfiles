#!/bin/bash

ROOT="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Install oh-my-zsh + pure
git submodule update --init

# Enable pure for oh-my-zsh
ln -sf $ROOT/zsh/pure/pure.zsh $ROOT/zsh/oh-my-zsh/custom/pure.zsh-theme

function createZshrc {
    echo "# github.com/mykiwi/dotfiles
export DOTFILES=$ROOT
source \$DOTFILES/.zshrc" > ~/.zshrc
}

# Create the .zshrc only if the user want
if [ -e ~/.zshrc ]
then

    if [ -L ~/.zshrc ]
    then
        echo "/!\\ You already have a ~/.zshrc and it's already a symlink. Do you want to reset it? [y/n]:"
    else
        echo "/!\\ The file ~/.zshrc already exists. Do you want to reset it? [y/n]:"
    fi

    read action
    if [ "y" = "$action" ]
    then
        createZshrc
    fi

else
    createZshrc
fi
