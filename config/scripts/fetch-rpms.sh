mkdir -p /tmp/rpms

# curl -Lo /tmp/rpms/mullvad-vpn.rpm https://mullvad.net/en/download/app/rpm/latest --max-redirs 1

curl -Lo /tmp/rpms/virtio-win.rpm https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/archive-virtio/virtio-win-0.1.229-1/virtio-win-0.1.229-1.noarch.rpm
# curl -Lo /tmp/rpms/mfcj5320dwlpr.rpm http://download.brother.com/welcome/dlf101593/mfcj5320dwlpr-3.0.1-1.i386.rpm
# curl -Lo /tmp/rpms/mfcj5320dwcups.rpm http://download.brother.com/welcome/dlf101594/mfcj5320dwcupswrapper-3.0.1-1.i386.rpm

echo "Installing RPMS from /tmp/rpms"
# install rpms from /tmp/rpms
rpm-ostree install \
    /tmp/rpms/*.rpm
