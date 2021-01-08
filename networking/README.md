# Networking

## NCMLI

1. What is my IP?

	1. Use Chrome to open https://www.whatismyip.com.

	1. This website shows your public IP. Look at your neighbor's computer. Notice that we all share the same public IP. Why? Everyone in this room is connecting to the Internet through the same router.

	1. Launch Terminator.

	1. Type ***nmcli***.

		```
		eno1: connected to Wired connection 1
		        "Intel Ethernet"
		        ethernet (e1000e), 1C:69:7A:0F:D6:BE, hw, mtu 1500
		        ip4 default
		        inet4 192.168.111.222/22
		        route4 0.0.0.0/0
		        route4 192.168.108.0/22
		        inet6 fe80::cd3:b8a:5544:f5ff/64
		        route6 fe80::/64
		        route6 ff00::/8

		wlp0s20f3: connected to Liferay
		        "Intel Wireless-AC 9462"
		        wifi (iwlwifi), C8:09:A8:9C:54:91, hw, mtu 1500
		        inet4 192.168.110.160/22
		        route4 0.0.0.0/0
		        route4 192.168.108.0/22
		        inet6 fe80::677d:4d0a:bdc8:1c23/64
		        route6 fe80::/64
		        route6 ff00::/8
		```

		If your ethernet cable is connected, then en* will show an IP. In my case, the IP is ***192.168.111.222***.

		If your WiFi is connected, then wl* will show an IP. In my case, the IP is ***192.168.110.160***.

	1. Type ***ifconfig*** to get similar information through another program. Find the same IPs.

1. List available WiFi networks.

	1. Type ***nmcli device wifi list***.

	1. Turn on your phone's hotspot feature.

	1. Type ***nmcli device wifi list***.

	1. If your phone's hotspot network is not available, type ***nmcli device wifi rescan***. Then try again.

1. Connect to your phone's hotspot.

	1. Type ***nmcli device wifi connect \<NETWORK_NAME\> password \<NETWORK_PASSWORD\>***.

	1. Use Chrome to open https://www.whatismyip.com. Notice that your public IP is now different.

	1. Type ***nmcli***. Notice that your private IP is also different.

1. Optionally, read [nmcli](https://fedoraproject.org/wiki/Networking/CLI) for more information.

## Ping

1. What is ping?

	<!--
	https://teamuvdotorg1.files.wordpress.com/2014/08/untitled7.jpg
	-->

	![](images/01.jpg)

1. Ping your own computer.

	1. Type ***ping 127.0.0.1***.

	1. Type ***ping localhost***.

	1. Both ***127.0.0.1*** and ***localhost*** are names for your own computer.

1. Ping your neighbor's computer.

	1. Make sure you and your neighbor are both connected to the Liferay WiFi network. 

	1. Type ***ping 192.168.xxx.xxx*** where ***xxx.xxx*** is your neighbor's IP. If it works, you should get a result like this:

		```
		PING 192.168.111.248 (192.168.111.248) 56(84) bytes of data.
		64 bytes from 192.168.111.248: icmp_seq=1 ttl=64 time=43.7 ms
		64 bytes from 192.168.111.248: icmp_seq=2 ttl=64 time=66.4 ms
		64 bytes from 192.168.111.248: icmp_seq=3 ttl=64 time=10.8 ms
		```

	1. Type ***ping 192.168.111.500***. This command fails because ***192.168.111.500*** is not a valid IP.

		```
		ping: 192.168.111.500: Name or service not known
		```

	1. Connect to your phone's network while your neighbor is connected to the Liferay network.

	1. Try pinging your neighbor's IP. This fails because you are behind different routers. Imagine a router as a room. When you are in the same room, you can ping each other and talk to each other. When you are in different rooms, you cannot ping or talk to each other.

	1. Have both your neighbor join your phone's network. Try it again. This time, it works because you are both behind the same router.

## SSH

1. Connect via SSH to xyz.liferay.com. Log in as user  ***userXYZ*** with password is ***1234***.

1. Make an SSH key.
 	
1. Connect via an SSH key.

## SFTP

1. SFTP to xyz.liferay.com with and without an SSH key.

2.	List files and change directories.

3.	Upload and download files.

## Telnet

1. Telnet to localhost port 22.

1. Telnet to localhost port 23.

1. Why are the results different?