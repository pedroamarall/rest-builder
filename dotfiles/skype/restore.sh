#!/bin/bash

source ../_common.sh

#
# https://ask.fedoraproject.org/en/question/8738/sticky-how-do-i-install-skype-on-fedora
#

dnf_add_repo https://repo.skype.com/data/skype-stable.repo

dnf_install skypeforlinux