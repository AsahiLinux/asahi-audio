#!/bin/bash

# SPDX-License-Identifier: MIT
# (C) 2022 James Calligeros

set -e

if [[ $(whoami) != "root" ]]; then
    echo "This script must be run as root. Please type your root"
    echo "password if prompted to do so."
    sudo ./mac-audio.sh
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
