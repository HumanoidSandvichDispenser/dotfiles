#! /bin/sh
#
# lpass-login.sh
# Copyright (C) 2021 sandvich <sandvich@arch>
#
# Distributed under terms of the MIT license.
#
# Automatically logs into LastPass given $1 username and $2 master password.


export LPASS_DISABLE_PINENTRY=1
lpass login $1 <<< $2
