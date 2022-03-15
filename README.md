## Linux userspace audio configuration for Apple Silicon Macs.

Brought to you by the Asahi Linux team.

We hope that with this project, we can demonstrate that audio under Linux does
not actually need to suck. We aim to bring a better-than-macOS audio experience
to Linux on these machines.

## Supported Devices

* MacBook Pro (14-inch, 2021)
* MacBook Pro (16-inch, 2021) _Uses same profile as 14-inch, may be sub-optimal_

## How it works
If you were under the impression that society somehow learnt how to
make small speaker cones that sound good, you were mistaken. Small speakers
in devices like laptops and phones still suck as hard as they did 15 years ago.

What we are able to do now, however, is apply very complex transformations to
the audio signal to compensate for the shortcomings of these speakers. We call
these Impulse Responses. These are a essentially a waveform one sample long
that is mixed in realtime with each each sample being sent to the physical
speaker. This kind of DSP is now possible in software with negligible resource
consumption thanks to well optimised and extremely quick FFT algorithms.

## Why you want it
If you've ever put Linux on a laptop or wiped the OEM Windows install that
came with it, you may have noticed that the speakers start sounding like crap.
 Most vendors apply their secret sauce DSP in software. The good news
is that it is possible for someone with access to some basic tools and knowledge of audio to do it themselves and make these devices sound good again!

In the case of Apple Silicon Macs, it is a good thing that Apple does their
DSP in software. On the 14-inch MacBook Pro for example, the low mids end up
smushed by an overly bombastic bass response that still feels flat. Treble
is de-emphasised so that the speakers sound "fuller" by causing the low mids
to appear louder. This is a common trick in lower-end consumer gear, as bumping
up that low-end response can help to mask the effects of low-quality digital
compression and resampling, as well as poor recording and mastering. It is,
however, a trick unbecoming of a device with "Pro" in its name.

By discarding Apple's DSP, we are able to offer a professional audio
experience via the built in speakers by applying our own FIRs that
result in a fairly neutral and linear sound profile. By doing this, we
can leave it up to each user to colour the sound to their own tastes
if so desired, while also providing a more useable sound system for
people who actually want to use these machines as the professional workstations
they are more than capable of being.

## Prerequisites
* PipeWire
* pipewire-pulse
* pipewire-media-session (_do not use WirePlumber unless you know what you are doing_)
* The latest linux-asahi kernel

## Installation instructions

1. Before playing ANY audio via the internal speakers, ensure that the
drivers are ALL turned down to 60 in `alsamixer`. Failure to do so could
make your speakers explode. Once this is set, everything else here is
safe.

2. Ensure you have met the prerequisites.

3. Clone this repo and cd into its directory.

3. Run `mac-audio.sh` and follow the instructions.

4. Enjoy a professional audio experience on your Apple Silicon Mac!



Special Thanks:
* povik:  for a working kernel driver

* marcan: for putting up with my insane ramblings on the state of the
GNU/Linux audio stack in #asahi-dev

* whoever decided that PipeWire needed a built in convolver
