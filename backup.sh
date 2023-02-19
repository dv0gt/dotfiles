#!/bin/bash

set -e
mkdir -p nvim
rm -r nvim/*
cp -r $HOME/.config/nvim/* nvim/
cp $HOME/.zshrc .
cp $HOME/.p10k.zsh .
