#!/bin/bash

source ../_common.sh

function customize_bash {
	restore_from_original ~/.bashrc

	cat ~/.bashrc data/.bashrc > ~/.bashrc.cat

	mv ~/.bashrc.cat ~/.bashrc
}

function customize_git {
	cp data/.gitconfig ~

	if [ ! -e /usr/local/bin/git-new-workdir ]
	then
		download https://raw.githubusercontent.com/git/git/master/contrib/workdir/git-new-workdir

		chmod a+x data/git-new-workdir

		sudo cp data/git-new-workdir /usr/local/bin
	fi

	cp data/gc_repositories ~/dev/projects
	cp data/prepare_repositories ~/dev/projects
}

function customize_hostname {
	if [ $(hostname) == "localhost.localdomain" ]
	then
		sudo hostnamectl set-hostname nuc10-i7-$(random_letter)$(random_digit)$(random_letter)$(random_digit)
	fi
}

function customize_login {
	sudo_restore_from_original /etc/lxdm/PreLogin

	sudo_restore_from_original /etc/lxdm/PostLogin

	sudo bash -c "echo \"/bin/bash /usr/local/bin/xinput_logitech_mouse\" >> /etc/lxdm/PostLogin"
	sudo bash -c "echo \"/bin/bash /usr/local/bin/xrandr_monitor\" >> /etc/lxdm/PostLogin"
	sudo bash -c "echo \"/bin/bash /usr/local/bin/xset_disable_screensaver\" >> /etc/lxdm/PostLogin"

	#sudo_restore_from_original /etc/lxdm/PostLogin

	sudo bash -c "echo \"/usr/libexec/notification-daemon start &\" >> /etc/lxdm/PostLogin"
}

function customize_lxdm {
	sudo_restore_from_original /etc/lxdm/lxdm.conf

	sudo sed -i "s@disable=0@disable=1@" /etc/lxdm/lxdm.conf
	sudo sed -i "s@lang=1@lang=0@" /etc/lxdm/lxdm.conf
}

function customize_openbox {

	#
	# Autostart
	#

	mkdir -p ~/.config/openbox

	echo "#!/bin/bash" > ~/.config/openbox/autostart.sh
	echo "" >> ~/.config/openbox/autostart.sh
	echo "conky" >> ~/.config/openbox/autostart.sh
	echo "xsetroot -solid black" >> ~/.config/openbox/autostart.sh

	chmod 744 ~/.config/openbox/autostart.sh

	#
	# Desktops
	#

	cp -f /etc/xdg/openbox/rc.xml ~/.config/openbox/rc.xml

	sed -i "s@number>4</number@number>1</number@" ~/.config/openbox/rc.xml

	#
	# Key Bindings
	#

	# 
	# https://ubuntu-mate.community/t/error-cannot-autolaunch-d-bus-without-x11-display/11928
	#

	sudo dbus-launch gsettings set org.gnome.desktop.wm.keybindings activate-window-menu "[]"

	dbus-launch gsettings set org.gnome.desktop.wm.keybindings activate-window-menu "[]"

	perl -0777 -pi -e 's@<keybind key="A-space">(\n *<[^/].*)*\n *</keybind>@<!--$&-->@' ~/.config/openbox/rc.xml

	sed -i "s/A-Tab/W-Tab/" ~/.config/openbox/rc.xml
	sed -i "s/A-S-Tab/W-S-Tab/" ~/.config/openbox/rc.xml

	local openboxRCKeyBindings=$(cat data/openbox_rc_key_bindings.xml | tr '\n' ';' | sed 's/;/\\n/g')

	sed -i "s@</keyboard>@${openboxRCKeyBindings}\n</keyboard>@" ~/.config/openbox/rc.xml

	sudo cp data/brightness_update /usr/local/bin/brightness_update

	sudo bash -c "echo \"ALL ALL=NOPASSWD: /usr/local/bin/brightness_update\" > /etc/sudoers.d/brightness_update"

	#
	# Fonts
	#

	#sed -i "s/sans/Lucida Grande Medium/g" ~/.config/openbox/rc.xml

	#
	# Window Decorations
	#

	local openboxRCWindowDecorations=$(cat data/openbox_rc_window_decorations.xml | tr '\n' ';' | sed 's/;/\\n/g')

	sed -i "s@</openbox_config>@${openboxRCWindowDecorations}\n</openbox_config>@" ~/.config/openbox/rc.xml
}

function customize_screensaver {

	#
	# https://ubuntuforums.org/showthread.php?t=1283057
	# http://www.shallowsky.com/linux/x-screen-blanking.html
	#

	echo "xset -dpms" > xset_disable_screensaver
	echo "xset s noblank" >> xset_disable_screensaver
	echo "xset s off" >> xset_disable_screensaver

	chmod 775 xset_disable_screensaver

	#./xset_disable_screensaver

	sudo mv xset_disable_screensaver /usr/local/bin
}

function customize_ssh {

	#
	# https://www.reddit.com/r/Fedora/comments/jhxbdh/no_ssh_public_key_auth_after_upgrade_to_fedora_33
	#

	#echo "Host gitlab.liferay.com lrdcom-vm-*" > ~/.ssh/config
	#echo -e "\tPubkeyAcceptedKeyTypes=ssh-rsa" >> ~/.ssh/config

	if [ -e ~/.ssh/config ]
	then
		chmod 600 ~/.ssh/config
	fi
}

function customize_sysctl {

	#
	# https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/5/html/tuning_and_optimizing_red_hat_enterprise_linux_for_oracle_9i_and_10g_databases/sect-oracle_9i_and_10g_tuning_guide-large_memory_optimization_big_pages_and_huge_pages-configuring_huge_pages_in_red_hat_enterprise_linux_4_or_5
	#

	sudo_restore_from_original /etc/sysctl.conf

	#sudo bash -c "echo \"vm.nr_hugepages=8192\" >> /etc/sysctl.conf"

	#sudo sysctl -p
}

function customize_xinput {
	chmod 775 data/xinput_logitech_mouse

	sudo cp data/xinput_logitech_mouse /usr/local/bin

	if [ -n "$(DISPLAY=:0.0 xinput --list | grep Chicony)" ]
	then
		sudo localectl set-keymap us
		sudo localectl set-x11-keymap us
	else
		sudo localectl set-keymap us
		sudo localectl --no-convert set-x11-keymap br
	fi
}

function customize_xrandr {
	chmod 775 data/xrandr_monitor

	sudo cp data/xrandr_monitor /usr/local/bin
}

function customize_vi {
	sudo_restore_from_original /etc/virc

	sudo bash -c "echo \"set nofixeol\" >> /etc/virc"
	sudo bash -c "echo \"set tabstop=4\" >> /etc/virc"
}

function disable_firewall {

	#
	# https://serverfault.com/questions/429991/how-to-solve-nt-status-host-unreachable-in-centos-when-connecting-to-windows-f
	#

	sudo systemctl stop firewalld

	sudo systemctl disable firewalld
}

function disable_selinux {

	#
	# https://serverfault.com/questions/579720/smbclient-directory-listing-gives-nt-status-access-denied/834160#834160
	# https://unix.stackexchange.com/questions/439712/samba-share-between-fedora-machines
	# https://www.cyberciti.biz/faq/disable-selinux-on-centos-7-rhel-7-fedora-linux
	#

	sudo_restore_from_original /etc/selinux/config

	sudo sed -i "s/SELINUX=enforcing/SELINUX=disabled/" /etc/selinux/config
}

function install_autokey {
	dnf_install autokey-gtk gtksourceview3

	rm -fr ~/.config/autokey

	mkdir -p ~/.config/autokey

	cp -R data/autokey ~/.config

	#
	# https://askubuntu.com/questions/269574/wmctrl-focus-most-recent-window-of-an-app
	#

	sudo cp data/wmctrl_focus_on_app /usr/local/bin
}

function install_conky {
	dnf_install conky

	cp data/.conkyrc ~/.conkyrc
}

function install_exfat {
	dnf_install fuse-exfat
}

function install_fonts {

	#
	# https://fedoramagazine.org/5-great-monospaced-fonts-for-coding-and-the-terminal-in-fedora
	#

	dnf_install adobe-source-code-pro-fonts bitstream-vera-sans-fonts dejavu-sans-mono-fonts levien-inconsolata-fonts mozilla-fira-mono-fonts

	#
	# http://www.makeuseof.com/tag/how-to-get-mac-and-windows-fonts-in-ubuntu-linux
	#

	#
	# Mac
	#

	sudo rm -fr /usr/share/fonts/mac

	sudo mkdir -p /usr/share/fonts/mac

	download http://mirrors/dl.dropbox.com/u/26209128/mac_fonts.tar.gz

	sudo tar fxz data/mac_fonts.tar.gz -C /usr/share/fonts/mac --strip=1

	#
	# Windows
	#

	dnf_install mscore-fonts

	#
	# Cache
	#

	sudo fc-cache -f
}

function install_ntpdate {
	dnf_install ntpdate

	ntpdate -s pool.ntp.org

	sudo systemctl enable ntpdate.service
}

function install_rpm_fusion {
	if ! rpm -aq | grep -q rpmfusion-free-release
	then
		rpm_install http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
	fi
}

function install_terminator {
	dnf_install terminator

	#
	# http://manpages.ubuntu.com/manpages/zesty/en/man5/terminator_config.5.html
	#

	mkdir -p ~/.config/terminator

	cp data/terminator_config ~/.config/terminator/config
}

function install_thunar {
	dnf_install gnome-search-tool nautilus Thunar

	sudo rm -f /usr/share/applications/Thunar-bulk-rename.desktop
	sudo rm -f /usr/share/applications/Thunar-folder-handler.desktop
	sudo rm -f /usr/share/applications/thunar-settings.desktop

	rm -fr ~/.config/Thunar

	mkdir -p ~/.config/Thunar

	cp data/thunar_uca.xml ~/.config/Thunar/uca.xml

	rm -fr ~/.config/xfce4

	mkdir -p ~/.config/xfce4/xfconf/xfce-perchannel-xml

	cp data/thunar.xml ~/.config/xfce4/xfconf/xfce-perchannel-xml

	#
	# Reboot to reload Thunar's settings.
	#

}

function install_ulauncher {
	dnf_install ulauncher

	mkdir -p ~/.config/autostart

	cp data/ulauncher/ulauncher.desktop ~/.config/autostart

	mkdir -p ~/.config/ulauncher

	cp data/ulauncher/settings.json ~/.config/ulauncher
}

function random_digit {
	echo $(((RANDOM % 10)  + 1))
}

function random_letter {
	echo cat /dev/urandom | tr -cd 'a-z' | head -c 1
}

function remove_unused_icons {
	sudo rm -f /usr/share/applications/fedora-release-notes.webapp.desktop
}

function swap_caps_and_control {

	#
	# http://sapiengames.com/2014/04/08/swap-control-capslock-keys-linux-openbox
	#

	echo "remove Lock = Caps_Lock" > ~/.Xmodmap
	echo "remove Control = Control_L" >> ~/.Xmodmap
	echo "keysym Control_L = Caps_Lock" >> ~/.Xmodmap
	echo "keysym Caps_Lock = Control_L" >> ~/.Xmodmap
	echo "add Lock = Caps_Lock" >> ~/.Xmodmap
	echo "add Control = Control_L" >> ~/.Xmodmap

	xmodmap ~/.Xmodmap
}

function update_packages {
	dnf_install \
		acpi \
		ftp \
		genisoimage \
		git \
		gitk \
		gnome-disk-utility \
		gparted \
		htop \
		livecd-tools \
		lshw \
		maim \
		NetworkManager-vpnc \
		NetworkManager-vpnc-gnome \
		npm \
		notification-daemon \
		p7zip \
		p7zip-plugins \
		patch \
		pinta \
		python2 \
		s3cmd \
		screen \
		slock \
		sysstat \
		tigervnc \
		wget \
		WoeUSB \
		xbacklight \
		xclip

	dnf_erase abiword asunder gigolo gnomebaker gnumeric lxmusic midori pidgin pcmanfm osmo sylpheed xpad

	rm -fr ~/.config/libfm
	rm -fr ~/.config/pcmanfm

	sudo dnf update -y
}

#update_packages

#install_rpm_fusion

#customize_bash
#customize_git
#customize_hostname
customize_lxdm
#customize_openbox
#customize_screensaver
#customize_ssh
#customize_sysctl
#customize_xinput
#customize_xrandr
#customize_vi
#disable_firewall
#disable_selinux
#install_autokey
#install_conky
#install_exfat
#install_fonts
#install_ntpdate
#install_terminator
#install_thunar
#install_ulauncher
#remove_unused_icons
#swap_caps_and_control

#customize_login