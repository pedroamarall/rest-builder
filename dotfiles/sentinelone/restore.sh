#!/bin/bash

cd $(dirname "${0}")

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

	echo ${country_code}
}

function get_sentinelone_site_token {
	if [ ${1} == "AT" ] ||
	   [ ${1} == "CN" ] ||
	   [ ${1} == "IN" ] ||
	   [ ${1} == "JP" ] ||
	   [ ${1} == "SG" ]
	then

		#
		# APAC
		#

		echo "eyJ1cmwiOiAiaHR0cHM6Ly9ldWNlMS0xMDUuc2VudGluZWxvbmUubmV0IiwgInNpdGVfa2V5IjogImZlNzIxNTRmMjUyZGJkZTUifQ=="
	elif [ ${1} == "MA" ]
	then

		#
		# EMEA
		#

		echo "eyJ1cmwiOiAiaHR0cHM6Ly9ldWNlMS0xMDUuc2VudGluZWxvbmUubmV0IiwgInNpdGVfa2V5IjogImI4ZTUxMDkwYmMyMmIwMzkifQ=="
	elif [ ${1} == "CZ" ] ||
		 [ ${1} == "DE" ] ||
		 [ ${1} == "ES" ] ||
		 [ ${1} == "FI" ] ||
		 [ ${1} == "FR" ] ||
		 [ ${1} == "HR" ] ||
		 [ ${1} == "HU" ] ||
		 [ ${1} == "IT" ] ||
		 [ ${1} == "PT" ]
	then

		#
		# EU
		#

		echo "eyJ1cmwiOiAiaHR0cHM6Ly9ldWNlMS0xMDUuc2VudGluZWxvbmUubmV0IiwgInNpdGVfa2V5IjogIjJjMGZmYTIzMTVhZDVhNTAifQ=="
	elif [ ${1} == "BR" ] ||
		 [ ${1} == "CL" ] ||
		 [ ${1} == "MX" ]
	then

		#
		# LATAM
		#

		echo "eyJ1cmwiOiAiaHR0cHM6Ly9ldWNlMS0xMDUuc2VudGluZWxvbmUubmV0IiwgInNpdGVfa2V5IjogImM3YzIyM2Q3NDUwMDY0YWYifQ=="
	elif [ ${1} == "CA" ] ||
		 [ ${1} == "US" ]
	then

		#
		# US
		#

		echo "eyJ1cmwiOiAiaHR0cHM6Ly9ldWNlMS0xMDUuc2VudGluZWxvbmUubmV0IiwgInNpdGVfa2V5IjogIjBjMmI4ZDhmZDIzZDBmZGEifQ=="
	fi
}

function get_serial_number {
	echo $(dmidecode -s system-serial-number)
}

function main {
	if [ -e /opt/sentinelone/bin/sentinelctl ]
	then
		echo "SentinelOne is already installed."

		exit 0
	fi

	local country_code=$(get_country_code)

	if [[ -z ${country_code} ]]
	then
		echo "Unable to determine the country code."

		exit 1
	fi

	local sentinelone_site_token=$(get_sentinelone_site_token ${country_code})

	if [[ -z ${sentinelone_site_token} ]]
	then
		echo "Unable to determine SentinelOne site token."

		exit 1
	fi

	local serial_number=$(get_serial_number)

	if [[ -z ${serial_number} ]]
	then
		echo "Unable to determine the serial number."

		exit 1
	fi

	rpm_install SentinelAgent https://storage.googleapis.com/lfr-sentinelone-installer/SentinelAgent_linux_v22_2_1_3.rpm

	echo "me ALL=(root) /opt/sentinelone/bin/sentinelctl" > /etc/sudoers.d/sentinelctl

	echo "Register SentinelOne with serial number ${serial_number}."

	sentinelctl management customer_id set "${serial_number}"

	echo "Register SentinelOne for country ${country_code} with token ${sentinelone_site_token}."

	sentinelctl management token set ${sentinelone_site_token}

	/opt/sentinelone/bin/sentinelctl control start
}

main