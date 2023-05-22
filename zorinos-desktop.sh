#!/usr/bin/env bash

# = = = = = = = = = = = = = = V A R I Á V E I S = = = = = = = = = = = = = = #

APPS_SNAP_REMOVE=( )

APPS_APT_REMOVE=( snapd )

APPS_APT_INSTALL=( virtualbox )

APPS_FLATPAK_INSTALL=( )

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #

# = = = = = = = = = = = = = = S C R I P T = = = = = = = = = = = = = = #
sudo rm /var/lib/dpkg/lock-frontend; sudo rm /var/cache/apt/archives/lock;

sudo apt update && sudo apt upgrade

