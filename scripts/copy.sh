#!/bin/sh

ls $HOME/Downloads/cookies*txt | tofi | xargs -I%% cat %% | wl-copy
