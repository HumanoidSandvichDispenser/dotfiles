#! /bin/sh
#
# install-wallpaper.sh
# Copyright (C) 2021 sandvich <sandvich@manjaro>
#
# Distributed under terms of the MIT license.
#
# Copies wallpapers from $DOTFILES/wallpaper to the $WALLPAPERS directory.
# Useful if your home directory is on another drive than the system.

echo "Creating directories..."
sudo mkdir -p $WALLPAPERS
echo "Changing permissions..."
sudo chmod 777 $WALLPAPERS
echo "Copying wallpapers..."
cp $DOTFILES/wallpaper/* $WALLPAPERS
