#!/bin/bash
# Script Name: PVR Auto Installer

# Make sure we're running as root
if [ "$EUID" -ne 0 ]
  then
  echo
  echo -e $RED'Please run as root using the command: '$ENDCOLOR'sudo bash pvr-autoinstaller.sh'
  echo
  exit 0
fi

# Grab AtoMiC-ToolKit
apt-get install git
git clone https://github.com/htpcBeginner/AtoMiC-ToolKit ~/AtoMiC-ToolKit
cd ~/AtoMiC-ToolKit

# Install Plex
bash setup.sh -i plexmediaserver

# Install Sonarr
bash setup.sh -i sonarr

# Install Radarr
bash setup.sh -i radarr

# Install SABnzbd
bash setup.sh -i sabnzbdplus

# Install Deluge
bash setup.sh -i deluged

# Get access details for everything we installed
bash setup.sh -a plexmediaserver
bash setup.sh -a sonarr
bash setup.sh -a radarr
bash setup.sh -a sabnzbdplus
bash setup.sh -a deluged
