#!/bin/sh

# Launch the process in background, record the PID into a file, wait
# for the process to terminate and erase the recorded PID
# Do not use asound.conf to avoid saturated sound
/usr/games/picoarch /usr/lib/libretro/gpsp_libretro.so "$1"&
pid record $!
wait $!
pid erase
