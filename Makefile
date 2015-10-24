.ONESHELL:
SHELL = /bin/bash
INSTALL = /usr/bin/install
USERCONF = home/dotfiles
	
kodi:
	apt install software-properties-common
	apt-add-repository --yes ppa:team-xbmc/ppa
	apt update
	apt install --yes kodi

system-config:
	$(INSTALL) -m 755 -C -d system/opt/kodi/fix-ir.sh /opt/kodi/
	$(INSTALL) -m 644 -C -d system/etc/systemd/system/fix-ir.service /etc/systemd/system/
	$(INSTALL) -m 644 -C -d system/etc/lightdm/lightdm.conf.d/10-xubuntu.conf /etc/lightdm/lightdm.conf.d/

user-config:
	$(INSTALL) -m 644 -C -d $(USERCONF)/config/autostart/Kodi.desktop ~/.config/autostart/
	$(INSTALL) -m 644 -C -d $(USERCONF)/kodi/userdata/advancedsettings.xml ~/.kodi/userdata/
	$(INSTALL) -m 644 -C -d $(USERCONF)/kodi/userdata/wakeonlan.xml ~/.kodi/userdata/

install: kodi system-config user-config

.PHONY: kodi system-config user-config
