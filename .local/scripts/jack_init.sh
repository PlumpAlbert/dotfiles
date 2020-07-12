#!/bin/sh

# If JACK is not installed or running - exit
jack_control status | grep stopped
[ $? -eq 1 ] && exit

# Audio settings
jack_control start
jack_control ds alsa
jack_control dps device hw:USB
jack_control dps rate 96000
jack_control dps nperiods 2
jack_control dps period 768

# Unload pulseaudio `module-jackdbus-detect`
module="$(pactl list modules | grep -B 1 -i 'module-jackdbus-detect' | grep -o '[[:digit:]]\+')"
pactl unload-module $module

# Unload pulseaudio `module-jack-sink`
module_sink="$(pactl list modules | grep -B 1 -i 'module-jack-sink' | grep -o '[[:digit:]]\+')"
[ -z $module_sink ] && pactl unload-module $module_sink
# Default sink for applications
module_index=$(jsink SystemSounds)
pactl set-default-sink SystemSounds
# Sink for Discord
module_index=$(jsink Discord)

# Unload pulseaudio `module-jack-source`
module_source="$(pactl list modules | grep -B 1 -i 'module-jack-source' | grep -o '[[:digit:]]\+')"
[ -z $module_source ] && pactl unload-module $module_source
module_index=$(jsource Microphone)
pactl set-default-source Microphone

# Connecting clients
## Monitoring microphone
jack_connect system:capture_1 system:playback_1
jack_connect system:capture_1 system:playback_2

## PulseAudio
jack_disconnect system:capture_2 Microphone:front-right
jack_connect system:capture_1 Microphone:front-right
## Streaming system sounds
#jack_connect SystemSounds:front-left Microphone:front-left
#jack_connect SystemSounds:front-right Microphone:front-right

