#!/usr/bin/env python3

# SPDX-License-Identifier: MIT
# (C) 2022 James Calligeros


from shutil import copy2, copytree
from os import system, scandir

def get_system():
    # Use the list of subdirs in 'conf' as our list of supported machines
    supported = []

    for d in scandir('conf'):
        if d.is_dir():
            supported.append(d)

    with open("/sys/firmware/devicetree/base/compatible", "r") as sys:
        sys = sys.read()
        compat = sys[6:11] # Get only the 5 chars after 'apple,'

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
        copy2(f"conf/{system}/sink.conf",
              f"/etc/pipewire/pipewire.conf.d/10-{system}-sink.conf")
    except SameFileError:
        choice = input("Files are identical. Replace? (y/N)")
        if choice == "y":
            system(f"rm -rf /etc/pipewire/pipewire.conf.d/10-{system}-sink.conf")
            copy2(f"conf/{system}/sink.conf",
                  f"/etc/pipewire/pipewire.conf.d/10-{system}-sink.conf")
            return
        else:
            return -1


def install_firs(system):
    try:
        copytree(f"firs/{system}",
                 f"/usr/share/pipewire/devices/apple/{system}")
    except SameFileError:
        choice = input("Files are identical. Replace? (y/N)")
        if choice == "y":
            system(f"rm -rf /usr/share/pipewire/devices/apple/{system}")
            copytree(f"firs/{system}",
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
    print("60 percent in alsamixer. Make sure the 'Amp Gain' sliders are set to")
    print("zero. Do not continue until this has been done.")
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

    print("Restarting PipeWire...\n")
    system("killall pipewire")
    sleep(2) # Wait until PW has actually restarted

    print("A new audio device should now have appeared. Make sure your DE is set")
    print("to use this as the default device for all audio streams. Sometimes,")
    print("a reboot is neccessary for changes to take proper effect.")

if __name__ == "__main__":
    main()
