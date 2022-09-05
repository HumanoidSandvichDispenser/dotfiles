#! /usr/bin/env python3
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © 2021 sandvich <sandvich@manjaro>
#
# Distributed under terms of the MIT license.

import json
import subprocess
import re
from collections import defaultdict
#import os

password_prompt: str = "rofi -dmenu -p 'Master password' -theme $DOTFILES/rofi-input-box.rasi -password"
session_key_regex: re.Pattern = re.compile(r"export BW_SESSION=\"(.+)\"", re.MULTILINE)

session_key: str = ""

def unlock_session():
    output = subprocess.run("{0} | bw unlock".format(password_prompt),
        capture_output=True, text=True, shell=True)\
        .stdout.strip("\n")

    #session_key = re.match(session_key_regex, output).group(0)
    session_key_match = session_key_regex.search(output)

    if session_key_match != None:
        session_key = session_key_match.group(1)
        print("Added session key", session_key)
        subprocess.run("echo '{0}' | keyctl padd user bw_session @u"
                       .format(session_key), shell=True)
        return session_key
    else:
        print("Failed to authenticate.")
        exit(1)

def get_list(key):
    items_raw = subprocess.run("bw list items --session '{0}'".format(key),
                   capture_output=True, shell=True).stdout.decode()
    items = json.loads(items_raw)
    items_dmenu = ""

    for item in items:
        name = item["name"]
        id = item["id"]
        username = ""
        if "login" in item:
            username = item["login"]["username"]
        items_dmenu += "<b>{0}</b>&#10;{1} [{2}]\n".format(name, username, id)

    items_dmenu = items_dmenu.rstrip("\n")
    print(items_dmenu)

def main():
    key_request = subprocess.run("keyctl request user bw_session",
                                 capture_output=True, shell=True)
    if key_request.returncode > 0:
        session_key = unlock_session()
    else:
        key_request_id = key_request.stdout.decode("UTF-8")
        session_key = subprocess.run("keyctl pipe {0}".format(key_request_id),
                                     capture_output=True, shell=True).stdout.decode()

    get_list(session_key)


if __name__ == "__main__":
    main()
