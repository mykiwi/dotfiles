#!/bin/sh
set -ex

DOTFILES=~/.dotfiles

NOCOLOR='\e[0m'
REDCOLOR='\e[37;41m'

printf "Create $HOME symlink\n"
ln -sf $(pwd)                           ~/.dotfiles
ln -sf ${DOTFILES}/shell/.alias         ~/.alias
ln -sf ${DOTFILES}/shell/.zshrc         ~/.zshrc
ln -sf ${DOTFILES}/git/.gitconfig       ~/.gitconfig

printf "Install git submodule\n"
if type -t git &> /dev/null; then
    git submodule update --init
fi

if [[ `which php` ]] ; then
    if [[ ! -f /usr/local/bin/composer ]]; then
        printf "Install composer\n"
        curl -sS https://getcomposer.org/installer | php
        sudo mv composer.phar /usr/local/bin/composer
    fi
fi

if [[ `which composer` ]] ; then
    composer global require --optimize-autoloader \
        symfony/flex \
        pyrech/composer-changelogs \
        sllh/composer-versions-check
fi
