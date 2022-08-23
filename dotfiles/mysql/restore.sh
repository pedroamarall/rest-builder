#!/bin/bash

source ../_common.sh

rpm_install mysql80-community-release https://dev.mysql.com/get/mysql80-community-release-fc$(rpm -E %fedora)-1.noarch.rpm

dnf_install mysql-workbench