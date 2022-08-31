#!/bin/bash

# TODO Upgrade SmartGit and license

cd $(dirname "${0}")

source ../_common.sh

rm -fr /opt/smartgit

download https://www.syntevo.com/downloads/smartgit/smartgit-linux-20_1_6.tar.gz

tar fxz data/smartgit-linux-20_1_6.tar.gz -C /opt

#rm data/smartgit-linux-20_1_6.tar.gz

echo "-Xmx8192m" > /opt/smartgit/bin/smartgit.vmoptions

echo "[Desktop Entry]" > /usr/share/applications/smartgit.desktop
echo "Exec=/opt/smartgit/bin/smartgit.sh" >> /usr/share/applications/smartgit.desktop
echo "Icon=/opt/smartgit/bin/smartgit-64.png" >> /usr/share/applications/smartgit.desktop
echo "Name=SmartGit" >> /usr/share/applications/smartgit.desktop
echo "Terminal=false" >> /usr/share/applications/smartgit.desktop
echo "Type=Application" >> /usr/share/applications/smartgit.desktop
echo "" >> /usr/share/applications/smartgit.desktop
echo "Categories=Development" >> /usr/share/applications/smartgit.desktop

rm -fr /home/me/.config/smartgit

run_as_me cp -R data/smartgit /home/me/.config

for file_name in /home/me/.config/smartgit/20.1/*.yml
do
	sed -i s@/home/brian/@/home/me/@ ${file_name}
	sed -i s@/projects/github/@/projects/@ ${file_name}
done