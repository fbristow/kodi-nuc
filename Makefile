.ONESHELL:
SHELL = /bin/bash
INSTALL = /usr/bin/install
USERCONF = home/dotfiles
OWNER = -o fbristow -g fbristow
	
kodi:
	apt install --yes software-properties-common
	apt-add-repository --yes ppa:team-xbmc/ppa
	apt update
	apt install --yes kodi

lirc:
	/usr/bin/debconf-set-selections system/lirc.debconf
	apt install --yes lirc

system-config:
	$(INSTALL) -m 755 -d /opt/kodi
	$(INSTALL) -m 755 -C system/opt/kodi/fix-ir.sh /opt/kodi/
	$(INSTALL) -m 644 -C system/etc/systemd/system/fix-ir.service /etc/systemd/system/
	/bin/systemctl enable fix-ir
	$(INSTALL) -m 755 -d /etc/lightdm/lightdm.conf.d/
	$(INSTALL) -m 644 -C system/etc/lightdm/lightdm.conf.d/10-xubuntu.conf /etc/lightdm/lightdm.conf.d/
	$(INSTALL) -m 644 -C system/etc/X11/xorg.conf /etc/X11/

user-config:
	$(INSTALL) -m 755 $(OWNER) -d ~/.config/autostart/
	$(INSTALL) -m 644 $(OWNER) -C $(USERCONF)/config/autostart/Kodi.desktop ~/.config/autostart/
	$(INSTALL) -m 755 $(OWNER) -d ~/.kodi/userdata/
	$(INSTALL) -m 644 $(OWNER) -C $(USERCONF)/kodi/userdata/advancedsettings.xml ~/.kodi/userdata/
	$(INSTALL) -m 644 $(OWNER) -C $(USERCONF)/kodi/userdata/wakeonlan.xml ~/.kodi/userdata/

install: kodi lirc system-config user-config

.PHONY: kodi system-config user-config lirc
