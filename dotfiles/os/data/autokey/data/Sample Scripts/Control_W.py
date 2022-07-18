winClass = window.get_active_class()

if winClass == "SmartGit.SmartGit":
	keyboard.send_keys("<ctrl>+<f4>")
else:
	keyboard.send_keys("<ctrl>+w")