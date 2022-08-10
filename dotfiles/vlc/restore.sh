#!/bin/bash

source ../_common.sh

dnf_install vlc

restore_from_original /usr/share/applications/vlc.desktop

sed -i "s/VLC media player/VLC Media Player/" /usr/share/applications/vlc.desktop