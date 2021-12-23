#!/bin/bash

source ../_common.sh

#
# https://forum.sublimetext.com/t/fedora-25-sublime-text-3-install/24911/2
#

sudo rm -fr ~/.config/sublime-text
sudo rm -fr /opt/sublime_text

download https://download.sublimetext.com/sublime_text_build_4126_x64.tar.xz

sudo tar fx data/sublime_text_build_4126_x64.tar.xz -C /opt

#
# Add desktop shortcut.
#

sudo cp /opt/sublime_text/sublime_text.desktop /usr/share/applications

sudo sed -i "s@Icon=sublime-text@Icon=/opt/sublime_text/Icon/256x256/sublime-text.png@" /usr/share/applications/sublime_text.desktop

#
# Register license.
#

mkdir -p ~/.config/sublime-text/Local

cp data/License.sublime_license ~/.config/sublime-text/Local

#
# Install Pretty JSON.
#

git clone https://github.com/dzhibas/SublimePrettyJson.git "Pretty JSON"

cd "Pretty JSON"

git checkout st3

cd ..

mkdir -p ~/.config/sublime-text/Packages

mv "Pretty JSON" ~/.config/sublime-text/Packages

#
# Copy settings.
#

mkdir -p ~/.config/sublime-text/Packages/User

cp data/*.sublime-keymap ~/.config/sublime-text/Packages/User
cp data/*.sublime-settings ~/.config/sublime-text/Packages/User