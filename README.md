# Dotfiles

```bash
# install nix
sh <(curl -L https://nixos.org/nix/install) --no-daemon


# install home-manager
export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH}

nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update

nix-shell '<home-manager>' -A install


# clone this repo
git clone git@github.com:mykiwi/dotfiles.git ~/.config/nixpkgs


# run home-manager
home-manager switch
```

## Refs
- https://github.com/alexpearce/dotfiles
- https://alexpearce.me/2021/07/managing-dotfiles-with-nix/

---


### [Open in Gitpod](https://gitpod.io/#https://github.com/mykiwi/dotfiles)

```shell
git checkout --track origin/home-manager

rm -rf ~/.config/nixpkgs
ln -s /workspace/dotfiles ~/.config/nixpkgs
```