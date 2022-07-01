#!/bin/bash

function test_luks_passphrase {
    local default_luks_password='madeofdust'

    if printf "${default_luks_password}" | sudo cryptsetup luksOpen --test-passphrase /dev/sda2
    then
        lxterminal -t "Change disk encryption password" -e "printf \"Your disk encryption password is still set to the default.\n\" && sudo cryptsetup luksChangeKey /dev/sda2"
    fi
}

function test_user_passphrase {
    local default_user_password='madeofdust'

    if printf "${default_user_password}" | su - me -c "echo" > /dev/null 2>&1
    then
        lxterminal -t "Change user password" -e "printf \"Your user password is still set to the default.\n\" && passwd"
    fi
}

function main {
    test_luks_passphrase
    test_user_passphrase
}

main