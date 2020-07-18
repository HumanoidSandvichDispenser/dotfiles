#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © 2020 sandvich <sandvich@sandvich-pc>
#
# Distributed under terms of the MIT license.

import os
import click
import taglib

@click.command()
@click.argument("url")
@click.argument("name")
@click.argument("artist")
def main(url, name, artist):
    if os.getcwd() != artist:
        os.system("mkdir {0}".format(artist))
        os.chdir(artist)
    os.system("mkdir {0}; cd {0}".format(name))
    os.chdir(name)

    os.system("youtube-dl --yes-playlist -x --audio-format m4a {0}".format(url))

    for file in os.listdir(os.getcwd()):
        if file.endswith("m4a"):
            title = input("Enter song title for {0}: ".format(file))
            #contribArtist = input("Enter contributing artists for {0}: ".format(file))
            #contribArtistArg = "" if not contribArtist else "-metadata artist=contribArtist"
            song = taglib.File(file)
            song.tags["ALBUM"] = [ name ]
            song.tags["ARTIST"] = [ artist ]
            song.tags["TITLE"] = [ title ]

if __name__ == "__main__":
    main()
