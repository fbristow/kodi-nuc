Kodi Configuration for Intel NUC
================================

This repository has some of the configuration necessary for getting an Intel
NUC D34010WYK up and running from vanilla Ubuntu.

The main interesting bit for this repository is the script to get the IR sensor
working correctly with Kodi. You can find that in the `system` directory in two
parts: 1) the script to get the IR service working, and 2) a `systemd` service
to run the script on startup.

Installing
==========

I start with [Xubuntu Core][xubuntu-core], so download the [`mini.iso`][mini-iso]
for the version of Ubuntu that you want to start with, then:

1. (For me only) Set the HTTP proxy on setup to be http://pandora.underworld:3142
   so that [Apt-Cacher NG][apt-cacher] will serve as a proxy for all `apt`-related
   tasks.
2. Choose the *Xubuntu minimal installation task* during install, or
3. Pick the smallest number of dependencies and then, after the installer has
   finished, run:

	sudo apt install -y policykit-1 # workaround https://bugs.launchpad.net/ubuntu/+source/policykit-1/+bug/1447654/comments/4
	sudo reboot

	### After reboot
        sudo apt install -y xubuntu-core^

I created a `Makefile` that I can use to install Kodi and the customized
scripts and settings for my environment.

Run:

    sudo apt install -y git
    git clone https://github.com/fbristow/kodi-nuc
    cd kodi-nuc
    sudo make install

[xubuntu-core]: http://xubuntu.org/news/introducing-xubuntu-core/ "Xubuntu Core"
[mini-iso]: https://help.ubuntu.com/community/Installation/MinimalCD "Ubuntu Minimal CD"
[apt-cacher]: https://www.unix-ag.uni-kl.de/~bloch/acng/ "Apt-Cacher NG, a caching proxy server for Apt."
