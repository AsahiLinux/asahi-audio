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
echo

if [[ -d /usr/share/pipewire/devices/apple/ ]]; then
    echo "Installation directory already exists."
else
    echo "Install directory does not exist. Creating..."
    mkdir -p /usr/share/pipewire/devices/apple/
fi

if [[ -d /etc/pipewire/media-session.d/ ]]; then
    echo "Session manager dir already exists."
else
    echo "Session manager directory does not exist. Creating..."
    mkdir -p /etc/pipewire/media-session.d/
fi

python3 install.py

echo "Restarting PipeWire..."
killall pipewire

echo
echo "A new audio device should now be available to route audio."
echo "For best results, make sure your DE selects it as the default"
echo "device. Do not adjust alsamixer from here on out, all volume"
echo "should be controlled via this new device."
echo
echo "Rebooting is highly encouraged and sometimes required to ensure"
echo "all changes take effect."
echo
exit
