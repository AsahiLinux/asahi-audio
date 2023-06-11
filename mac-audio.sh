#!/bin/bash

# SPDX-License-Identifier: MIT
# (C) 2022 James Calligeros

set -e

if [[ $(whoami) != "root" ]]; then
    echo "This script must be run as root. Please type your root"
    echo "password if prompted to do so."
    sudo ./mac-audio.sh
else
    echo "We will now set up your Apple Silicon Mac's integrated audio."
    echo
    read -sp "Press Enter to continue..."
    echo

    if [[ -d /usr/share/asahi-audio/ ]]; then
        echo "Installation directory already exists."
    else
        echo "Install directory does not exist. Creating..."
        mkdir -p /usr/share/asahi-audio/
    fi

    if [[ ! -d /etc/pipewire/ ]]; then
        echo "Creating default Pipewire configuration directory..."
        mkdir -p /etc/wireplumber/policy.lua.d/
    else
        if [[ ! -d /etc/wireplumber/policy.lua.d/ ]]; then
            echo "Creating pipewire.conf.d..."
            mkdir -p /etc/wireplumber/policy.lua.d/
        fi
    fi

    python3 install.py


fi

