#!/bin/bash
mv /tmp/puma-init /usr/bin/&&chmod +x /usr/bin/puma-init
mv /tmp/puma.service /etc/systemd/system/&&systemctl enable puma.service
systemctl is-enabled puma.service
