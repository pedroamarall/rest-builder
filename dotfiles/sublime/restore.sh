#!/bin/bash

cd $(dirname "${0}")

source ../_common.sh

#
# https://forum.sublimetext.com/t/fedora-25-sublime-text-3-install/24911/2
#

rm -fr /home/me/.config/sublime-text
rm -fr /opt/sublime_text

download https://download.sublimetext.com/sublime_text_build_4126_x64.tar.xz

tar fx data/sublime_text_build_4126_x64.tar.xz -C /opt

#
# Add desktop shortcut.
#

cp /opt/sublime_text/sublime_text.desktop /usr/share/applications

sed -i "s@Icon=sublime-text@Icon=/opt/sublime_text/Icon/256x256/sublime-text.png@" /usr/share/applications/sublime_text.desktop

#
# Register license.
#

run_as_me mkdir -p /home/me/.config/sublime-text/Local

run_as_me cp data/License.sublime_license /home/me/.config/sublime-text/Local

#
# Install Pretty JSON.
#

run_as_me git clone https://github.com/dzhibas/SublimePrettyJson.git "Pretty JSON"

cd "Pretty JSON"

run_as_me git checkout st3

cd ..

run_as_me mkdir -p /home/me/.config/sublime-text/Packages

run_as_me mv "Pretty JSON" /home/me/.config/sublime-text/Packages

#
# Copy settings.
#

run_as_me mkdir -p /home/me/.config/sublime-text/Packages/User

run_as_me cp data/*.sublime-keymap /home/me/.config/sublime-text/Packages/User
run_as_me cp data/*.sublime-settings /home/me/.config/sublime-text/Packages/User