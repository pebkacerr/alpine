#!/bin/sh

# Installing distrobox

apk add distrobox
rc-update add cgroups
rc-service cgroups start

modprobe tun
echo tun >> /etc/modules
echo dan:100000:65536 > /etc/subuid
echo dan:100000:65536 > /etc/subgid

## Installing sound system

apk add \
	wireplumber \
	pipewire-alsa \
	pipewire-pulse \
	gst-plugin-pipewire \
	alsa-utils \
	pavucontrol

## Installing network manager

apk add networkmanager \
	network-manager-applet

# systemctl enable NetworkManager.service

## Installing power saving system

apk add acpid

## Installing bluetooth system

apk add \
	bluez \
	bluez-utils \
	blueman

# systemctl enable bluetooth.service

## Installing system fonts

apk add \
	ttf-font-awesome \
	ttf-nerd-fonts-symbols \
	ttf-cascadia-code-nerd

## Installing utilities

apk add \
	btop \
	neovim \
	starship \
	bitwarden \
	font-manager \
	polkit-gnome

