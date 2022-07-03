#!/usr/bin/env python3

# SPDX-License-Identifier: MIT
# (C) 2022 James Calligeros


import os
import shutil
import time

def get_system():
    # Use the list of subdirs in 'conf' as our list of supported machines
    supported = os.listdir(path="./conf/")

    # Get rid of '.conf'
    for i, machine in enumerate(supported):
        supported[i] = machine[0:4]

    with open("/sys/firmware/devicetree/base/compatible", "r") as sys:
        sys = sys.read()
        compat = sys[6:10] # Get only the 4 chars after 'apple,'

        if compat in supported:
            return compat
        else:
            return -1


def install_pw_conf(system):
    '''
    Since the audio stack is dumb and cannot pick and choose configurations
    for us on the fly, we must install a specific configuration based on the
    user's machine. Luckily, it's all pretty trivial stuff.
    '''
    try:
        shutil.copy2(f"conf/{system}.conf",
                     f"/etc/pipewire/pipewire.conf.d/10-{system}-sink.conf")
    except FileExistsError:
        choice = input("Files are identical. Replace? (y/N)")
        if choice == "y":
            os.remove(f"/etc/pipewire/pipewire.conf.d/10-{system}-sink.conf")
            shutil.copy2(f"conf/{system}.conf",
                         f"/etc/pipewire/pipewire.conf.d/10-{system}-sink.conf")
            return
        else:
            return -1


def install_firs(system):
    try:
        shutil.copytree(f"firs/{system}",
                        f"/usr/share/pipewire/devices/apple/{system}")
    except FileExistsError:
        choice = input("Files are identical. Replace? (y/N)")
        if choice == "y":
            shutil.rmtree(f"/usr/share/pipewire/devices/apple/{system}")
            shutil.copytree(f"firs/{system}",
                            f"/usr/share/pipewire/devices/apple/{system}")
            return
        else:
            return -1


def main():
    machine = get_system()

    if machine == -1:
        print(f"Sorry, the {machine} is not currently supported.")
        exit()

    print(f"This machine is a {machine}.\n")

    print("Before we continue, please ensure that you have set every speaker to")
    print("70 percent in alsamixer. Do not touch the 'Amp Gain' sliders or any")
    print("other setting.")
    input("Press Enter to continue...")

    print("Installing PipeWire configuration files...\n")
    pwret = install_pw_conf(machine)
    if pwret == -1:
        print("Could not install PipeWire configuration files.")
        print("This program will now exit.")
        exit()

    print("Installing Finite Impulse Responses...\n")
    irret = install_firs(machine)
    if irret == -1:
        print("Could not install FIRs.")
        print("This program will now exit.")
        exit()


    print("Please put the current built-in audio device into the Pro Audio")
    print("profile. Do not continue until you have done this.")
    input("Press Enter to continue...\n")

    print("Killing PipeWire...\n")
    os.system("killall pipewire")
    time.sleep(2)

    print("PipeWire has been stopped. Please reboot your machine for the")
    print("changes to take effect. Logging out and logging in again is not")
    print("sufficient.")

if __name__ == "__main__":
    main()
