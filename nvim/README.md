# Installation

First, run `nvim PackerInstall`.

Then call `nvim` somewhere. On first startup there might be some installations required (e.g. Treesitter). This will happen automatically. 

## Update

Go to `~/.config/nvim/`.

If you want to update nvim and its dependencies, run `:PackerSync`, followed by `:TSUpdate`.

Probably you need to do some config changes as there might be breaking changes or something.

Run `./backup.sh` to copy the updated config to this repository

### Golang

For golang debugger to work, you need to install `delve` first and put it in your PATH.

For golang linter to work properly, install `revive` with the following command: `go install github.com/mgechev/revive@latest`
