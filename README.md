## Linux userspace audio configuration for Apple Silicon Macs.

Brought to you by the Asahi Linux team.

## Supported Devices

* MacBook Pro (14-inch, 2021)
* MacBook Pro (16-inch, 2021) (_uses same EQ as J314, probably sounds bad!_)

## Prerequisites
* PipeWire
* pipewire-pulse
* WirePlumber (pipewire-media-session is no longer supported)
* The latest linux-asahi kernel
* Audio enabled in your devicetree (read the dislaimer)

## Installation instructions

1. Before playing ANY audio via the internal speakers, ensure that the
drivers are ALL turned down to 70 in `alsamixer`. Failure to do so could
damage your machine. Once this is set, everything else here is
safe.

2. Ensure you have met the prerequisites.

3. Clone this repo and cd into its directory.

3. Run `mac-audio.sh` and follow the instructions.

## How it works
If you were under the impression that society somehow learnt how to
make small speaker cones that sound good, you were mistaken. Small speakers
in devices like laptops and phones still suck as hard as they did 15 years ago.

What has changed is how much computing power is available in these devices. Thanks
to the advent of highly efficient FFT algorithms, we can transform the audio signal
before it gets to the speakers using Impulse Responses, which can be thought of as
the mathematical representation of an EQ curve.

## Why you want it
These Apple Silicon Macs aren't magic. As already discussed, small speakers
will invariably sound like crap if left to their own devices. Apple gets around
this by using Impulse Responses much in the same way we do. Unfortunately, the
way they tuned these machines leaves a lot to be desired.

Luckily, they implemented this in macOS rather than firmware, which means that
we get to roll our own EQ curve for these machines. This lets us tune them for
a much more dynamic, natural sound that you'd expect from expensive professional
machines. This lets us say that we have better audio quality than macOS does!


### Special Thanks:
* povik

* marcan

* whoever implemented the convolver in PipeWire

### Disclaimer
Audio support in Linux is still very much a work in progress. The kernel driver
currently makes no effort to diminish your ability to destroy your machine through
misconfigured settings in userspace. Much like early Chromebooks, it is entirely
possible to overdrive these speakers and amps from userspace such that they
are permanently damaged. If you follow the instructions here, no harm should come
to your machine.
