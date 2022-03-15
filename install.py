#!/usr/bin/env python3

# SPDX-License-Identifier: MIT
# (C) 2022 James Calligeros


from shutil import copy2, copytree
from os import system

def get_system():
    '''
    Get the system compatible string from the DT.

    We only want the model number, which is the 5 characters after "apple,"
    '''
    with open("/sys/firmware/devicetree/base/compatible", "r") as sys
        sys = sys.read()
        system_compatible = sys[6:11]

    return system_compatible


def set_dev_profile(system):
    ret = copy2(f"conf/{system}/session.conf",
                f"/etc/pipewire/media-session.d/10-{system}.conf")

    return ret


def install_pw_conf(system):
    '''
    Install the system-depdent PipeWire config file

    Since the audio stack is dumb and cannot pick and choose configurations
    for us on the fly, we must install a specific configuration based on the
    user's machine. Luckily, it's all pretty trivial stuff.
    '''

    ret = copy2(f"conf/{system}/sink.conf",
                f"/etc/pipewire/pipewire.conf.d/10-{system}-sink.conf")

    return ret


def install_firs(system)

    ret = copytree(f"firs/{system}", "/usr/share/alsa/impulse/apple/")
    return ret


def main():
    machine = get_system()

    print(f"This machine is a {machine}.\n")

    print("Before we continue, please ensure that you have set every speaker to")
    print("60 percent in alsamixer. Make sure the 'Amp Gain' sliders are set to")
    print("zero. Do not continue until this has been done.")
    input("Press Enter to continue...")

    print("Setting device profile to Pro Audio...")
    set_dev_profile(machine)

    print("Installing PipeWire configuration files...")
    install_pw_conf(machine)

    print("Installing Finite Impulse Responses...")
    install_firs(machine)

if __name__ == "__main__":
    main()
