#!/usr/bin/env python3

import subprocess
import sys
import time

command = sys.argv[1]

command_check = command.split("/")[-1]

subprocess.Popen(["/bin/bash", "-c", command])

for count in range(0, 30):
	try:
		window_list = [
			windows.split() for windows in subprocess.check_output(
				["wmctrl", "-lp"]
			).decode(
				"utf-8"
			).splitlines()
		]

		processes = subprocess.check_output(
			["pgrep", "-f", command_check]
		).decode(
			"utf-8"
		).strip(
		).split()

		window_list = sum(
			[
				[
					windows[0] for windows in window_list if process in windows
				] for process in processes
			], []
		)

		subprocess.Popen(
			["xdotool", "windowminimize", window_list[0]]
		)

		break
	except (IndexError, subprocess.CalledProcessError):
		pass

	time.sleep(1)