#!/bin/bash

source ../_common.sh

#
# https://www.if-not-true-then-false.com/2010/install-google-chrome-with-yum-on-fedora-red-hat-rhel
#

sudo bash -c "echo \"[google-chrome]\" > /etc/yum.repos.d/google-chrome.repo"
sudo bash -c "echo \"name=google-chrome - \\\$basearch\" >> /etc/yum.repos.d/google-chrome.repo"
sudo bash -c "echo \"baseurl=http://dl.google.com/linux/chrome/rpm/stable/\\\$basearch\" >> /etc/yum.repos.d/google-chrome.repo"
sudo bash -c "echo \"enabled=1\" >> /etc/yum.repos.d/google-chrome.repo"
sudo bash -c "echo \"gpgcheck=1\" >> /etc/yum.repos.d/google-chrome.repo"
sudo bash -c "echo \"gpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub\" >> /etc/yum.repos.d/google-chrome.repo"

sudo rpm --import https://dl-ssl.google.com/linux/linux_signing_key.pub

dnf_install google-chrome-stable