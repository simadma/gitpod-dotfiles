#!/usr/bin/env bash

echo -e "Starting installation...\n"

sudo apt-get update && sudo apt-get install -y tree

# Changes the current directory to the directory of the script
cd "$(dirname "$0")"

# Configuring git signing
source scripts/git_sign_config.sh

# Temporarily set Anonymous Git Email
github_email=47949834+simadma@users.noreply.github.com
echo "export GIT_AUTHOR_EMAIL=${github_email}" >> ~/.bashrc
echo "export GIT_COMMITTER_EMAIL=${github_email}" >> ~/.bashrc

# Install tmux
# source scripts/install_tmux.sh

# Install Neovim
# source scripts/install_neovim.sh

# echo -e "\nInstallation complete!"
