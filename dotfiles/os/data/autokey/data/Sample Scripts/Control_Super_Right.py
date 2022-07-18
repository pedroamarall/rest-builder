winClass = window.get_active_class()

#winClass == "editplus.exe.editplus.exe" or

if winClass == "google-chrome.Google-chrome":
	keyboard.send_keys("<ctrl>+<tab>")
else:
   keyboard.send_keys("<ctrl>+<super>+<right>")