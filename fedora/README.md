# Fedora

## Terminator

1. Launch Terminator.

	1. Type ***<Alt+Space>*** and then type ***Terminator***.

1. Create a new tab in Terminator.

	1. Type ***<Control+T>***.

1. Shift the focused tab.

	1. Type ***<Control+Super+Left>***.

	1. Notice that a different Terminator tab is now in focus.

	1. Type ***<Control+Super+Right>***.

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

	1. Go to ***~/test*** (also known as /home/me/test).

	1. Type ***la***. Notice that there are no files.

	1. Type ***cd ..*** to go up one directory.

	1. Type ***la***.

	1. Type ***cd test*** to go into test.

	1. Type ***la***.

	1. Type ***cd test***. This command fails because you are already inside the test directory.

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

	1. Go to ***~/test***.

	1. Type ***la***

	1. Type ***rm hello2.txt***.

	1. Type ***la***

	1. Type ***rm hello2.txt***.

	1. Notice that it complained this time because the file ***hello2.txt*** no longer exists.

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

	1. Type ***curl \<URL\>*** where ***\<URL\>*** is the URL to our sample file.

	1. Type ***la***.

	1. That simply printed the contents of the URL. Notice that no file was downloaded.

	1. Type ***curl \<URL\> --output copyright1.txt***.

	1. Type ***la***.

	1. Type ***more copyright1.txt***.

	1. Type ***curl \<URL\> --output copyright2.txt***.

	1. Type ***la***.

	1. Type ***more copyright2.txt***.

1. wget

	1. Go to ***~/test***.

	1. Type ***la***.

	1. Type ***wget \<URL\>***.

	1. Type ***la***.

	1. Type ***more copyright.txt***.

	1. Type ***\<Up\>*** until you see the command ***wget \<URL\>*** again. This conserves on typing.

	1. Once you see ***wget \<URL\>***, type ***\<Enter\>***.

	1. Type ***la***.

	1. Notice copyright.txt.1 because copyright.txt already existed.

	1. Type ***more copyright.txt.1***.

	1. Type ***wget \<URL\> -O copyright3.txt***.

	1. Type ***la***.

	1. Type ***more copyright3.txt***.

## Syncing Directories and Files

1. Use rsync.

	1. Type ***mkdir ~/hello***.

	1. Type ***rsync -av ~/test ~/hello***.

	1. Type ***la ~/hello***.

1. Remake the directory for the next example.

	1. Type ***rm -fr ~/hello && mkdir ~/hello***.

	1. The symbol ***&&*** allows you to chain two commands in one line. It is as if you typed ***rm -fr ~/hello*** and then typed ***mkdir ~/hello***.

	1. Type ***la ~/hello***.

1. Watch out for the tailing slash.

	1. Type ***rsync -av ~/test/ ~/hello***. Notice that I did NOT ask you to type ***rsync -av ~/test ~/hello***. Every character matters.

	1. Type ***la ~/hello***.

	1. Notice how the contents of ***~/hello*** are very different in this second example.

	1. Remake the directory for the next example.

1. Add files.

	1. Type ***touch ~/test/add.txt***.

	1. Type ***rsync -av ~/test/ ~/hello***.

	1. Type ***la ~/hello***.

1. Delete files.

	1. Type ***rm ~/test/add.txt***.

	1. Type ***rsync -av ~/test/ ~/hello***.

	1. Type ***la ~/hello/add.txt***. The file still exists.

	1. Type ***rsync -av --delete ~/test/ ~/hello***.

	1. Type ***la ~/hello/add.txt*** The file is deleted. Files are not deleted unless you add the argument ***--delete***.

1. Optionally, see the man page for [rsync](https://man7.org/linux/man-pages/man1/rsync.1.html) for more information.

## Security

1. Launch Terminator.

1. Type ***ls /root***.

1. Notice that you were not allowed to list the contents of the directory ***/root*** because ***/root*** is the home directory of the ***root*** user.

	1. The root directory of the computer is ***/***.

	1. That is not the same as the ***root*** user.

	1. The home directory of the ***root*** user is ***/root***.

	1. The home directory for the ***me*** user is ***/home/me***.

	1. Pause and think to make sure you fully understand this.

1. Type ***sudo ls /root***. You will prompted to enter your password. The ***me*** user is an admin user and can execute commands as the ***root*** user. Once you enter in the password, the command will work.

1. Type ***\<Up\>***, and then type ***\<Enter\>*** to execute ***sudo ls /root*** again. Notice that it did not ask you for your password again. It remembers your password in that Terminator tab for 15 minutes.

1. Open a new Terminator tab.

1. Type ***sudo ls /root***. You will be prompted for the password again because the password is only remembered for the other tab.

## Managing Packages

1. Launch Terminator.

1. Type ***rpm -ql sysstat***
	```
	/etc/profile.d/colorsysstat.csh
	/etc/profile.d/colorsysstat.sh
	/etc/sysconfig/sysstat
	/etc/sysconfig/sysstat.ioconf
	/usr/bin/cifsiostat
	/usr/bin/iostat
	...
	```
1. This prints all the files that were installed on the system for the package ***sysstat***.

1. Type ***iostat***. This command works because the file ***/usr/bin/iostat*** was installed as part of the package ***sysstat***.

1. Type ***ls /usr/bin/iostat***.

1. Type ***dnf remove sysstat***.

1. This command fails because ***dnf*** requires ***sudo***.

1. Type ***sudo dnf remove sysstat***.

1. Type ***iostat***. This command fails because the file ***/usr/bin/iostat*** no longer exists.

1. Type ***ls /usr/bin/iostat***.

1. Type ***sudo dnf install sysstat***.

1. Type ***iostat***. This command works because the file ***/usr/bin/iostat*** was just installed.

1. Type ***ls /usr/bin/iostat***.

1. Notice that you did not have to type ***/usr/bin/iostat***. You only had to type ***iostat***. Why? Continue to find out.

## Understanding PATH

1. Launch Terminator.

1. Type ***echo $PATH***.

	1. The PATH environment variable contains a list of directories, separated by colons.
		```
		/opt/java/ant/bin:/opt/java/jdk/bin:/home/me/.npm-global/bin:/home/me/.local/bin:/home/me/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin
		```
	1. That means executable files in /opt/java/ant/bin, /opt/java/jdk/bin, /usr/local/bin, etc. are all available from the command line.

	1. Type ***la /opt/java/ant/bin***.

	```
	-rwxr-xr-x 1 root root 11729 May 10  2020 ant
	-rw-r--r-- 1 root root  7470 May 10  2020 ant.bat
	-rw-r--r-- 1 root root  2855 May 10  2020 ant.cmd
	-rw-r--r-- 1 root root  3409 May 10  2020 antenv.cmd
	-rwxr-xr-x 1 root root   861 May 10  2020 antRun
	-rw-r--r-- 1 root root  1532 May 10  2020 antRun.bat
	-rwxr-xr-x 1 root root  2117 May 10  2020 antRun.pl
	-rwxr-xr-x 1 root root  3458 May 10  2020 complete-ant-cmd.pl
	-rw-r--r-- 1 root root  4315 May 10  2020 envset.cmd
	-rw-r--r-- 1 root root  1112 May 10  2020 lcp.bat
	-rwxr-xr-x 1 root root  4166 May 10  2020 runant.pl
	-rwxr-xr-x 1 root root  3344 May 10  2020 runant.py
	-rw-r--r-- 1 root root  1814 May 10  2020 runrc.cmd
	```

	1. Notice that ***ant*** is green and described as -rwxr-xr-x whereas ***ant.bat*** is gray and described as -rw-r--r--.

	1. Type ***ant -version***. This command works because it is executable.

	1. Type ***ant.bat -version***. This command fails because it is not executable.

	1. The letter ***x*** in the description -rwxr-xr-x means the file is executable.

	1. Type ***sudo ant.bat -version***. This command fails even with sudo because it is not executable.

1. Make a new executable file.

	1. Type ***myls***. This command fails because the file ***myls*** does not exist.

	1. Go to ***~/test***.

	1. Type ***echo "ls --full-time" > myls***.

	1. Type ***more myls***.

	1. Type ***la***. Notice that ***myls*** is gray and described as -rw-rw-r--.

	1. Type ***chmod a+x myls*** to make ***myls*** executable.

	1. Type ***la***. Notice that ***myls*** is green and described as -rwxrwxr-x.

	1. Type ***myls***. This command fails because it is not in a directory listed in the environment variable $PATH.

	1. Type ***./myls***. This command works because it is executing a script from the current directory. ***./*** means the current directory.

	1. Type ***sudo mv myls /usr/local/bin***. This moves ***myls*** to ***/usr/local/bin*** because that directory is specified in the environment variable $PATH. Notice that we had to use ***sudo*** because modifying the contents of ***/usr/local/bin*** is not possible without ***sudo***.

	1. Type ***./myls***. This command fails because ***myls*** is no longer in the current directory.

	1. Type ***myls***.

	1. Type ***more /usr/local/bin/myls***.

	1. Type ***sudo rm /usr/local/bin/myls*** to remove the example script.

	1. Type ***ls /usr/local/bin/myls***.

	1. Type ***myls***.

	1. Optionally, see the man pages for [chmod](https://man7.org/linux/man-pages/man1/chmod.1.html) and [mv](https://man7.org/linux/man-pages/man1/mv.1.html) for more information.

1. Modify .bashrc.

	1. Launch Terminator.

	1. Type ***osub ~/.bashrc***.

	1. Be VERY, VERY, VERY careful when editing this file. Changes do not take place until a new Terminator tab is opened. But if this file is broken, you may not be able to open a new Terminator tab. Then your computer is broken.

	1. Add an alias.

		1. Find the line:

		```
		alias la="ls -la --group-directories-first"
		```

		1. Add a new alias:

		```
		alias la2="ls --full-time"
		```

		1. Type ***<Control+S>*** to save the file.

		1. Open a new Terminator tab. Type ***la2***. This works because the new alias is available in your new Bash prompt.

		1. Go to your old Terminator tab that opened Sublime. Type ***la2***. That should fail.

	1. Add a directory to the $PATH variable.

		1. Add an executable file in ***~/test***.

		1. Find the line:

		```
		export PATH="${ANT_HOME}/bin:${JAVA_HOME}/bin:${NPM_CONFIG_PREFIX}/bin:${PATH}"
		```

		1. Change it to:

		```
		export PATH="${ANT_HOME}/bin:${JAVA_HOME}/bin:${NPM_CONFIG_PREFIX}/bin:~/test:${PATH}"
		```

		1. Open a new Terminator tab. Show that your executable file in ***~/test*** works.