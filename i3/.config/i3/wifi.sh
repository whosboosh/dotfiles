#!/bin/bash

sudo iw dev wlp2s0 scan | grep SSID
sudo wifi-menu -o
