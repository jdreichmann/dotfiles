#!/bin/bash

# Install packages which are frequently used by me

if [[ $(command -v dnf) == 0 ]]; then
	sudo -i dnf install tmux git gnupg2 openssh
elif [[ $(command -v pacman) == 0 ]]; then
	sudo pacman -S tmux git gnupg openssh
fi

HERE=$(pwd)

# Set up tmux
ln -s $HERE/tmux/tmux.conf ~/.tmux.conf
# Get the tmux-plugin-manager
mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm.git ~/.tmux/plugins/tpm

# Set up redshift
mkdir -p ~/.config/redshift
mkdir -p ~/.config/autostart
ln -s $HERE/redshift/redshift.conf ~/.config/redshift/redshift.conf

# Set up gnupg things
mkdir -p ~/.gnupg
ln -s $HERE/gnupg/gpg.conf ~/.gnupg/gpg.conf
ln -s $HERE/gnupg/gpg-agent.conf ~/.gnupg/gpg-agent.conf
ln -s $HERE/gnupg/sshcontrol ~/.gnupg/sshcontrol
ln -s $HERE/gnupg/gnupg_agent ~/.gnupg/gnupg_agent

git config --global gpg.program gpg2
git config --global user.name jdreichmann
git config --global user.email johanna.reichmann@delta-industries.de
git config --global user.signingkey 03624C433676E465
git config --global commit.gpgsign true
git config --global alias.logs "log --show-signature"

