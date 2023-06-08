#! /bin/sh
#
# dropdown.sh
# Copyright (C) 2023 sandvich <sandvich@artix>
#
# Distributed under terms of the MIT license.
#

dropdown_type=$1
dropdown_class=$2
dropdown_proc=$3
dropdown_args=${@:4}
#bspc node 0x02600002 -g hidden -d focused -f
[ "$dropdown_type" == "class" ] && \
    id=$(xdo id -N $dropdown_class) || \
    id=$(xdo id -n $dropdown_class)

echo $dropdown_proc
echo $dropdown_args
echo $6

if [ "$id" == "" ]; then
    exec $dropdown_proc $dropdown_args
else
    bspc node $id -g hidden -d focused -f
fi
