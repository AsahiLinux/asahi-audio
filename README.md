## Linux userspace audio configuration for Apple Silicon Macs.

This repo contains DSP configuration files for Apple Silicon Macs supported by the
Asahi Linux project. Our goal is to make the Asahi Linux audio experience better than macOS,
and in doing so demonstrate that desktop Linux audio can be made fit for purpose with
a little bit of effort.

### Currently Supported Devices
* MacBook Air (13-inch, M1, 2020)
* MacBook Air (13-inch, M2, 2022)
* MacBook Air (15-inch, M2, 2023)
* MacBook Pro (13-inch, M1/M2, 2020/2022)
* MacBook Pro (14-inch, M1/M2 Pro/Max, 2021/2023)
* MacBook Pro (16-inch, M1/M2 Pro/Max, 2021/2023)
* Mac mini (M1/M2/M2 Pro, 2020/2023)
* Mac Studio (M1/M2 Max/Ultra, 2022/2023)

### Dependencies
* speakersafetyd
* linux-asahi 6.6-11 or above
* PipeWire 0.3.85 or above
* WirePlumber 0.4.16 or above
* Bankstown 1.0 or above
* LSP Plugins (only the LV2 set of plugins are used)

### Why this is necessary
Microspeakers are terrible. They are too small to reproduce any substantial bass at all,
and are built too cheaply to behave in a linear fashion. You cannot change the laws of
physics, and this applies universally. Bluetooth speakers, phones, TV, and yes even
Apple's computers all have cheap and bad speakers either due to bill of material
cost constraints, size constraints, or both. Modern Bluetooth speakers, phones, TVs
and Macs often sound quite good, though. How do we explain this?

The answer is DSP. Computing power has become extremely cheap, cheaper than designing
and manufacturing a good speaker. Not only this, but research into acoustics and our
perception of sound (psyhchoacoustics) has been steadily increasing over the past couple
of decades. We simply plaster over the limitations of tiny, cheap speakers by applying
aggressive EQ profiles and other tricks in the digital domain.

In the case of Apple Silicon machines, Apple has taken things one step further by including
_actually good_ speakers on most modern Macs. The 14" MacBook Pro has 6 speakers in it,
designed to be used as a stereo array. macOS can handle this just fine of course, but
what about Linux?

Until now, desktop Linux has not really had support for describing and properly driving
devices like this. It's the reason that some higher-end laptops sound better in Windows -
OEMs work with codec vendors to add all of this processing to their Windows sound drivers.
Obviously, such a solution would never fly for desktop Linux.

We have therefore worked closely with Pipewire and Wireplumber upstream to design a more
flexible, modular solution that can be used by anyone for any device that may require similar
handling, improving the desktop Linux audio experience for everyone.

### How does it work?
Pipewire and Wireplumber are able to create virtual audio devices comprised of a chain of
audio plugins. These virtual devices can be backed by real hardware - a virtual sink can
be set to output to a target sound card, and a virtual source can capture audio from a real
line level input or microphone.

We worked with upstream to enhance this functionality with the ability to automatically
select and load the correct virtual device, and to hide the unusable raw hardware from view.

This repo contains files which describe a virtual device for each supported Mac, as well as
instructions for Wireplumber to load the correct one on startup. It also contains impulse
responses for each Mac which encode the necessary EQ filters. On startup, Pipewire and
Wireplumber detect which Mac they are running on, load in the correct virtual device and impulse
responses, and then hide the "raw" hardware output from the rest of userspace. All your software
sees is a stereo output, and all you hear is quality sound from your Mac running Linux!


### Better than macOS?
While it is evident that Apple put an immense amount of effort into ensuring these
machines sound good, they tried a little _too_ hard...

On top of being tuned for an exaggerated Harman curve, macOS makes use of psychoacoustic bass
enhancement, dynamic range compression, and spatialisation tricks to spice up the acoustic
profile of these machines. Unfortunately not only does this colour the sound
in a way reminiscent of early Beats headphones, Apple actually have a _bug_ in their
psychoacoustic bass processor that causes audible artefacts. This is whole setup is quite
simply unacceptable for anything but the most casual of listening.

We aim to deliver a mostly flat response across the audible range that will faithfully reproduce
source material without adding an excessive amount of colour.
