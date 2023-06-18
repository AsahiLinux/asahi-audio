## Linux userspace audio configuration for Apple Silicon Macs.

Brought to you by the Asahi Linux team. Our goal is to provide a
(subjectively) better-than-macOS audio experience on Apple Silicon
Macs, and in doing so demonstrate that userspace audio management
on Linux does not _need_ to suck in 2023.

### IMPORTANT
This software is still pre-release and not ready for user consumption or
beta testing. As it exists in this repo, it is deliberately non-functional
to prevent intrepid users from damaging their machines. Please do not ask for
help with installing this, or enabling speaker support on your machine. An
announcement will be made when speaker support is ready for wider release.

### Supported Devices
* MacBook Pro (14-inch, 2021)
* MacBook Pro (16-inch, 2021) (_uses same EQ as J314, probably sounds bad!_)
* All Mac mini models

### Dependencies
* PipeWire
* pipewire-pulse
* WirePlumber with eleven secret herbs and spices
* LSP Plugins (you _must_ have the LV2 set of plugins installed)
* The latest linux-asahi kernel
* speakersafetyd
* Audio enabled in your devicetree (read the dislaimer)

### Why this is necessary
Modern microspeakers aren't any better than microspeakers from
20 years ago. What has improved is our ability to paper over
their shortcomings with digital signal processing.

This package applies EQ to the speakers in the form of an
impulse response which acts over the input signal. It also
performs some light-touch dynamics shaping to prevent
overexcursion and make the volume range more natural.

### Better than macOS?
It is our opinion that the tuning applied by Apple is, while technically
impressive, too tryhard. Apple make liberal use of psychoacoustics, fancy
phasing, equal-loudness curves and other tricks to extend the bass response,
widen the stereo image, and implement virtual surround. While this is appealing
to a certain class of consumer, it renders the machines useless for professional
use as the sound is too far from reference. Their psychoacoustic bass implementation
is also prone to saturation artefacts at high volumes.

We believe that delivering a simpler, natural-sounding stereo system will not only
more accurately reproduce source material, but will be a more enjoyable listening
experience for a wider cross-section of users.

### Disclaimer
Speaker support is still a work in progress, and no guarantees as to its safety
or quality are made. As above, no support whatsoever will be provided to users
regarding the installation or use of any speaker-related items until public
support has been announced. You assume all risk to - and responsibility for -
your machine should you choose to try and use the speakers.
