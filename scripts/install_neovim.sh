#!/usr/bin/env bash

WORKING_DIR=$PWD

cd $(mktemp -d)

URL="https://github.com/neovim/neovim/releases/latest/download/nvim.appimage"
if test -n "$NEOVIM_VERSION"
then
    URL="https://github.com/neovim/neovim/releases/download/$NEOVIM_VERSION/nvim.appimage"
fi

curl -LO "$URL"
chmod u+x nvim.appimage
./nvim.appimage --appimage-extract > /dev/null
mkdir -p /home/gitpod/.local/bin
ln -s $(pwd)/squashfs-root/AppRun /home/gitpod/.local/bin/nvim

cd "$WORKING_DIR"

# Add configs
mkdir -p ~/.config/nvim
cp -r config/nvim/. ~/.config/nvim/

# Synchronize (install) plugins with Lazy.nvim
nvim --headless "+Lazy! sync" +qa
