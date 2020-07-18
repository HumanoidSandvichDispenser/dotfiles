#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © 2020 sandvich <sandvich@sandvich-pc>
#
# Distributed under terms of the MIT license.

import os
import math
import curses
import npyscreen

LampColors = {
    "Off": [ -1, 0, 0, 0 ],
    "Muted Red": [ -1, 4, 50, -1 ],
    #"Purple": [ -1, 70, 80, -1 ],
    "Peach": [ -1, 5, 70, -1 ],
    "Daywhite": [ 6500, -1, -1, -1 ],
    "Normal": [ 4000, -1, -1, -1 ],
    "Warmwhite": [ 2800, -1, -1, -1 ],
    "Warmer": [ 2500, -1, -1, -1, -1 ],
}

class DefaultTheme(npyscreen.ThemeManager):
    default_colors = {
        "DEFAULT"     : "WHITE_BLACK",
        "FORMDEFAULT" : "BLUE_BLACK",
        "NO_EDIT"     : "BLUE_BLACK",
        "STANDOUT"    : "CYAN_BLACK",
        "CURSOR"      : "WHITE_BLACK",
        "CURSOR_INVERSE": "CYAN_BLACK",
        "LABEL"       : "GREEN_BLACK",
        "LABELBOLD"   : "WHITE_BLACK",
        "CONTROL"     : "YELLOW_BLACK",
        "IMPORTANT"   : "GREEN_BLACK",
        "SAFE"        : "GREEN_BLACK",
        "WARNING"     : "YELLOW_BLACK",
        "DANGER"      : "RED_BLACK",
        "CRITICAL"    : "BLACK_RED",
        "GOOD"        : "GREEN_BLACK",
        "GOODHL"      : "GREEN_BLACK",
        "VERYGOOD"    : "BLACK_GREEN",
        "CAUTION"     : "YELLOW_BLACK",
        "CAUTIONHL"   : "BLACK_YELLOW",
    }

    _color_values = (
        # redefining a standard color
        # multiply by 3.90625
        (curses.COLOR_BLACK, (160, 160, 160)),
        (curses.COLOR_WHITE, (917, 855, 695)),
        # defining another color
        #(2, (250,250,100)),
    )

class MainForm(npyscreen.Form):
    class LampColorButton(npyscreen.ButtonPress):
        def whenPressed(self):
            isTemperatureMode = False

            color = LampColors[self.name]
            if color[0] != -1:
                isTemperatureMode = True
                self.parent.TemperatureSlider.set_value(color[0])

            if color[1] != -1:
                self.parent.HueSlider.set_value(color[1])
            if color[2] != -1:
                self.parent.SaturationSlider.set_value(color[2])

            if color[3] != -1:
                self.parent.ValueSlider.set_value(color[3])

            self.parent.TemperatureMode.value = isTemperatureMode
            self.parent.RGBMode.value = not isTemperatureMode

            self.parent.TemperatureSlider.hidden = not isTemperatureMode
            self.parent.HueSlider.hidden = isTemperatureMode
            self.parent.SaturationSlider.hidden = isTemperatureMode

            self.parent.display()

    class ColorTypeBox(npyscreen.RoundCheckBox):
        def whenToggled(self):
            super().whenToggled()
            isTemperatureMode = (self.name == "Temperature Mode")

            self.parent.TemperatureMode.value = isTemperatureMode
            self.parent.RGBMode.value = not isTemperatureMode

            self.parent.TemperatureSlider.hidden = not isTemperatureMode
            self.parent.HueSlider.hidden = isTemperatureMode
            self.parent.SaturationSlider.hidden = isTemperatureMode

            self.parent.display()

    #def switchColorMode(self, mode):

    def afterEditing(self):
        temperature = self.TemperatureSlider.value
        hue = self.HueSlider.value
        saturation = self.SaturationSlider.value
        value = self.ValueSlider.value

        lamps = bool_array_to_binary( [ self.LampTop.value, self.LampMiddle.value, self.LampDesk.value ] )

        options = " -t %d" % temperature if self.TemperatureMode.value else " -h %d -s %d" % (hue, saturation)

        options += " -v %d -l %d" % (value, lamps)

        os.system("nohup /usr/bin/python3 ~/bin/lamp/set_lamp.py" + options + " &")
        self.parentApp.setNextForm(None)

    def create(self):
        super().create()

        self.PresetLabel = self.add(npyscreen.FixedText, value="Presets")

        for LampColor in LampColors:
            self.add(self.LampColorButton, name=LampColor, parent=self)

        self.TemperatureMode = self.add(self.ColorTypeBox, name="Temperature Mode", parent=self)
        self.RGBMode = self.add(self.ColorTypeBox, name="RGB Mode", parent=self)

        self.TemperatureSlider = self.add(npyscreen.TitleSlider, label=True, name="Temperature", out_of=6500, step=100, lowest=2000)
        self.HueSlider = self.add(npyscreen.TitleSlider, label=True, name="Hue")
        self.SaturationSlider = self.add(npyscreen.TitleSlider, label=True, name="Saturation", step=5)
        self.ValueSlider = self.add(npyscreen.TitleSlider, label=True, name="Value", step=5)
        self.LampTop = self.add(npyscreen.CheckBox, name="Top Lamp")
        self.LampMiddle = self.add(npyscreen.CheckBox, name="Middle Lamp")
        self.LampDesk = self.add(npyscreen.CheckBox, name="Desk Lamp")

        # Default values
        self.TemperatureMode.value = True
        self.TemperatureSlider.value = 6500
        self.ValueSlider.value = 100
        self.LampTop.value = True
        self.LampMiddle.value = True
        self.LampDesk.value = True

class Application(npyscreen.NPSAppManaged):
    def onStart(self):
        npyscreen.setTheme(DefaultTheme)
        self.addForm("MAIN", MainForm, name="Lamp Control")

def bool_array_to_binary(bool):
    val = 0
    for i in range(len(bool)):
        if bool[i] == True:
            val += 2 ** i

    return val

if __name__ == '__main__':
    application = Application().run()
