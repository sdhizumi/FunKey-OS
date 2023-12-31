#!/bin/sh

# Launch the process in background, record the PID into a file, wait
# for the process to terminate and erase the recorded PID
#PicoDrive "$1"&
/usr/games/picoarch /usr/lib/libretro/picodrive_libretro.so "$1"&
pid record $!
wait $!
pid erase
