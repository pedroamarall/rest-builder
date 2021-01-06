#!/bin/bash

source ../_common.sh

sudo rpm --import https://zoom.us/linux/download/pubkey

dnf_install libxkbcommon-x11 xcb-util-image xcb-util-keysyms

rpm_install https://zoom.us/client/latest/zoom_x86_64.rpm