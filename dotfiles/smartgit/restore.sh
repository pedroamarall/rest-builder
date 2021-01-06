#!/bin/bash

source ../_common.sh

sudo rm -fr /opt/java/smartgit

download https://www.syntevo.com/downloads/smartgit/smartgit-linux-20_1_6.tar.gz

sudo tar fxz data/smartgit-linux-20_1_6.tar.gz -C /opt/java

#rm data/smartgit-linux-20_1_6.tar.gz

sudo bash -c "echo \"-Xmx8192m\" > /opt/java/smartgit/bin/smartgit.vmoptions"

sudo bash -c "echo \"[Desktop Entry]\" > /usr/share/applications/smartgit.desktop"
sudo bash -c "echo \"Exec=/opt/java/smartgit/bin/smartgit.sh\" >> /usr/share/applications/smartgit.desktop"
sudo bash -c "echo \"Icon=/opt/java/smartgit/bin/smartgit-64.png\" >> /usr/share/applications/smartgit.desktop"
sudo bash -c "echo \"Name=SmartGit\" >> /usr/share/applications/smartgit.desktop"
sudo bash -c "echo \"Terminal=false\" >> /usr/share/applications/smartgit.desktop"
sudo bash -c "echo \"Type=Application\" >> /usr/share/applications/smartgit.desktop"
sudo bash -c "echo \"\" >> /usr/share/applications/smartgit.desktop"
sudo bash -c "echo \"Categories=Development\" >> /usr/share/applications/smartgit.desktop"

rm -fr ~/.config/smartgit

cp -R data/smartgit ~/.config

for file_name in ~/.config/smartgit/20.1/*.yml
do
	sed -i s@/home/brian/@/home/me/@ ${file_name}
	sed -i s@/projects/github/@/projects/@ ${file_name}
done