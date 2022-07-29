#!/bin/bash

source ../_common.sh

function main {
	#rpm_install SentinelAgent https://storage.googleapis.com/lfr-sentinelone-installer/SentinelAgent_linux_v22_2_1_3.rpm

	local serial_number=$(dmidecode -s system-serial-number)

	if [[ -z ${serial_number} ]]
	then
		echo "Unable to determine the serial number."

		exit 1
	fi

	echo sentinelctl management customer_id set "${serial_number}"

	local ips=($(hostname -I))

	local sentinelone_site_token

	for ip in "${ips[@]}"
	do
		if [[ $ip == 172.168.121.* ]]
		then

			#
			# APAC
			#

			sentinelone_site_token="eyJ1cmwiOiAiaHR0cHM6Ly9ldWNlMS0xMDUuc2VudGluZWxvbmUubmV0IiwgInNpdGVfa2V5IjogImZlNzIxNTRmMjUyZGJkZTUifQ=="


			break
		elif [[ $ip == 192.168.121.* ]]
		then

			#
			# EU
			#

			sentinelone_site_token="eyJ1cmwiOiAiaHR0cHM6Ly9ldWNlMS0xMDUuc2VudGluZWxvbmUubmV0IiwgInNpdGVfa2V5IjogIjJjMGZmYTIzMTVhZDVhNTAifQ=="

			break
		elif [[ $ip == 192.168.121.* ]]
		then

			#
			# LATAM
			#

			sentinelone_site_token="eyJ1cmwiOiAiaHR0cHM6Ly9ldWNlMS0xMDUuc2VudGluZWxvbmUubmV0IiwgInNpdGVfa2V5IjogImM3YzIyM2Q3NDUwMDY0YWYifQ=="

			break
		elif [[ $ip == 192.168.121.* ]]
		then

			#
			# US
			#

			sentinelone_site_token="eyJ1cmwiOiAiaHR0cHM6Ly9ldWNlMS0xMDUuc2VudGluZWxvbmUubmV0IiwgInNpdGVfa2V5IjogIjBjMmI4ZDhmZDIzZDBmZGEifQ=="

			break
		else
			echo "Unable to determine SentinelOne site token."

			exit 1
		fi
	done

	echo sentinelctl management token set ${sentinelone_site_token}
}

main