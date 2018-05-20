#!/usr/bin/env bash
set -e

# Tell Electron to use this display
export DISPLAY=':99.0'

screen=${XVFB_SCREEN:-800x600x8}

# Start Xvfb
echo "Screen : $screen"
Xvfb :99 -screen 0 "$screen" &
echo "Xvfb is running - pid : $!"

exec "$@"
