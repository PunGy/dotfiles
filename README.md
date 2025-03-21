# Dotfiles

Welcome to my dotfiles :)

Navigation:

```
|--home/ # ~/ directory
|----.ghci # fancy prompt for haskell ghci
|----.gitconfig
|--fish/
|----fish_plugins # list of plugins I use
|----functions/*  # handy functions you might like
|--kitty/
|----kitty.conf   # my kitty config
|----*-theme.conf # some themes I do like
```


Usage:

```sh
make install # apply configs from the repo
make install_fish # apply only fish
#make install_*   # checkout Makefile which folders you can granually apply

make sync # sync your local configs and put them here
make sync_fish # sync only fish
#make sync_*   # checkout Makefile which folders you can granually sync
```


Check also:

- [neovim dotfiles](https://github.com/PunGy/neovim-dotfiles)

