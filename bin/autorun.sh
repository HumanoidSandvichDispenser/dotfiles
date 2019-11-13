#! /bin/sh
#
# autorun.sh
# Copyright (C) 2019 sandvich <sandvich@sandvich-pc>
#
# Distributed under terms of the MIT license.
#


for file in `ls $HOME/bin/autorun/`; do
	sh $file &
done
