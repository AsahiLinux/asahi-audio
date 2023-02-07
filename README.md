## Linux userspace audio configuration for Apple Silicon Macs.

Brought to you by the Asahi Linux team.

## Supported Devices

* MacBook Pro (14-inch, 2021)

## Prerequisites
* PipeWire - **minimum version 0.3.65**
* pipewire-pulse
* WirePlumber
* LSP Plugins (you _must_ have the LV2 set of plugins installed)
* The latest linux-asahi kernel
* Audio enabled in your devicetree (read the dislaimer)

## Installation instructions

1. Ensure you have met the prerequisites.

2. Clone this repo and cd into its directory.

3. Run `mac-audio.sh` and follow the instructions.

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

* d3dx12.xx

### Disclaimer
Audio support in Linux is still very much a work in progress. The kernel driver
currently makes no effort to diminish your ability to destroy your machine through
misconfigured settings in userspace. Much like early Chromebooks, it is entirely
possible to overdrive these speakers and amps from userspace such that they
are permanently damaged. If you follow the instructions here, no harm should come
to your machine.
