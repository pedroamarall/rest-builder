#!/bin/bash

source ../_common.sh

sudo bash -c "echo \"[code]\" > /etc/yum.repos.d/vscode.repo"
sudo bash -c "echo \"name=Visual Studio Code\" >> /etc/yum.repos.d/vscode.repo"
sudo bash -c "echo \"baseurl=https://packages.microsoft.com/yumrepos/vscode\" >> /etc/yum.repos.d/vscode.repo"
sudo bash -c "echo \"enabled=1\" >> /etc/yum.repos.d/vscode.repo"
sudo bash -c "echo \"gpgcheck=1\" >> /etc/yum.repos.d/vscode.repo"
sudo bash -c "echo \"gpgkey=https://packages.microsoft.com/keys/microsoft.asc\" >> /etc/yum.repos.d/vscode.repo"

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc

dnf_install code