#!/bin/bash

source ../_common.sh

echo "[ms-teams]" > /etc/yum.repos.d/ms-teams.repo
echo "name=Microsoft Teams" >> /etc/yum.repos.d/ms-teams.repo
echo "baseurl=https://packages.microsoft.com/yumrepos/ms-teams" >> /etc/yum.repos.d/ms-teams.repo
echo "enabled=1" >> /etc/yum.repos.d/ms-teams.repo
echo "gpgcheck=1" >> /etc/yum.repos.d/ms-teams.repo
echo "gpgkey=https://packages.microsoft.com/keys/microsoft.asc" >> /etc/yum.repos.d/ms-teams.repo

rpm --import https://packages.microsoft.com/keys/microsoft.asc

dnf_install teams

restore_from_original /usr/share/applications/teams.desktop

sed -i "s/Name=Microsoft Teams - Preview/Name=Microsoft Teams/" /usr/share/applications/teams.desktop

#
# https://docs.microsoft.com/en-us/answers/questions/660372/why-is-ms-teams-autostarting-with-no-option-to-dis.html
#

rm -f /home/me/.config/autostart/teams.desktop

touch /home/me/.config/autostart/teams.desktop