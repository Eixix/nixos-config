{ pkgs, lib, user, ... }:

{
  imports = [
    ../../modules/hyprland
    ./hardware-configuration.nix
  ];

  # Bootloader
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  # nmcli device wifi connect <SSID> password <PASSWORD>
  networking.networkmanager.enable = true;
}
