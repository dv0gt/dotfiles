#!/bin/bash

set -e
mkdir -p $HOME/.config/nvim
rm -rf $HOME/.config/nvim/*
cp -r nvim/* $HOME/.config/nvim/
cp .zshrc $HOME
cp .p10k.zsh $HOME
