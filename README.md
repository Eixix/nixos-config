# nixos-config

## ✔️  TOODs
- [ ] pinentry theme
- [ ] login screen
- [ ] spotify in waybar?
- [ ] cursor theme
- [ ] notifications
- [ ] boot screen

## 💽 Installation

### Variables
```bash
export DISK=nvme0n1
export PART1=nvme0n1p1
export PART2=nvme0n1p2
export HOST=titania
export LOCATION=/mnt/nixos-config
```

### Live USB
#### Show current disks
```bash
lsblk
```

#### partition disk
```bash
parted /dev/$DISK -- mklabel gpt
parted /dev/$DISK -- mkpart primary 512MiB 100%
parted /dev/$DISK -- mkpart ESP fat32 1MiB 512MiB
parted /dev/$DISK -- set 2 esp
mkfs.ext4 -L nixos /dev/$PART1
mkfs.fat -F 32 -n boot /dev/$PART2
```

#### Mount
```bash
mount /dev/disk/by-label/nixos /mnt
mkdir -p /mnt/boot
mount /dev/disk/by-label/boot /mnt/boot
```

#### Clone repository
```bash
nix-env -iA nixos.git
git clone https://github.com/Kibadda/nixos-config $LOCATION
```

#### Create hardware-configuration.nix
Only do this if host does not have hardware-configuration.nix yet\
Should be stored in git
```bash
nixos-generate-config --root /mnt
cp /mnt/etc/nixos/hardware-configuration.nix $LOCATION/hosts/$HOST/.
rm -rf /mnt/etc/nixos
```

#### Install
```bash
cd $LOCATION
nixos-install --flake .#$HOST
sudo mv $LOCATION /home/michael/.nixos-config
```

#### After first login
change passwords
```bash
passwd
sudo passwd root
```

load gpg key and trust ultimately
```bash
gpg --keyserver keys.gnupg.net --recv-keys $KEYID
gpg --edit-key $KEYID # trust -> 5 -> y -> quit
```

enable yubikey-touch-detector socket
```bash
systemctl --user enable --now yubikey-touch-detector.socket
```

change ownership of this repository
```bash
sudo chown -R michael:users /home/michael/.nixos-config
```

change remote url
```bash
git remote set-url origin git@github.com:Kibadda/nixos-config
```

add u2f keys
```bash
./.nixos-config/add_u2f_keys.sh
```

init submodule
```bash
git submodule update --init nvim
```

add wlan
```bash
nmcli device wifi list
nmcli device witi connect
```
