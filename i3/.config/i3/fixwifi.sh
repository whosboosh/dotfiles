#!/bin/sh

sudo modprobe -r mwifiex_pcie
sudo modprobe mwifiex_pcie
sudo service network-manager stop
sudo service network-manager start
