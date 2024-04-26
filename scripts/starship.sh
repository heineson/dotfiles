#!/bin/bash -x

# Install NerdFonts for Ubuntu
mkdir -p ~/dev
cd ~/dev
git clone --filter=blob:none --sparse git@github.com:ryanoasis/nerd-fonts
cd nerd-fonts
git sparse-checkout add patched-fonts/UbuntuMono
./install.sh UbuntuMono

# Install starship
curl -sS https://starship.rs/install.sh | sh
echo -e '\neval "$(starship init bash)"' >> ~/.bashrc

echo -e "\nClose all terminator windows, then configure to use UbuntuMono Nerd Font Regular 13"

