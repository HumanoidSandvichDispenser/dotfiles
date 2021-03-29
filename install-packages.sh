#! /usr/bin/zsh
#
# install-packages.sh
# Copyright (C) 2021 sandvich <sandvich@sandvich-pc>
#
# Distributed under terms of the MIT license.
#

echo "Perform ${LBLUE}pacman -Syyu? ${RESTORE}[y/N]"
read REPLY
[[ $REPLY == y ]] && sudo pacman -Syyu
echo ${BLUE}----------------------------------${RESTORE}
echo "${RESTORE}Installing ${LGREEN}yay..."
echo ${BLUE}----------------------------------${RESTORE}
sudo pacman -S yay --needed
echo ${BLUE}----------------------------------${RESTORE}
echo "${RESTORE}Installing missing packages..."
yay -S --needed --noconfirm - < ./packages.txt
