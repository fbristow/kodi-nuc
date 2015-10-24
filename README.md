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

I start with [Xubuntu Core](xubuntu-core), so download the [`mini.iso`](mini-iso)
for the version of Ubuntu that you want to start with and either

1. Choose the *Xubuntu minimal installation task* during install, or
2. Pick the smallest number of dependencies and then run
    sudo apt-get install xubuntu-core^
   After the installer has finished.

I created a `Makefile` that I can use to install Kodi and the customized
scripts and settings for my environment.

Run

    sudo make install

[xubuntu-core]: http://xubuntu.org/news/introducing-xubuntu-core/ "Xubuntu Core"
[mini-iso]: https://help.ubuntu.com/community/Installation/MinimalCD "Ubuntu Minimal CD"
