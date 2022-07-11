#!/bin/bash

function test_luks_passphrase {
    local default_luks_password='madeofdust'
    local default_luks_device="$(lsblk -lo PATH,FSTYPE | grep crypto_LUKS | awk '{print $1}')"

    if printf "${default_luks_password}" | sudo cryptsetup luksOpen --test-passphrase "${default_luks_device}"
    then
        lxterminal -t "Change disk encryption password" -e "printf \"Your disk encryption password is still set to the default.\n\" && sleep infinity"
    fi
}

function test_user_passphrase {
    local default_user_password='madeofdust'

    if printf "${default_user_password}" | su - me -c "echo" > /dev/null 2>&1
    then
        lxterminal -t "Change user password" -e "printf \"Your user password is still set to the default.\n\" && sleep infinity"
    fi
}

function main {
    test_luks_passphrase
    test_user_passphrase
}

main