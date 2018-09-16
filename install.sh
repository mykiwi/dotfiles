#!/bin/sh
set -ex

ln -sf $(pwd) ~/.dotfiles
DOTFILES=~/.dotfiles

NOCOLOR='\e[0m'
REDCOLOR='\e[37;41m'

touch ~/.private-gitconfig

echo 'Create $HOME symlink'
ln -sf ${DOTFILES}/git/.gitconfig       ~/.gitconfig
ln -sf ${DOTFILES}/shell/.alias         ~/.alias
ln -sf ${DOTFILES}/shell/.zshrc         ~/.zshrc

echo 'Install git submodule'
if type -t git &> /dev/null; then
    git submodule update --init
fi

if [[ `which php` ]] ; then
    if [[ ! -f /usr/local/bin/composer ]]; then
        echo 'Install composer'
        curl -sS https://getcomposer.org/installer | php
        sudo mv composer.phar /usr/local/bin/composer

        composer global require --optimize-autoloader \
            symfony/flex \
            pyrech/composer-changelogs \
            sllh/composer-versions-check
    fi
fi
