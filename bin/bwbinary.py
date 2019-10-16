#!/usr/bin/env python3
import math
import click
from PIL import Image

def GetValue(r, g, b):
    return max(r, max(g, b))

@click.command()
@click.option("-o", "--output",  default=False)
@click.argument("file")
@click.argument("destination")
def Main(output, file, destination):
    image = Image.open(file).convert("RGB")
    picture = image.load()
    width, height = image.size
    text = ""

    # Loop through each pixel of the image
    for y in range(width):
        for x in range(height):
            # Set r, g, b to increase readability
            r, g, b = picture[x, y][0], picture[x, y][1], picture[x, y][2],  
            
            # Get lightness value given r, g, b
            # If the lightness value is less than 50%, the pixel is 0 (otherwise 1)
            value = GetValue(r, g, b)
            if (value < 128):
                text += '0'
            else:
                text += '1'
        text += '\n'
    
    if (output):
        print(text)
    destinationFile = open(destination, "w+")
    destinationFile.write(text)
    destinationFile.close()

if __name__ == "__main__":
    Main()
