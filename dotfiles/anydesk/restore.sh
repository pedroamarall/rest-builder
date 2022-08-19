#!/bin/bash

source ../_common.sh

#
# https://computingforgeeks.com/how-to-install-anydesk-on-fedora-linux
#

#sudo tee /etc/yum.repos.d/AnyDesk-Fedora.repo <<EOF
#[anydesk]
#baseurl=http://rpm.anydesk.com/fedora/x86_64/
#gpgcheck=0
#gpgkey=https://keys.anydesk.com/repos/RPM-GPG-KEY
#name=AnyDesk Fedora - stable
#repo_gpgcheck=0
#EOF

#
# https://www.reddit.com/r/Fedora/comments/vnfpil/comment/ig1c5zn
#

dnf_install gtkglext-libs minizip-compat

#
# https://ask.fedoraproject.org/t/solved-libpangox-1-0-is-missing-in-fedora-34/16018
#

rpm_install https://kojipkgs.fedoraproject.org//packages/pangox-compat/0.0.2/15.fc31/x86_64/pangox-compat-0.0.2-15.fc31.x86_64.rpm

#
# https://www.reddit.com/r/Fedora/comments/vnfpil/fedora_36_error_updating_anydesk
#

rpm_install https://download.anydesk.com/linux/anydesk_6.1.1-1_x86_64.rpm
#dnf_install anydesk redhat-lsb-core