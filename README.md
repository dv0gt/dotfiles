# dotfiles

## preconditions

* Install [brew](https://brew.sh/index_de) and run `brew bundle install`
* Install [oh-my-zsh](https://ohmyz.sh/#install)
* Install [JetBrains Mono Nerd Font Complete Regular.ttf](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/JetBrainsMono/Ligatures/Regular/complete)
* Install [p10k](https://github.com/romkatv/powerlevel10k#oh-my-zsh)
* Install [fzf-zsh-plugin](https://github.com/unixorn/fzf-zsh-plugin#oh-my-zsh)

## lua formatting

Run `pre-commit install` in the base directory.

## backup

If you do changes outside this repository, call `./backup.sh` to copy the configs from the `$HOME` directory into this repository.

## restore

If you setup a new system, just call `./restore.sh` to copy all configs into the `$HOME` directory.
