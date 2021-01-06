import time

winClass = window.get_active_class()

if winClass == "Eclipse.Eclipse":
    keyboard.send_keys("<alt>+f")
    keyboard.send_keys("x")

    time.sleep(0.2)

    keyboard.send_keys("<enter>")
elif winClass == "google-chrome.Google-chrome":
    keyboard.send_keys("<alt>+<f4>")
elif winClass == "SmartGit.SmartGit":
    keyboard.send_keys("<alt>+x")
else:
    keyboard.send_keys("<ctrl>+q")