#! /usr/bin/env python3
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © 2021 sandvich <sandvich@manjaro>
#
# Distributed under terms of the MIT license.

import click
import base64
import requests
import os

@click.command()
@click.argument("api_key")
@click.argument("image_path")
@click.option("-n", "--name")
def main(api_key, image_path, name):
    with open(image_path, "rb") as image_stream:
        url = "https://api.imgbb.com/1/upload"
        payload = {
            "key": api_key,
            "name": name if name != None and name != "" else os.path.basename(image_path),
            "image": base64.b64encode(image_stream.read()),
        }

        requests.post(url, payload)

if __name__ == "__main__":
    main()
