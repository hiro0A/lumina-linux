#!/bin/bash

set -ouex pipefail

cp -avf "/ctx/system_files"/. /

chmod 0755 /usr/bin/lumina-first-login
chmod 0755 /usr/bin/lumina-first-setup

install -d -m 0755 /usr/share/lumina/migration
install -d -m 0755 /etc/systemd/zram-generator.conf.d

# bootc-image-builder resolves repository GPG key URLs outside the source
# container. Keep GPG verification enabled while making Terra keys reachable.
shopt -s nullglob
for repo_file in /etc/yum.repos.d/terra*.repo; do
    sed -Ei 's|^gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-(terra[^[:space:]]*)$|gpgkey=https://repos.fyralabs.com/\1/key.asc|' "${repo_file}"
done
shopt -u nullglob
