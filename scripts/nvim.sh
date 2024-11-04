#!/bin/bash -e

echo "Installing latest nvim appimage"

curl -Lo /tmp/nvim.appimage https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
cd /tmp
chmod u+x nvim.appimage

sudo mkdir -p /opt/nvim
sudo mv nvim.appimage /opt/nvim/nvim

mkdir -p ~/bin
ln -s /opt/nvim/nvim ~/bin/nvim

repo_dest="${XDG_CONFIG_HOME:-$HOME/.config}"/nvim

if [ ! -d "~/dev/$repo" ]; then
  git clone git@github.com:heineson/kickstart.nvim.git
  git clone git@github.com:heineson/kickstart.nvim.git "$repo_dest" 
else
  echo "Updating nvim config repo"
  cd $repo_dest
  git pull
fi



