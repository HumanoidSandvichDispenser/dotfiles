#!/bin/bash
for file in `ls $HOME/bin/autoalias/`; do
	alias $file="bash $HOME/bin/autoalias/$file"
	echo "Aliased $HOME/bin/autoalias/$file as $file"
done
