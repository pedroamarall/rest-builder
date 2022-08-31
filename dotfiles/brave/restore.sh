#!/bin/bash

cd $(dirname "${0}")

source ../_common.sh

#
# https://brave.com/linux
#

dnf_add_repo https://brave-browser-rpm-release.s3.brave.com/x86_64

rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc

dnf_install brave-browser