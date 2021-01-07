# Fedora

## Terminator

1. Launch Terminator.

	1. Type *<Alt+Space>* and then type *Terminator*.

1. Create a new tab in Terminator.

	1. Type *<Control+T>*.

1. Shift the focused tab.

	1. Type *<Control+Alt+Left>*.

	1. Notice that a different Terminator tab is now in focus.

	1. Type *<Control+Alt+Right>*.

1. Close a Terminator tab.

	1. Type *<Control+W>*.

1. Exit Terminator by closing all tabs.

	1. Keep typing *<Control+W>* until all the tabs are closed.

1. Quickly exit Terminator.

	1. Launch Terminator. Open many tabs.

	1. Type *<Control+Q>* to exit all the tabs with one keystroke.

1. Type *<Control+Shift+I>*.

	1. This is an AutoKey shortcut to open tabs that are optimized for working on many branches of Liferay.

## Navigate the File System with the Command Line.

1. Launch Terminator.

1. List the contents of a directory.

	1. Type *ls*.

	1. Type *ls -la --group-directories-first*.

	1. *ls* is the command, and *-la --group-directories-first* are arguments for the *ls* command.

	1. Type *la*. That is an alias for the longer *ls -la --group-directories-first* command. I prefer *la* because it gives me more information and lists everything top down.

	1. See https://man7.org/linux/man-pages/man1/ls.1.html for more information.

1. Change directories.

	1. Type *cd /* to go to the root of the file system.

	1. Notice that your Bash prompt says where you are.

	1. Type *cd /opt* to go to */opt*. List the contents of that directory.

	1. Again, notice that your Bash prompt says where you are.

	1. Type *cd ~* to go to your home directory.

	1. Type *cd /home/me*. Notice that nothing changed. Why? Because *~* is the same as */home/me*.

	1. See https://man7.org/linux/man-pages/man1/cd.1p.html for more information.

1. Make directories.

	1. Go to *~*.

	1. Type *la*.

	1. Type *mkdir test*

	1. Type *la*.

	1. Go to *~/test* (also known as /home/me/test)

	1. Type *la*. Notice that there are no files.

	1. Type *cd ..* to go up one directory.

	1. Type *la*.

1. Make files.

	1. Go to *~/test*.

	1. Type *la*

	1. Type *touch hello1.txt*.

	1. Type *la*

	1. Type *echo "My name is Brian" > hello2.txt*.

	1. Type *more hello1.txt*.

	1. Type *more hello2.txt*.

	1. See https://man7.org/linux/man-pages/man1/echo.1.html, https://man7.org/linux/man-pages/man1/more.1.html, and https://man7.org/linux/man-pages/man1/touch.1.html for more information.

1. Use the above commands to add lots of files and directories into *~/test*. Make it at least 3 levels deep.

## Navigating the File System with Thunar

1. Launch Thunar.

1. Search with Thunar.

	1. Find */home/me/test* and right click on it.

	1. Click on *Search*.

	1. Play with the search options. You can search for files that contain the word "Brian".

## Downloading Files

1. curl

1. wget

## Syncing Files

1. rsync

1. Watch out for the tailing slash.

## Security

1. sudo

## Managing Packages

1. dnf install gitg

1. rpm -ql gitg

1. dnf remove gitg

## Understanding PATH

1. Add a shell script to PATH.

1. Modify .bashrc.

	1. Add an alias.

## Password

1. Change your user password.

	1. Open 

	1. passwd

1. Change the encrypted hard drive's passphrase.

	1. sudo gnome-disk