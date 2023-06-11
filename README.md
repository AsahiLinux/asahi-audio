## Linux userspace audio configuration for Apple Silicon Macs.

Brought to you by the Asahi Linux team.

## IMPORTANT
This software is still pre-release and not ready for user consumption or
beta testing. Please do not ask for help with installing this, or enabling
speaker support on your machine. An announcement will be made when speaker
support ready for wider release.

## Supported Devices

* MacBook Pro (14-inch, 2021)
* MacBook Pro (16-inch, 2021) (_uses same EQ as J314, probably sounds bad!_)
* Mac mini (M2 Pro, 2023)

## Prerequisites
* PipeWire
* pipewire-pulse
* WirePlumber with eleven secret herbs and spices
* LSP Plugins (you _must_ have the LV2 set of plugins installed)
* The latest linux-asahi kernel
* Audio enabled in your devicetree (read the dislaimer)

## Why you want it
There are a few reasons why this package is necessary.

ASoC exposes the speaker array as six independent drivers - two woofers and
a tweeter each for Left and Right. We want userspace to see this as a standard
stereo speaker pair. The configuration fragment shipped in this package sets up
a virtual sink that takes a stereo input and routes it appropriately to each driver.

We then run into another issue - the speakers sound awful. Turns out Macs aren't
magic, they sound good because Apple invest a lot of engineering effort into DSP.
Apple actually handle this with odd bespoke Core Audio plugins. We use PipeWire's
convolver plugin to apply impulse responses to each driver, which effectively EQs
the output signals.

### Special Thanks:
* povik

* marcan

* whoever implemented the convolver in PipeWire

### Disclaimer
Speaker support is still a work in progress, and no guarantees as to its safety
or quality are made. As above, no support whatsoever will be provided to users
regarding the installation or use of any speaker-related items until public
support has been announced. You assume all risk to - and responsibility for -
your machine should you choose to try and use the speakers.
