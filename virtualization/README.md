# Virtualization

## Docker

1. Docker is already installed on your machine. Review /home/me/dev/projects/liferay-basic-training/dotfiles/docker/restore.sh to see how Docker was installed.

1. Launch Terminator.

1. Type ***docker --version***.

1. Type ***d --version***.

1. The program ***docker*** located at ***/usr/bin/docker*** is aliased to ***d*** in ***~/.bashrc***. Open ***~/.bashrc*** to verify this is true. Whenever possible, use the alias to minimize wear and tear on your fingers.

1. Follow the tutorial in https://docker-curriculum.com. Stop after you reach the section ***Docker on AWS***.

1. Start Liferay.

	1. Type ***d pull liferay/portal:7.3.5-ga6***.

	1. Type ***d run -it -p 8080:8080 liferay/portal:7.3.5-ga6***.

	1. The command ***d pull liferay/portal:7.3.5-ga6*** to pull the Docker image is not necessary. If you tell Docker to run an image, and it is not available locally, it will pull down the image automatically for you.

## VirtualBox

1. VirtualBox is already installed on your machine. Review /home/me/dev/projects/liferay-basic-training/dotfiles/virtualbox/restore.sh to see how VirtualBox was installed.

1. [Download](https://developer.microsoft.com/en-us/windows/downloads/virtual-machines) Windows 10. The file ***WinDev2012Eval.VirtualBox.zip*** may already be in your ***~/Downloads*** directory. It is a very large 20 GB file. Conserve bandwidth and do not download the file again if you already have the file.

	1. Launch Terminator.

	1. Go to ***~/Downloads***.

	1. Type ***unzip WinDev2012Eval.VirtualBox.zip*** to unzip ***WinDev2012Eval.VirtualBox.zip***. The unzipped file is ***WinDev2012Eval.ova***.

1. Disable secure boot.

	1. VirtualBox cannot emulate Windows unless you disable secure boot.

	1. Type ***sudo shutdown -r now***.

	1. Press ***F12*** while the system is booting up to enter into the BIOS setup.

	1. Go to the ***Boot*** tab. Go to ***Secure Boot***. Disable it. Press ***F10*** to save and exit.

1. Import and start Windows.

	1. After logging back into your computer, launch Virtual Box.

	1. Use Virtual Box to import the file ***~/Downloads/WinDev2012Eval.ova***.

	1. Start Windows.