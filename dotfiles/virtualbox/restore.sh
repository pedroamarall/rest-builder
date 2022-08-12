#!/bin/bash

source ../_common.sh

dnf_add_repo https://download.virtualbox.org/virtualbox/rpm/fedora/virtualbox.repo

dnf_install VirtualBox-6.1