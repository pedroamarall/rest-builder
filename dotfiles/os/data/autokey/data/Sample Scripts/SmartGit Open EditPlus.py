import os

import time

winClass = window.get_active_class()

if winClass == "SmartGit.SmartGit":
	keyboard.send_keys("<shift>+<alt>+<insert>")

	time.sleep(0.2)

	relativePath = clipboard.get_clipboard()

	winTitle = str(window.get_active_title())

	index = winTitle.find(" - Log")

	if index > -1:
		projectName = winTitle[2:index]

		index = projectName.find("~")

		if index == 0:
			system.exec_command("wine ~/.wine/drive_c/Program\ Files\ \(x86\)/EditPlus\ 2/editplus.exe /home/brian" + projectName[1:] + "/" + relativePath)
		elif os.path.exists("/home/brian/dev/projects/github/" + projectName):
			system.exec_command("wine ~/.wine/drive_c/Program\ Files\ \(x86\)/EditPlus\ 2/editplus.exe /home/brian/dev/projects/github/" + projectName + "/" + relativePath)
		elif os.path.exists("/home/brian/dev/projects/gitlab/" + projectName):
			system.exec_command("wine ~/.wine/drive_c/Program\ Files\ \(x86\)/EditPlus\ 2/editplus.exe /home/brian/dev/projects/gitlab/" + projectName + "/" + relativePath)