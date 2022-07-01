# Dotfiles

```bash
git clone git@github.com:mykiwi/dotfiles.git ~/.config/nixpkgs
~/.config/nixpkgs/install.sh
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