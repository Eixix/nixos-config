# nixos-config

## Installation
### Live USB
```bash
parted /dev/nvme0n1 -- mklabel gpt
parted /dev/nvme0n1 -- mkpart primary 512MiB 100%
parted /dev/nvme0n1 -- mkpart ESP fat32 1MiB 512MiB
parted /dev/nvme0n1 -- set 2 esp
mkfs.ext4 -L nixos /dev/nvme0n1p1
mkfs.fat -F 32 -n boot /dev/nvme0n1p2

mount /dev/disk/by-label/nixos /mnt
mkdir -p /mnt/boot
mount /dev/disk/by-label/boot /mnt/boot

nixos-generate-config --root /mnt
nix-env -iA nixos.git

git clone https://github.com/Kibadda/nixos-config /mnt/etc/nixos/nixos-config

cp /mnt/etc/nixos/hardware-configuration.nix /mnt/etc/nixos/nixos-config/hosts/titania/.

cd /mnt/etc/nixos/nixos-config
nixos-install --flake .#titania
```
