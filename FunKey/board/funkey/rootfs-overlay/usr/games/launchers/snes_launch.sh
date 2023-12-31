#!/bin/sh

# Launch the process in background, record the PID into a file, wait
# for the process to terminate and erase the recorded PID
#psnes "$1"&
/usr/games/picoarch /usr/lib/libretro/snes9x2005_libretro.so "$1"&
pid record $!
wait $!
pid erase
