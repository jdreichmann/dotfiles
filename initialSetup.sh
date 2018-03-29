#!/bin/bash

# Install packages which are frequently used by me
sudo -i dnf install tmux tree git

# Checkout my dotfiles and the tmux-plugin-manager
mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm.git ~/.tmux/plugins/tpm
git clone https://github.com/jreichmann/dotfiles.git

