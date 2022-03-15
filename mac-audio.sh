#!/bin/bash

# SPDX-License-Identifier: MIT
# (C) 2022 James Calligeros

set -e

if [[ $(whoami) != "root" ]]; then
    echo "You must run this script as root."
    exit
fi

echo "We will now set up your Apple Silicon Mac's integrated audio."
echo
read -sp "Press Enter to continue..."

exec python3 install.py
echo "Restarting PipeWire..."
killall pipewire
echo
echo "A new audio device should now be available to route audio."
echo "For best results, make sure your DE selects it as the default"
echo "device. Do not adjust alsamixer from here on out, all volume"
echo "should be controlled via this new device."
exit
