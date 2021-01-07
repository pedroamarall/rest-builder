# Fedora

## Terminator

1. Launch Terminator.

	1. Type ***<Alt+Space>*** and then type ***Terminator***.

1. Create a new tab in Terminator.

	1. Type ***<Control+T>***.

1. Shift the focused tab.

	1. Type ***<Control+Alt+Left>***.

	1. Notice that a different Terminator tab is now in focus.

	1. Type ***<Control+Alt+Right>***.

1. Close a Terminator tab.

	1. Type ***<Control+W>***.

1. Exit Terminator by closing all tabs.

	1. Keep typing ***<Control+W>*** until all the tabs are closed.

1. Quickly exit Terminator.

	1. Launch Terminator. Open many tabs.

	1. Type ***<Control+Q>*** to exit all the tabs with one keystroke.

1. Type ***<Control+Shift+I>***.

	1. This is an AutoKey shortcut to open tabs that are optimized for working on many branches of Liferay.

## Navigate the File System with the Command Line

1. Launch Terminator.

1. List the contents of a directory.

	1. Type ***ls***.

	1. Type ***ls -la --group-directories-first***.

	1. ***ls*** is the command and ***-la --group-directories-first*** are arguments for the ***ls*** command.

	1. Type ***la***. That is an alias for the longer ***ls -la --group-directories-first*** command. I prefer ***la*** because it gives me more information and lists everything top down.

	1. Optionally, see the man page for [ls](https://man7.org/linux/man-pages/man1/ls.1.html) for more information.

1. Change directories.

	1. Type ***cd /*** to go to the root of the file system.

	1. Notice that your Bash prompt states where you are.

	1. Type ***cd /opt*** to go to ***/opt***. List the contents of that directory.

	1. Again, notice that your Bash prompt states where you are.

	1. Type ***cd \~*** to go to your home directory.

	1. Type ***cd /home/me***. Notice that nothing changed. Why? Because ***~*** is the same as ***/home/me***.

	1. Optionally, see the man page for [cd](https://man7.org/linux/man-pages/man1/cd.1p.html) for more information.

1. Make directories.

	1. Go to ***~***.

	1. Type ***la***.

	1. Type ***mkdir test***

	1. Type ***la***.

	1. Go to ***~/test*** (also known as /home/me/test)

	1. Type ***la***. Notice that there are no files.

	1. Type ***cd ..*** to go up one directory.

	1. Type ***la***.

1. Make files.

	1. Go to ***~/test***.

	1. Type ***la***

	1. Type ***touch hello1.txt***.

	1. Type ***la***

	1. Type ***echo "My name is Brian" > hello2.txt***.

	1. Type ***more hello1.txt***.

	1. Type ***more hello2.txt***.

	1. Optionally, see the man pages for [echo](https://man7.org/linux/man-pages/man1/echo.1.html), [more](https://man7.org/linux/man-pages/man1/more.1.html), and [touch](https://man7.org/linux/man-pages/man1/touch.1.html) for more information.

1. Remove files.

	1. Type ***rm hello2.txt***.

	1. Type ***la***

	1. Type ***rm hello2.txt***.

	1. Notice that it complained this time because the hello2.txt file no longer exists.

	1. Optionally, see the man page for [rm](https://man7.org/linux/man-pages/man1/rm.1.html) for more information.

1. Use the above commands to add lots of files and directories into ***~/test***. Make it at least 3 levels deep.

## Navigating the File System with Thunar

1. Launch Thunar.

1. Search with Thunar.

	1. Find ***/home/me/test*** and right click on it.

	1. Click on ***Search***.

	1. Play with the search options. You can search for files that contain the word "Brian".

## Downloading Files

1. Our sample file from the Internet is located [here](https://raw.githubusercontent.com/liferay/liferay-portal/master/copyright.txt).

	1. Open the sample file with Chrome and copy the URL.

	1. Use ***<Control+C>*** to copy the URL.

	1. Launch Terminator.

 	1. Use ***<Control+V>*** to paste the URL.

 	1. If nothing showed up, go back to Chrome and copy that URL and then try again.

	1. Right click on Terminator. Notice that right clicking also pastes the copied URL.

	1. Use your best judgment on when to use ***<Control+V>*** and when to use your mouse. Be sure to optimize speed while minimizing wear and tear on your hands.

	1. Once you see the URL pasted in Terminator, type ***<Control+C>*** to cancel the prompt.

1. curl

	1. Go to ***~/test***.

	1. Type ***la***.

	1. Type ***curl <URL>*** where ***<URL>*** is the URL to our sample file.

	1. Type ***la***.

	1. That simply printed the contents of the URL. Notice that no file was downloaded.

	1. Type ***curl <URL> --output copyright1.txt***.

	1. Type ***la***.

	1. Type ***more copyright1.txt***.

	1. Type ***curl <URL> --output copyright2.txt***.

	1. Type ***la***.

	1. Type ***more copyright2.txt***.

1. wget

	1. Go to ***~/test***.

	1. Type ***la***.

	1. Type ***wget <URL>***.

	1. Type ***la***.

	1. Type ***more copyright.txt***.

	1. Type ***<Up>*** until you see the command ***wget <URL*** again. This conserves on typing.

	1. Once you see ***wget <URL>***, type ***<Enter>***.

	1. Type ***la***.

	1. Notice copyright.txt.1 because copyright.txt already existed.

	1. Type ***more copyright.txt.1***.

	1. Type ***wget <URL> -O copyright3.txt***.

	1. Type ***la***.

	1. Type ***more copyright3.txt***.

## Syncing Files

1. rsync

1. Watch out for the tailing slash.

## Security

1. Type ***ls /root***.

1. Notice that we are not allowed to because ***/root*** is the home directory belongs to the root user. The home directory for the ***me*** user is ***/home/me***. Do not confuse the root directory ***/*** with the ***root*** user or the home directory ***/root*** of the ***root*** user. Pause and think.

1. If you are still confused, reread the sentence until every word means something to you. Ask someone for help if it still does not make sense.

1. Type ***sudo ls /root***. You will prompted to enter your password. The ***me*** user is an admin user and can execute commands as the ***root*** user. Once you enter in the password, the command will work.

1. Type ***<Up>***, and then type ***<Enter>*** to execute ***sudo ls /root*** again. Notice that it did not ask you for your password again. It remembers your password in that Terminator tab for 15 minutes.

## Managing Packages

1. Type ***rpm -ql sysstat***

1. This prints all the files that were installed on the system for the package ***sysstat***.

1. Type ***iostat***. This works because this file is installed in ***/usr/bin/iostat***.

1. Type ***ls /usr/bin/iostat***.

1. Type ***dnf remove sysstat***.

1. The command should fail because it requires sudo.

1. Type ***sudo dnf remove sysstat***.

1. Type ***iostat***. This should fail because the file ***/usr/bin/iostat*** should no longer exist.

1. Type ***ls /usr/bin/iostat***.

1. Type ***sudo dnf install sysstat***.

1. Type ***iostat***. This works because this file is installed in ***/usr/bin/iostat***.

1. Type ***ls /usr/bin/iostat***.

## Understanding PATH

1. Add a shell script to PATH.

1. Modify .bashrc.

	1. Add an alias.

## Password

1. Change your user password.

	1. Launch Terminal.

	1. Type ***passwd***.

1. Change the encrypted hard drive's passphrase.

	1. Type ***sudo gnome-disks***.

	1. Find the LUKS partition.

	1. Click the configure icon (2 gears).

	1. Click ***Change Passphrase***.