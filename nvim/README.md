# Installation

First, run `nvim PackerInstall`.

Then call `nvim` somewhere. On first startup there might be some installations required (e.g. Treesitter). This will happen automatically. 

### Golang

For golang debugger to work, you need to [install `delve`](https://github.com/go-delve/delve/blob/master/Documentation/installation/README.md) first and put it in your PATH.

For golang linter to work properly, install `revive` with the following command: `go install github.com/mgechev/revive@latest`
