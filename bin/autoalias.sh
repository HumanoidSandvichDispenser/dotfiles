#!/bin/zsh
for file in `ls $HOME/bin/autoalias/`; do
	alias $file="source $HOME/bin/autoalias/$file"
	echo "Aliased $HOME/bin/autoalias/$file as $file"
done
