#!/bin/bash

set -e
mkdir -p nvim
cp -r $HOME/.config/nvim/* nvim/
cp ~/.zshrc .
cp ~/.p10k.zsh .
