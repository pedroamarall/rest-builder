#!/bin/bash

cd $(dirname "${0}")

source ../_common.sh

#
# https://www.itzgeek.com/how-tos/linux/fedora-how-tos/install-intellij-idea-on-fedora.html#2_Install_IntelliJ_IDEA_From_Official_Archive
#

rm -fr /opt/java/idea*

download https://download-cdn.jetbrains.com/idea/ideaIC-2022.2.tar.gz

tar fxz data/ideaIC-2022.2.tar.gz -C /opt

ln -fs /opt/idea-IC-222.3345.118 /opt/idea

echo "[Desktop Entry]" > /usr/share/applications/idea.desktop
echo "Exec=\"/opt/idea/bin/idea.sh\" %f" >> /usr/share/applications/idea.desktop
echo "Icon=/opt/idea/bin/idea.svg" >> /usr/share/applications/idea.desktop
echo "Name=IntelliJ" >> /usr/share/applications/idea.desktop
echo "StartupNotify=true" >> /usr/share/applications/idea.desktop
echo "StartupWMClass=jetbrains-idea-ce" >> /usr/share/applications/idea.desktop
echo "Terminal=false" >> /usr/share/applications/idea.desktop
echo "Type=Application" >> /usr/share/applications/idea.desktop