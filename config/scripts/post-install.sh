#!/bin/sh

set -ouex pipefail

systemctl disable rpm-ostreed-automatic.timer
systemctl disable flatpak-system-update.timer

systemctl --global disable flatpak-user-update.timer

sed -i 's/stage/none/g' /etc/rpm-ostreed.conf
sed -i 's/check/none/g' /etc/rpm-ostreed.conf

systemctl enable docker.service
systemctl enable podman.socket
systemctl enable --global silberblau-user-vscode.service
