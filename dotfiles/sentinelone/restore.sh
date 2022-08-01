#!/bin/bash

source ../_common.sh

function get_country_code {
	#
	# https://ipregistry.co/docs/filtering
	# https://rapidapi.com/blog/ip-geolocation-api
	# https://www.tecmint.com/find-linux-server-geographic-location
	#

	local country_code=$(curl -s "https://ipwho.is/$(curl -s https://ipinfo.io/ip)" | jq .country_code)

	#
	# The Ipregistry key is registered to github.com/brianchandotcom for 100k free calls.
	#

	#local country_code=$(curl -s "https://api.ipregistry.co/?key=xc7twk3rnen75w1p&fields=location.country" | jq .location.country.code)

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

	echo ${country_code}
}

function get_serial_number {
	local serial_number=$(dmidecode -s system-serial-number)

	if [[ -z ${serial_number} ]]
	then
		echo "Unable to determine the serial number."

		exit 1
	fi

	echo ${serial_number}
}

function main {
	if [ -e /opt/sentinelone/bin/sentinelctl ]
	then
		echo exit 0
	fi

	local country_code=$(get_country_code)
	local serial_number=$(get_serial_number)

	rpm_install SentinelAgent https://storage.googleapis.com/lfr-sentinelone-installer/SentinelAgent_linux_v22_2_1_3.rpm

	echo "me ALL=(root) /opt/sentinelone/bin/sentinelctl" > /etc/sudoers.d/sentinelctl

	echo "Register SentinelOne with serial number ${serial_number}."

	sentinelctl management customer_id set "${serial_number}"

	echo "Register SentinelOne with token for country ${country_code}."

	sentinelctl management token set ${sentinelone_site_token}

	echo /opt/sentinelone/bin/sentinelctl control start
}

main