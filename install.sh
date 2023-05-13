#!/usr/bin/env bash

# = = = = = = = = = = = = = = V A R I Á V E I S = = = = = = = = = = = = = = #

# APPS_APT_INSTALL=( virtualbox )

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #

# = = = = = = = = = = = = = = S C R I P T = = = = = = = = = = = = = = #

su

rm /var/lib/dpkg/lock-frontend; rm /var/cache/apt/archives/lock;

apt update && apt upgrade

