#!/bin/bash

source ../_common.sh

function main {
	#rpm_install SentinelAgent https://storage.googleapis.com/lfr-sentinelone-installer/SentinelAgent_linux_v22_2_1_3.rpm

	#
	# TODO Allow users to disable SentinelOne.
	#

	local serial_number=$(dmidecode -s system-serial-number)

	if [[ -z ${serial_number} ]]
	then
		echo "Unable to determine the serial number."

		exit 1
	fi

	echo sentinelctl management customer_id set "${serial_number}"

	#
	# https://rapidapi.com/blog/ip-geolocation-api
	# https://www.tecmint.com/find-linux-server-geographic-location
	#

	local country_code=$(curl -s https://ipwho.is/$(curl -s https://ipinfo.io/ip) | jq .country_code)

	#
	# https://stackoverflow.com/questions/9733338/shell-script-remove-first-and-last-quote-from-a-variable
	#

	country_code="${country_code%\"}"
	country_code="${country_code#\"}"

	#
	# TODO What about Morocco?
	#

	if [ ${country_code} == "AT" ] ||
	   [ ${country_code} == "CN" ] ||
	   [ ${country_code} == "IN" ] ||
	   [ ${country_code} == "JP" ] ||
	   [ ${country_code} == "SG" ]
	then

		#
		# APAC
		#

		sentinelone_site_token="eyJ1cmwiOiAiaHR0cHM6Ly9ldWNlMS0xMDUuc2VudGluZWxvbmUubmV0IiwgInNpdGVfa2V5IjogImZlNzIxNTRmMjUyZGJkZTUifQ=="
	elif [ ${country_code} == "CZ" ] ||
		 [ ${country_code} == "DE" ] ||
		 [ ${country_code} == "ES" ] ||
		 [ ${country_code} == "FI" ] ||
		 [ ${country_code} == "FR" ] ||
		 [ ${country_code} == "HR" ] ||
		 [ ${country_code} == "HU" ] ||
		 [ ${country_code} == "IT" ] ||
		 [ ${country_code} == "PT" ]
	then

		#
		# EU
		#

		sentinelone_site_token="eyJ1cmwiOiAiaHR0cHM6Ly9ldWNlMS0xMDUuc2VudGluZWxvbmUubmV0IiwgInNpdGVfa2V5IjogIjJjMGZmYTIzMTVhZDVhNTAifQ=="
	elif [ ${country_code} == "BR" ] ||
		 [ ${country_code} == "CL" ] ||
		 [ ${country_code} == "MX" ]
	then

		#
		# LATAM
		#

		sentinelone_site_token="eyJ1cmwiOiAiaHR0cHM6Ly9ldWNlMS0xMDUuc2VudGluZWxvbmUubmV0IiwgInNpdGVfa2V5IjogImM3YzIyM2Q3NDUwMDY0YWYifQ=="
	elif [ ${country_code} == "CA" ] ||
		 [ ${country_code} == "US" ]
	then

		#
		# US
		#

		sentinelone_site_token="eyJ1cmwiOiAiaHR0cHM6Ly9ldWNlMS0xMDUuc2VudGluZWxvbmUubmV0IiwgInNpdGVfa2V5IjogIjBjMmI4ZDhmZDIzZDBmZGEifQ=="
	else
		echo "Unable to determine SentinelOne site token."

		exit 1
	fi

	echo "Register SentinelOne for ${country_code}."

	echo sentinelctl management token set ${sentinelone_site_token}
}

main