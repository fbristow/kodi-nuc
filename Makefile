.ONESHELL:
SHELL = /bin/bash
INSTALL = /usr/bin/install
USERCONF = home/dotfiles
	
kodi:
	apt install software-properties-common
	apt-add-repository --yes ppa:team-xbmc/ppa
	apt update
	apt install kodi

system-config:
	$(INSTALL) -m 755 -C system/opt/kodi/fix-ir.sh /opt/kodi/
	$(INSTALL) -m 644 -C system/etc/systemd/system/fix-ir.service /etc/systemd/system/

user-config:
	$(INSTALL) -m 644 -C $(USERCONF)/config/autostart/Kodi.desktop ~/.config/autostart/
	$(INSTALL) -m 644 -C $(USERCONF)/kodi/userdata/advancedsettings.xml ~/.kodi/userdata/
	$(INSTALL) -m 644 -C $(USERCONF)/kodi/userdata/wakeonlan.xml

install: kodi system-config user-config

.PHONY: kodi system-config user-config