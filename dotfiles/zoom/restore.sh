#!/bin/bash

cd $(dirname "${0}")

source ../_common.sh

rpm --import https://zoom.us/linux/download/pubkey

dnf_install libxkbcommon-x11 xcb-util-image xcb-util-keysyms

rpm_install zoom https://zoom.us/client/latest/zoom_x86_64.rpm