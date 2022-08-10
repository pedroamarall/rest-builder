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