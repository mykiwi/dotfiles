# Dotfiles

```bash
git clone git@github.com:mykiwi/dotfiles.git ~/.config/nixpkgs

cd ~/.config/nixpkgs

sh <(curl -L https://nixos.org/nix/install) --no-daemon
export NIX_PATH=nixpkgs=$HOME/.nix-defexpr/channels/nixpkgs
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update

nix-shell '<home-manager>' -A install
home-manager switch

(echo "exec fish" && cat ~/.bashrc) > ~/.bashrc1 && mv ~/.bashrc1 ~/.bashrc


```

## Refs
- https://github.com/alexpearce/dotfiles
- https://alexpearce.me/2021/07/managing-dotfiles-with-nix/

### [Open in Gitpod](https://gitpod.io/#https://github.com/mykiwi/dotfiles)
