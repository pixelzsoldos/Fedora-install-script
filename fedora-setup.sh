#!/bin/bash


# Fedora Post Install Script

# System update
sudo dnf upgrade --refresh -y

# Install Flatpak
sudo dnf install -y flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install basic packages
sudo dnf install -y \
    curl \
    git \
    zsh \
    gnome-tweaks \
    gnome-shell-extension-manager

# Install popular applications via Flatpak
flatpak install -y flathub \
    org.videolan.VLC \
    com.spotify.Client \
    com.visualstudio.code \
    com.brave.Browser \
    com.discordapp.Discord \
    org.telegram.desktop \
    com.obsproject.Studio \
    com.valvesoftware.Steam

# Install Google Chrome
wget -q -O /tmp/google-chrome.rpm https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
sudo dnf install -y /tmp/google-chrome.rpm
rm /tmp/google-chrome.rpm

echo "Installation complete! A system restart is recommended." 