#!/bin/bash

DOTFILES=$( cd $(dirname $0) ; pwd -P )

echo "Installing bash customization"
BASHRC_PATH="$DOTFILES/bash/bashrc.additions"
grep -q -F "source $BASHRC_PATH" $HOME/.bashrc || echo "source $BASHRC_PATH" >> $HOME/.bashrc

linkables=$( ls -1 -d **/*.symlink )
for file in $linkables ; do
    source="$DOTFILES/$file"
    target="$HOME/.$( basename $file ".symlink" )"
    if [ -e $target ] ; then
        echo "$target already linked"
    else
        echo "Creating symlink: $target -> $source"
        ln -s $source $target
    fi
done

echo "Install Starship config"
SS_SOURCE="$DOTFILES/starship/starship.toml"
SS_DEST="$HOME/.config/starship.toml"
if [ -e $SS_DEST ] ; then
    echo "Already installed"
else
    ln -s $SS_SOURCE $SS_TARGET
fi

echo "Install configures plugins in vim with ':PlugInstall'"
echo "Done"

