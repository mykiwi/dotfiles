#!/bin/bash

sh <(curl -L https://nixos.org/nix/install) --no-daemon
export NIX_PATH=nixpkgs=$HOME/.nix-defexpr/channels/nixpkgs
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update

nix-shell '<home-manager>' -A install
home-manager switch

export SHELL=$(whereis fish)
