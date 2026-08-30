#!/bin/bash

set -ouex pipefail

cp -avf "/ctx/system_files"/. /

chmod 0755 /usr/bin/lumina-first-login
chmod 0755 /usr/bin/lumina-first-setup

install -d -m 0755 /usr/share/lumina/migration
install -d -m 0755 /etc/systemd/zram-generator.conf.d
