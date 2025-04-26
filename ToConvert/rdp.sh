#!/bin/bash

sudo apt update && \
	sudo apt install gnome-remote-desktop winpr-makecert

# Generate the Certificate and Key Using OpenSSL
mkdir -p ~/.local/share/gnome-remote-desktop/
openssl req -x509 -newkey rsa:2048 -keyout ~/.local/share/gnome-remote-desktop/rdp-tls.key -out ~/.local/share/gnome-remote-desktop/rdp-tls.crt -nodes

# Verify 
openssl x509 -in ~/.local/share/gnome-remote-desktop/rdp-tls.crt -text -noout
openssl rsa -in ~/.local/share/gnome-remote-desktop/rdp-tls.key -check

# Set the Files in GNOME Remote Desktop
grdctl rdp set-tls-cert ~/.local/share/gnome-remote-desktop/rdp-tls.crt
grdctl rdp set-tls-key ~/.local/share/gnome-remote-desktop/rdp-tls.key
# Set the credentials for RDP access
grdctl rdp set-credentials "<username>" "<password>"
grdctl rdp disable-view-only

# Enable GNOME Remote Desktop Service
sudo systemctl enable --now gnome-remote-desktop.service
# Verify GNOME Remote Desktop Service being enabled
systemctl status gnome-remote-desktop.service

# Restart genome-remote-desktop service 
systemctl --user daemon-reload
sudo systemctl restart gnome-remote-desktop.service

grdctl rdp enable



