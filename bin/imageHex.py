#!/usr/bin/env python3
import math
import click
from PIL import Image

def GetValue(r, g, b):
    return max(r, max(g, b))

@click.command()
@click.option("-o", "--output", is_flag=True)
@click.argument("file")
@click.argument("destination")
@click.argument("bitsize", required=False)
def Main(output, file, destination, bitsize=2):
    image = Image.open(file).convert("RGB")
    picture = image.load()
    width, height = image.size
    text = ""

    # Loop through each pixel of the image
    for y in range(width):
        for x in range(height):
            # Set r, g, b to increase readability
            # r, g, b = picture[x, y][0], picture[x, y][1], picture[x, y][2]  
            rgb = picture[x, y]
            hexColor = "".join([format(val, '02X') for val in rgb])
            
            if bitsize == 1:
                hexArray = list(hexColor)
                text += hexArray[0] + hexArray[2], + hexArray[4] 
            else:
                text += hexColor
        text += '\n'
    
    if (output):
        print(text)
    destinationFile = open(destination, "w+")
    destinationFile.write(text)
    destinationFile.close()

if __name__ == "__main__":
    Main()
