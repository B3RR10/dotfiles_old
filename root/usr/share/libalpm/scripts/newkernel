#!/bin/env sh
# Check if snapper is installed
command -v snapper >/dev/null 2>&1 || exit 1

# Get new Kernelversion
NEWKERNEL=$(pacman -Qi linux | grep Version | awk '{ print $3 }')

# Modify entry
sed -i "s|\(Arch Linux\) .*|\1 $NEWKERNEL|" /boot/loader/entries/1_current.conf

# Snapper Important Snapshot
snapper -c root create --cleanup number --userdata important=yes --description "$NEWKERNEL"
