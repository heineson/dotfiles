#!/bin/sh

echo "Installing latest nvim appimage"

curl -Lo /tmp/nvim.appimage https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
cd /tmp
chmod u+x nvim.appimage

sudo mkdir -p /opt/nvim
sudo mv nvim.appimage /opt/nvim/nvim

ln -s /opt/nvim/nvim ~/.local/bin/nvim

