#!/bin/bash

ssh ryan@ssh.rhellwege.xyz ffmpeg -an -f video4linux2 -s 640x480 -i /dev/video0 -r 5 -b:v 200k -f matroska - | mpv --demuxer=mkv /dev/stdin

# with audio
#ssh ryan@192.168.7.200 ffmpeg -f alsa -acodec pcm_s32le -ar 48000 -ac 1 -i hw:3,0 -f video4linux2 -s 640x480 -i /dev/video0 -r 5 -b:v 200k -f matroska - | mpv --demuxer=mkv /dev/stdin
