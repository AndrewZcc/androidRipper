#!/bin/bash

source ~/.profile

android delete avd -n RipperDevice
android create avd -n RipperDevice -t android-17 -c 1024M -b armeabi-v7a
emulator -avd RipperDevice
