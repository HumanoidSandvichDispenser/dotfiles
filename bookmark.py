# Humanoid Sandvich Dispenser
from __future__ import print_function, unicode_literals

import sys
import os
import json
import subprocess

import click # https://github.com/pallets/click pip install click
from PyInquirer import style_from_dict, Token, prompt, print_json
from pprint import pprint

def GetPath():
    return os.path.dirname(os.path.realpath(__file__))

def Read():
    with open(GetPath() + "/.script_config/bookmarks.json") as json_file:
        return json.load(json_file)
    return {}

def Write():
    js = json.dumps(bookmarks)
    f = open(GetPath() + "\\.script_config\\bookmarks.json", "w")
    f.write(js)
    f.close()

def GetBookmarks():
    for bookmark in bookmarks:
        bookmark
    

style = style_from_dict({
    Token.Separator: '#cc5454',
    Token.QuestionMark: '#673ab7 bold',
    Token.Selected: '#cc5454',  # default
    Token.Pointer: '#673ab7 bold',
    Token.Instruction: '',  # default
    Token.Answer: '#f44336 bold',
    Token.Question: '',
})

# Dictionary of bookmarks
bookmarks = Read()

questions = [
    {
        'type': 'list',
        'name': 'bookmarks',
        'message': 'Select bookmarks:',
        'choices': list(bookmarks.keys()) + ['Cancel']
    }
]

@click.command()
@click.argument("bookmarkname", nargs=1, required=False)
def Main(bookmarkname):
    if bookmarkname is None:
        answer = prompt(questions, style=style)["bookmarks"]
        if answer == "Cancel":
            return
        sys.stdout.flush()
        print("Changing to " + bookmarks[answer])
        exit(bookmarks[answer])
    else:
        Bookmark(bookmarkname)
        

def Bookmark(name):
    if name in bookmarks.keys():
        if not Confirm(name + " already exists. Would you like to replace it?"):
            return
        
    click.echo("Bookmarked " + name + " as " + os.getcwd())
    bookmarks[name] = os.getcwd()

    Write()



def Confirm(msg):
    confirmation =  [
        {
            "type": "confirm",
            "name": "confirmation",
            "message": msg,
            "default": False
        }
    ]
    return prompt(confirmation)["confirmation"]

if __name__ == '__main__':
    Main()