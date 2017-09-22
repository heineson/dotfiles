#!/bin/bash

DOTFILES=$( cd $(dirname $0) ; pwd -P )

echo "Installing bash customization"
BASHRC_PATH="$DOTFILES/bash/bashrc.additions"
grep -q -F "source $BASHRC_PATH" $HOME/.bashrc || echo "source $BASHRC_PATH" >> $HOME/.bashrc

linkables=$( ls -1 -d **/*.symlink )
for file in $linkables ; do
    target="$HOME/.$( basename $file ".symlink" )"
    echo "Creating symlink for $file"
    ln -s $DOTFILES/$file $target
done

echo "Done"

