#!/bin/bash

killall trayer
trayer --monitor 0 --edge top --align right --SetDockType false --SetPartialStrut false --expand true --width 6 --transparent true --alpha 1 --tint 0x2E3440 --height 35 &
trayer --monitor 1 --edge top --align right --SetDockType false --SetPartialStrut false --expand true --width 6 --transparent true --alpha 1 --tint 0x2E3440 --height 35 &