#!/bin/sh

# If JACK is not installed or running - exit
jack_control stop

# Audio settings
jack_control start
jack_control ds alsa
jack_control dps device 'hw:USB,0'
jack_control dps rate 48000
jack_control dps nperiods 2
jack_control dps period 512

# Kill any running PulseAudio daemon
pulseaudio -k
sleep 1s
# Start PulseAudio
pulseaudio -D -F "$HOME/.config/pulse/config.pa"
# Unload pulseaudio `module-jackdbus-detect`
pactl unload-module "$(pactl list short modules | grep -i 'module-jackdbus-detect' | cut -f1)"


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

