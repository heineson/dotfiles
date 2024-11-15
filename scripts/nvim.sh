#!/bin/bash -e

echo "Installing latest nvim appimage"

curl -Lo /tmp/nvim.appimage https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
cd /tmp
chmod u+x nvim.appimage

sudo mkdir -p /opt/nvim
sudo mv nvim.appimage /opt/nvim/nvim

mkdir -p ~/bin
link=~/bin/nvim
if [ ! -L "$link" ]; then
  ln -s /opt/nvim/nvim $link
fi

repo_dest="${XDG_CONFIG_HOME:-$HOME/.config}"/nvim

if [ ! -d "$repo_dest" ]; then
  git clone git@github.com:heineson/kickstart.nvim.git "$repo_dest" 
else
  echo "Updating nvim config repo"
  cd $repo_dest
  git pull
fi

