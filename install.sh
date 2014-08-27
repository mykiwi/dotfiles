#!/bin/bash

ROOT="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Install oh-my-zsh + pure
git submodule update --init

# Enable pure for oh-my-zsh
ln -sf $ROOT/zsh/pure/pure.zsh $ROOT/zsh/oh-my-zsh/custom/pure.zsh-theme

# Created .zshrc
echo "# github.com/mykiwi/dotfiles
export DOTFILES=$ROOT
source \$DOTFILES/.zshrc" > ~/.zshrc

# Created symlink for gitconfig
ln -sf $DOTFILES/.gitconfig ~/.gitconfig

echo Done
