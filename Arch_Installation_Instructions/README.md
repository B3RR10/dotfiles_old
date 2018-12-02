Arch Linux Installation
===

## Setup

### Partitions

\-  | Mountpoint | Format | Label
--- | ---        | ---    | ---
 p  | /boot      | fat32  | EFI
 p  | /          | btrfs  | ROOT

### Subvolumes

Btrfs ID 5 default sub      /btrfs

\-  | Volume     | Mountpoint
--- | ---        | ---
s   | @          | /
s   | @home      | /home
s   | @snapshots | /.snapshots
s   | @pkg       | /var/cache/pacman/pkg

### Snapshots

\-   | Snapshot  | Description
 --- | ---       | ---
s    | TESTING   | Arch Rolling
s    | STABLE    | last stable state
s    | OLDSTABLE | 2nd last stable state

### Booting images

\-                      | Image                         | Snapshot
 ---                    | ---                           | ---
vmlinuz-linux           | initramfs-linux.img           | @snapshots/TESTING
vmlinuz-linux-stable    | initramfs-linux-stable.img    | @snapshots/STABLE
vmlinuz-linux-oldstable | initramfs-linux-oldstable.img | @snapshots/OLDSTABLE

## Boot live iso

Boot stick with Arch iso in EFI mode

### Efi variables

Verify that the EFI variables appear:

    # efivar -l

### WLAN Conf

Check the interface name:

    # ip a

Set interface up:

    # ip link set INTERFACE up

Check if interface is up with `# ip a`

Connect to internet using wpa_supplicant:

    # wpa_supplicant -B -i INTERFACE -c <(wpa_passphrase SSID PASSPHRASE)
    # dhcpd INTERFACE

### Disk partitioning

List the block devices:

    # lsblk

Make partitions for the system device

Partition | Size  | Hex Code | Label | Description
---       | ---   | ---      | ---   | ---
1         | +250M | EF00     | EFI   | Boot partition
2         | +xG   | 8300     | ROOT  | Root partition
3         | +yG   | 8200     | SWAP  | Swap partition (optional, max: size of Ram)

    # gdisk /dev/sdX

Create a new partition table:

    > o

Create a new partition:

    > n

Print the results and save:

    > p
    > w

Check the new partitioned block device with `# lsblk`

Create the new partitions:

    # mkfs.vfat -F 32 -n EFI /dev/sdX1
    # mkfs.btrfs -L ROOT /dev/sdX2 [/dev/sdZA] // if RAID is wanted
    # mkswap -L SWAP /dev/sdX3
    # swapon /dev/sdX3

Check if swap is active with `# free -h`

### BTRFS subvolumes

Mount `ROOT` partition and change to the directory:

    # mount /dev/sdX2 /mnt
    # cd /mnt

Create the Btrfs subvolumes:

    # btrfs sub create @
    # btrfs sub create @home
    # btrfs sub create @pkg
    # btrfs sub create @snapshots

Check that they were created, get out of directory and unmount:

    # ls
    # cd
    # umount /mnt

Mount the root btrfs subvolume:

    # mount -o noatime[,compress=lzo],space_cache[,ssd],subvol=@ /dev/sdX2 /mnt

Create the subdirs for the other btrfs subvols:

    # mkdir -p /mnt/boot
    # mkdir -p /mnt/home
    # mkdir -p /mnt/var/cache/pacman/pkg
    # mkdir -p /mnt/.snapshots
    # mkdir -p /mnt/btrfs

Mount the other btrfs subvols:

    # mount -o noatime[,compress=lzo],space_cache[,ssd],subvol=@home /dev/sdX2 /mnt/home
    # mount -o noatime[,compress=lzo],space_cache[,ssd],subvol=@pkg /dev/sdX2 /mnt/var/cache/pacman/pkg
    # mount -o noatime[,compress=lzo],space_cache[,ssd],subvol=@snapshots /dev/sdX2 /mnt/.snapshots
    # mount /dev/sdX1 /mnt/boot
    # mount -o noatime[,compress=lzo],space_cache[,ssd],subvolid=5 /dev/sdX2 /mnt/.snapshots

Check for the mounted devices with `# df -Th`

## Installation

### Pacstrap

    # pacstrap /mnt base base-devel btrfs-progs dosfstools bash-completion wpa_supplicant

### Generate fstab

    # genfstab -Lp /mnt >> /mnt/etc/fstab

Check the generated fstab with `# cat /mnt/etc/fstab`

### Change root to /mnt

    # arch-chroot /mnt

### Basic system configuration

Set hostname:

    # echo myhost > /etc/hostname

Set language variables:

    # echo LANG=en_US.UTF-8 >  /etc/locale.conf
    # echo LANGUAGE=en_US   >> /etc/locale.conf
    # echo LC_COLLATE=C     >> /etc/locale.conf

Set timezone:

    # ln -fs /usr/share/zoneinfo/Europe/Berlin /etc/localtime

Set locales:

    > /etc/locale.gen

    # Remove comment
    en_US.UTF-8 UTF-8

Generate locales:

    # locale-gen

### Pacman configuration

Activate x86 support and colored console in pacman:

    > /etc/pacman.conf

    # Remove comments for color
    color

    # Remove comments for multilib
    [multilib]
    Include = /etc/pacman.d/mirrorlist

Update system:

    # pacman -Syu

### Change initcpio (if using RAID)

Edit config file:

    > /etc/mkinitcpio.conf

    # Edit the hooks: Remove fsck, Add btrfs
    HOOKS="base udev autodetect modconf block btrfs filesystems keyboard"

Generate initcpio:

    # mkinitcpio -p linux

### Set root password (optional)

    # passwd

### Bootloader

Install bootloader:

    # bootctl --path=/boot install

Edit entry list:

    > /boot/loader/loader.conf

    default   arch
    timeout   4
    editor    0

Edit the entries:

    > /boot/loader/entries/arch.conf

    title     Arch Linux Btrfs
    linux     /vmlinuz-linux
    initrd    /initramfs-linux.img
    options   root=LABEL=ROOT rootflags=subvol=@ rw

### Window Manager

#### Xorg

Install X:

    # pacman -S xorg-server xorg-xinit xorg-xbacklight
    # pacman -S xf86-video-intel

#### i3

Install i3:

    # pacman -S i3 dmenu rofi termite

Install login manager:

    # pacman -S lightdm lightdm-gtk-greeter

### WLAN Conf

##### wpa_supplicant

Create a wpa_supplicant config file with the interface that is going to be used:

    > /etc/wpa_supplicant/wpa_supplicant-INTERFACE.conf

    # Giving configuration update rights to wpa_cli
    ctrl_interface=/run/wpa_supplicant
    ctrl_interface_group=wheel
    update_config=1

    # AP scanning
    ap_scan=1

Set the wlan:

    # wpa_passphrase SSID "PASSPHRASE" >> /etc/wpa_supplicant/wpa_supplicant-INTERFACE.conf

Enable wpa_supplicant at boot:

    # systemctl enable wpa_supplicant@INTERFACE.service

#### systemd-networkd

Create the systemd-networkd config files

For wired network:

    > /etc/systemd/networkd/20-wired.network

    [Match]
    Name=WIRED-INTERFACE

    [Network]
    DHCP=ipv4

    [DHCP]
    RouteMetric=10

For wireless network:

    > /etc/systemd/network/25-wireless.network

    [Match]
    Name=INTERFACE

    [Network]
    DHCP=ipv4

    [DHCP]
    RouteMetric=20

Enable at boot:

    # systemctl enable systemd-networkd.service
    # systemctl enable systemd-resolved.service

### Other packages and services

Install other usefull services

    # pacman -S acpid dbus avahi --needed

Enable at boot:

    # systemctl enable acpid
    # systemctl enable avahi-daemon

Enable time sync:

    # systemctl enable systemd-timesyncd
    # systemctl start systemd-timesyncd

Check date with `date` and sync hw clock with `hwclock -w`

Enable login manager:

    # systemctl enable lightdm.service

Create the keyboard x config:

    # localectl set-x11-keymap us pc105 altgr-intl

Create touchpad config:

    > /etc/X11/xorg.conf.d/30-touchpad.conf

    Section "InputClass"
        Identifier "touchpad"
        Driver "libinput"
        MatchIsTouchpad "on"
        Option "Tapping" "on"
        Option "TappingButtonMap" "lrm"
    EndSection

### Add user

Install zsh and git

    # pacman -S zsh zsh-completions zsh-lovers git

Add new user and set password:

    # useradd -m -g users -G wheel,audio,video,power -s /bin/zsh USERNAME
    # passwd USERNAME

Config wheel group in the sudoers file

    # visudo
    > sudoers file

    # Remove comment
    %wheel ALL=(ALL) ALL

Exit chroot, umount disks and reboot

    # exit
    # umount -R /mnt
    # reboot

---
## User configuration

Reboot and login as the new user

### Deactivate root account

Test that `sudo su` works

    $ sudo su

Deactivate root account

    # passwd -l root
    # exit

### Restore backuped files

Mount disk with the backuped files

    $ sudo mount -o uid=$(id -u USERNAME),gid=$(id -g USERNAME) /dev/sdX1 /mnt

#### Restore ssh files

Copy files:

    $ cp -r /mnt/.ssh $HOME/

Adjust permissions:

    $ chmod 700 $HOME/.ssh
    $ chmod 600 $HOME/.ssh/*
    $ chmod 644 $HOME/.ssh/*.pub

#### Restore .dotfiles

    $ git clone DOTFILES.GIT(git@github.com:miguelberrio91/dotfiles.git) .dotfiles
    $ cd .dotfiles
    $ ./make

Change the network interface name in the polybar config

    > $HOME/.config/polybar/config

    ...
    [module/wlan]
    type = ...
    interface = INTERFACE
    ...
    [module/eth]
    type = ...
    interface = WIRED-INTERFACE

Add location permissions for redshift

    > /etc/geoclue/geoclue.conf

    ...
    ; Add to the end of the file
    [redshift]
    allowed=true
    system=false
    users=

#### Restore pgp keys

Copy files:

    $ cp -r /mnt/.gnupg $HOME/

Adjust permissions:

    $ chmod 700 $HOME/.gnupg
    $ find $HOME/.gnupg -type d -exec chmod 700 {} \;
    $ find $HOME/.gnupg -type f -exec chmod 600 {} \;

Import secret keys:

    $ gpg --import /mnt/secret-key.gpg

#### Firefox profile

Copy files:

    $ cp -r /mnt/.mozilla $HOME/

Open the firefox profile manager and create a new profile that uses the copied directory under .mozilla/firefox/xxxxxxxx.default

    # firefox -p

### Pass repository

Find the pass secret key and initialize a pass repository with it

    $ gpg --list-secret-keys
    $ pass init PGP-Key

Initialize git in the pass repository and pull passwords

    $ pass git init
    $ pass git remote add origin REPO-URL(git@gitlab.com:miguelberrio91/Personal-Passwords.git)
    $ pass git fetch
    $ pass git branch --set-upstream-to=origin/master master
    $ pass git reset --hard @{u}
    $ pass git pull

---

## Btrfs snapshots and misc

Change to root:

    $ sudo su

### Configure the snapshot TESTING

Check the existent subvols

    # btrfs sub list /btrfs/

Create a snapshot of system

    # btrfs sub snap / /.snapshots/TESTING

Check that the snapshot was created with `btrfs  sub list /btrfs/`

Edit the config of the entry in boot:

    > /boot/loader/entries/arch.conf

    title   Arch Linux Btrfs Lts
    linux   /vmlinuz-linux-lts
    initrd  /initramfs-linux-lts.img
    options root=LABEL=ROOT rootflags=subvol=@snapshots/TESTING rw

Edit the fstab on the snapshot (the other entries can be cleaned removing the multiple subvol and subvolid and leaving only the subvol=@...)

    > /.snapshots/TESTING/etc/fstab

    LABEL=ROOT    /    btrfs    rw,noatime,ssd,space_cache,subvol=@snapshots/TESTING    0 0


Reboot and test that the snapshot is loaded

    # reboot

Check that the `subvol=@snapshots/TESTING` is mounted in /dev/sdX2

    $ mount

### Set the STABLE and OLDSTABLE subvolumes

Change again tu root

    $ sudo su

Create the STABLE and OLDSTABLE snapshots

    # btrfs sub snap / /.snapshots/STABLE
    # btrfs sub snap / /.snapshots/OLDSTABLE

Check that the snapshots were created with `btrfs  sub list /btrfs/`

Create the boot images for the snapshots

    # cd /boot
    # cp vmlinuz-linux vmlinuz-linux-stable
    # cp vmlinuz-linux vmlinuz-linux-oldstable
    # cp initramfs-linux.img initramfs-linux-stable.img
    # cp initramfs-linux.img initramfs-linux-oldstable.img

Create the new entries for the bootloader

    # cd /boot/loader/entries
    # cp arch.conf barch.conf
    # cp arch.conf carch.conf

Edit the files

    > /boot/loader/entries/barch.conf

    title   Arch Linux Stable
    linux   /vmlinuz-linux-stable
    intrd   /initramfs-linux-stable.img
    options root=LABEL=ROOT rootflags=subvol=@snapshots/STABLE rw

and

    > /boot/loader/entries/carch.conf

    title   Arch Linux Old-Stable
    linux   /vmlinuz-linux-oldstable
    intrd   /initramfs-linux-oldstable.img
    options root=LABEL=ROOT rootflags=subvol=@snapshots/OLDSTABLE rw

Edit the corresponding fstabs (change the root subvol to the snapshot)

    > /.snapshots/STABLE/etc/fstab

    LABEL=ROOT    /    btrfs    rw,noatime,ssd,space_cache,subvol=@snapshots/STABLE    0 0

and

    > /.snapshots/OLDSTABLE/etc/fstab

    LABEL=ROOT    /    btrfs    rw,noatime,ssd,space_cache,subvol=@snapshots/OLDSTABLE  0 0

Reboot, boot with the other snapshots and check with `mount` that the `subvol=@snapshots/SNAPSHOT` is mounted in /dev/sdX2




###

---
Reboot and enjoy!

