#!/bin/bash

PLAYLIST_FLAGS="--random --loop"
PLAYLIST_FILE=/radio/playlist.xspf

SCRIPT=$(readlink -f $0)
SCRIPTPATH=`dirname $SCRIPT`

#sudo -u radio cvlc $PLAYLIST_FILE $PLAYLIST_FLAGS --sout "#transcode{acodec=s16l,channels=1,samplerate=22050}:std{access=file,mux=wav,dst=-}" -I http --rc-host 10.10.99.45:8080 | sudo nice -n -20 pifm - 100

sudo -u radio cvlc $PLAYLIST_FILE $PLAYLIST_FLAGS --sout "#transcode{acodec=s16l,channels=1,samplerate=96000}:std{access=file,mux=wav,dst=-}" -I http --rc-host 10.10.99.45:8080 | sudo nice -n -20 pifm - 100 96000

#vlc --sout "#transcode{acodec=s16l,channels=1,samplerate=22050}:std{access=file,mux=wav,dst=-}" -I http --rc-host 10.10.99.45:8080 | sudo nice -n -20 ./pifm - 100
